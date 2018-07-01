"============================================================
" Plugins
"============================================================
" List of plugins that I use:
" + ctrlp
" + vim-airline
" + dracula colour theme
" + nerdtree
" + pathogen
" + typescript-vim
" + vim-jsx-improve
" + vim-multiple-cursors
"
" I'm definitely trying to stay minimal and seeing how it goes <3

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-airline/plugin/airline.vim

"============================================================
" noopkat settings
"============================================================
syntax on
"color dracula
set smartindent
set clipboard=unnamed " use os clipboard
set shiftwidth=2 " number of spaces when shift indenting
set tabstop=2 " number of visual spaces per tab
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tab to spaces
set number " show line numbers
set cursorline  " highlight current line
set showmatch " highlight matching [{()}]
set incsearch " search as characters are entered
set hlsearch " highlight matches
let g:ctrlp_working_path_mode = 'r' " I copy and paste from other software a lot
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/* " lol
let g:ctrlp_show_hidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoquit if only nerdtree is open
set noswapfile
let g:jsx_ext_required = 0

" airline
"let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' ❤  '
let g:airline_right_sep = ' 🟆  '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
set laststatus=2 " for airline
"============================================================
" Mappings
"============================================================
" ctrl-p plugin shortcut
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" move between buffers
map <C-Left> <Esc>:bprev<CR>
map <C-Right> <Esc>:bnext<CR>

" Nerd Tree toggling
map <C-b> :NERDTreeToggle<CR>

" Nerd Tree colors
" Taken from https://github.com/scrooloose/nerdtree/issues/433#issuecomment-92590696
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" move lines up and down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" switch to left / right split (mostly for Nerd Tree)
map <C-h> <C-W>h
map <C-l> <C-W>l
"============================================================
" Start pathogen
"============================================================
execute pathogen#infect()
call pathogen#helptags()

set noruler
set noshowmode
