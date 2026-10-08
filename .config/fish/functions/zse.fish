function zse --wraps='zypper se -s' --description 'alias zse=zypper se -s'
    zypper se -s $argv
end
