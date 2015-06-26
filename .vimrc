set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set cindent
set nu
set hlsearch
set backspace=2
filetype plugin on
"store more history
set history=200
" set the wild menu
set wildmenu 
set wildmode=full
"vim-markdown
let g:vim_markdown_math=1
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd
let g:vim_markdown_folding_disabled=1
 "
"omniComplete 配置
"-- omnicppcomplete setting --
set completeopt=longest,menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1
"提示菜当的默认颜色主题配置
"highlight Pmenu guibg=darkgrey guifg=red
"highlight PmenuSel guibg=lightred guifg=black 

"nerdcommenter 注释
let g:mapleader = ","

"neocomplacache
let g:neocomplcache_enable_at_startup = 1  
let g:neocomplcache_enable_auto_select = 1 

" clang_complete setting
let g:clang_library_path='/usr/local/lib'
let g:clang_auto_select=1"select first one but not insert into
"let g:clang_complete_copen=1
let g:clang_complete_auto=1
let g:clang_hl_errors=1
let g:clang_periodic_quickfix=1
let g:clang_snippets=1
let g:clang_close_preview=1
let g:clang_use_library=1
let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'
"


"添加omniComplete的cpp标准库路径
set tags+=~/cppTags/cppTags
set tags+=~/cppTags/qtTags
set tags+=~/cppTags/cppunitTags
" 定义文件浏览器的使用
"let g:winManagerWindowLayout='FileExplorer|TagList'

"配置cscope
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add cscope.out
	endif
	set csverb
endif
"set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>


"QuickFix的快捷键设置
nmap <F6> :cn<cr>
nmap <F7> :cp<cr>


"miniBuf的配置
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplMapWindowNavArrows = 1

"a.vim的配置
nnoremap <silent> <F2> :A<CR>

set nocompatible               " be iMproved
"filetype off                   " required!
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
	 
	" let Vundle manage Vundle
	" required!
	Bundle 'gmarik/vundle'
	 
	" My Bundles here:
	"
	" original repos on github
	Bundle 'tpope/vim-fugitive'
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
	Bundle 'tpope/vim-rails.git'
	Bundle 'godlygeek/tabular'
	Bundle 'plasticboy/vim-markdown'
	Bundle 'altercation/vim-colors-solarized'
	Bundle 'tomasr/molokai'
	Bundle 'scrooloose/nerdcommenter'
	" vim-scripts repos
	Bundle 'L9'
	Bundle 'neocomplcache'
	Bundle 'echofunc.vim'
	Bundle 'omnicppcomplete'
	Bundle 'FuzzyFinder'
	Bundle 'taglist.vim'
	Bundle 'Valloric/ListToggle'
	Bundle 'scrooloose/syntastic'
	Bundle 'a.vim'
	Bundle 'c.vim'
	Bundle 'The-NERD-tree'
	"Bundle 'Valloric/YouCompleteMe'
	" non github repos
	Bundle 'git://git.wincent.com/command-t.git'
	Bundle 'https://github.com/Lokaltog/vim-powerline.git'
	" ...
	 
	filetype plugin indent on     " required!
	"
	" Brief help  -- 此处后面都是vundle的使用命令
	" :BundleList          - list configured bundles
	" :BundleInstall(!)    - install(update) bundles
	" :BundleSearch(!) foo - search(or refresh cache first) for foo
	" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
	"
	" see :h vundle for more details or wiki for FAQ
	" NOTE: comments after Bundle command are not allowed..


" vim-powerline插件
set laststatus=2
set t_Co=256
let g:Powerline_symbols = 'unicode'
set encoding=utf8

"colorful theme
"syntax enable
"set background=dark
"colorscheme solarized
"let g:solarized_termcolors=256
syntax on  
colorscheme molokai
set term=screen-256color
"set background=dark

"设置ctags的映射按键
map <F12> :!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
map <F8> :!cscope -Rbq<CR>:cs kill cscope.out<CR> :cs add cscope.out<CR>

"设置Tlist的快捷按键
map <F4> :Tlist<CR>

"设置NERDtree的快捷按键
map <F3> :NERDTree<CR>

"执行当前的脚本文件
map <F5> :!./%<CR>


" set the cursor color
set cursorline 
set cursorcolumn 
hi CursorLine  cterm=NONE   ctermbg=236" ctermfg=white
hi CursorColumn cterm=NONE ctermbg=darkgrey ctermfg=white

"Taglist配置
let Tlist_Show_One_File=1               " only show current file’s taglist
let Tlist_Exit_OnlyWindow=1             " if taglist is of the last windows, exit vim
let Tlist_Use_Right_Window=1            " show taglist at right
let Tlist_File_Fold_Auto_Close=1        " hide taglist if it’s not for current file

"自动补全括号
"inoremap ( ()<ESC>i
"inoremap [ []<ESC>i
"inoremap { {}<ESC>i
"inoremap < <><ESC>i

