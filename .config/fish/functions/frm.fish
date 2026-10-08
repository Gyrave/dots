function frm --wraps='flatpak remove --delete-data' --description 'alias frm=flatpak remove --delete-data'
    flatpak remove --delete-data $argv
end
