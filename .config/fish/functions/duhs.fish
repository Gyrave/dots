function duhs --wraps='du -ahx --max-depth=1 /var | sort -k1 -rh' --wraps='du -ahx --max-depth=1 . | sort -k1 -rh' --description 'alias duhs=du -ahx --max-depth=1 . | sort -k1 -rh'
    du -ahx --max-depth=1 . | sort -k1 -rh $argv
end
