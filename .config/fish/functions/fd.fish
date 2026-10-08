function fd --wraps='ls | grep ' --wraps='ls | grep --ignore-case ' --description 'alias fd=ls | grep --ignore-case '
    ls | grep --ignore-case  $argv
end
