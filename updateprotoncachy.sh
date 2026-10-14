# Make a temporary working directory
echo "Making sure temporary directory exists..."
mkdir -p /tmp/proton-ge-cachy
cd /tmp/proton-ge-cachy

steam_dir=~/.steam/steam

# Verify Steam data directory exists
if [[ ! -d "$steam_dir" ]]; then
    echo "Error: Steam (native) data directory not found." >&2
    echo "Please launch Steam at least once to populate it." >&2
    exit 1
fi

# Make a Steam compatibility tools folder if it does not exist
mkdir -p "$steam_dir/compatibilitytools.d"

# Fetch release info
echo "Fetching release info..."
release_json=$(curl -s --max-time 10 \
    https://api.github.com/repos/CachyOS/proton-cachyos/releases/latest)

if [[ -z "$release_json" || "$release_json" != *'"tag_name"'* ]]; then
    echo "Error: Failed to fetch release info from GitHub." >&2
    exit 1
fi

# Resolve release URL for current architecture
echo "Fetching release for your arch..."

case "$(uname -m)" in
    aarch64|arm64) tarball_pattern='\-aarch64\.tar\.xz$' ;;
    x86_64)        tarball_pattern='\-x86_64_v3\.tar\.xz$' ;;
    *)
        echo "Error: Unsupported architecture: $(uname -m)." >&2
        echo "Cachy-Proton is only available for x86_64 and aarch64." >&2
        exit 1
        ;;
esac

tarball_url=$(echo "$release_json" |
    grep browser_download_url |
    cut -d\" -f4 |
    grep -E "$tarball_pattern" |
    head -n1 || true)

tarball_name=$(basename "$tarball_url")
release_name=${tarball_name%.tar.gz}

if [[ -z "$tarball_url" ]]; then
    echo "Error: Could not find a matching release for your arch ($(uname -m))." >&2
    exit 1
fi

# Skip if already installed
if [[ -d "$steam_dir/compatibilitytools.d/$release_name" ]]; then
    echo "Latest release $release_name is already installed."
    exit 0
fi

# Nuke the temporary working directory and download the tarball
echo "Cleaning temporary directory..."
rm -rf /tmp/proton-ge-cachy
mkdir /tmp/proton-ge-cachy
cd /tmp/proton-ge-cachy
echo "Downloading release: $release_name..."
curl -L "$tarball_url" -o "$tarball_name" --progress-bar
echo "Verifying download..."

# Extract the GE-Proton tarball to the Steam compatibility tools folder
echo "Extracting $tarball_name to the Steam compatibility tools folder..."
tar -xf "$tarball_name" -C "$steam_dir/compatibilitytools.d/" \
    || { echo "Error: Extraction failed!" >&2; exit 1; }

echo "Done :)"
