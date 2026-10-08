function imgtopdf --wraps="magick '*.{png,jpeg}' -quality 100 outfile.pdf" --description "alias imgtopdf=magick '*.{png,jpeg}' -quality 100 outfile.pdf"
    magick '*.{png,jpeg}' -quality 100 outfile.pdf $argv
end
