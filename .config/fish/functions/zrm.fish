function zrm --wraps='sudo zypper rm --clean-deps' --description 'alias zrm=sudo zypper rm --clean-deps'
    sudo zypper rm --clean-deps $argv
end
