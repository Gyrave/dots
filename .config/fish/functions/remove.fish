function remove --wraps='sudo zypper rm --clean-deps' --description 'alias remove=sudo zypper rm --clean-deps'
    sudo zypper rm --clean-deps $argv
end
