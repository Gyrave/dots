function ytmp3p --wraps='yt-dlp -x --embed-thumbnail --embed-metadata --yes-playlist' --description 'alias ytmp3p=yt-dlp -x --embed-thumbnail --embed-metadata --yes-playlist'
    yt-dlp -x --embed-thumbnail --embed-metadata --yes-playlist $argv
end
