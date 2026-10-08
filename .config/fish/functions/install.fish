function install --wraps='sudo zypper in' --description 'alias install=sudo zypper in'
    sudo zypper in $argv
end
