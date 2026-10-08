function fup --wraps='flatpak update' --description 'alias fup=flatpak update'
    flatpak update $argv
end
