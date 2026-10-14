set number!
set ignorecase
set hlsearch
set syntax
set noswapfile
set nobackup
set nowb
set shortmess=aF

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Linebreak on 500 characters
set lbr
set tw=500

""keybinds""

map <C-z> u
map <Space> /
map <C-w> 0
map <C-e> $

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

