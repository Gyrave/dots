function ytmp3 --wraps='yt-dlp -x --embed-thumbnail --embed-metadata' --description 'alias ytmp3=yt-dlp -x --embed-thumbnail --embed-metadata'
    yt-dlp -x --embed-thumbnail --embed-metadata $argv
end
