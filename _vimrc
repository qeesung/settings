set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set nobackup " 防止产生备份文件
set autoindent " 设置自动缩进
set ts=4 "　设置tab键的大小
set guifont=Monaco:h13 " 设置字体
set nu! " 设置行号

" 设置光标在在一般模式下面的样式
"highlight MyCursorNVC gui=reverse guifg=RED guibg=NONE
"set guicursor=n-v-c:hor10-MyCursorNVC
"" 设置光标在在插入模式下面的样式
"highlight MyCursorNVC gui=reverse guifg=RED guibg=NONE
"set guicursor=i:hor10-MyCursorNVC

" 设置编码格式
if has("multi_byte") 
    " UTF-8 编码 
    set encoding=utf-8 
    set termencoding=utf-8 
    set formatoptions+=mM 
    set fencs=utf-8,gbk 
    if v:lang =~? '^/(zh/)/|/(ja/)/|/(ko/)' 
        set ambiwidth=double 
    endif 
    if has("win32") 
        source $VIMRUNTIME/delmenu.vim 
        source $VIMRUNTIME/menu.vim 
        language messages zh_CN.utf-8 
    endif 
else 
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte" 
endif


set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

filetype off
"Vundle的路径
set rtp+=$VIM/vimfiles/bundle/Vundle.vim
"插件的安装路径
call vundle#begin('$VIM/vimfiles/bundle/')
 
" 插件的安装
Plugin 'gmarik/Vundle.vim' " 管理插件的插件
Plugin 'L9' " L9是一个vim-script的库
Bundle 'taglist.vim'  
Bundle 'bling/vim-airline' 
Bundle 'Valloric/ListToggle'
Bundle 'scrooloose/syntastic' 
Bundle 'plasticboy/vim-markdown' 
Bundle 'javacomplete.vim' 
Bundle 'java_parser.vim' 

"Bundle 'altercation/vim-colors-solarized'
Bundle 'tomasr/molokai'
Bundle 'OmniCppComplete'
"Bundle 'c.vim'
Bundle 'a.vim'
Bundle 'The-NERD-tree'
Bundle 'neocomplcache'
Bundle 'scrooloose/nerdcommenter'


" 更新一次当前目录下面的tags
map <F12> :!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
"设置Tlist的快捷按键
map <F4> :Tlist<CR>
"Taglist配置
let Tlist_Show_One_File=1               " only show current file’s taglist
let Tlist_Exit_OnlyWindow=1             " if taglist is of the last windows, exit vim
let Tlist_Use_Right_Window=1            " show taglist at right
let Tlist_File_Fold_Auto_Close=1        " hide taglist if it’s not for current file
"设置NERDtree的快捷按键
map <F3> :NERDTree<CR>
"a.vim的配置
nnoremap <silent> <F2> :A<CR>
call vundle#end()
filetype plugin indent on

" 突出显示当前行
set cursorline              

"Toggle Menu and Toolbar 隐藏菜单个工具栏
set guioptions-=m
set guioptions-=T
map <silent> <F5> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
"full screenthe gvim 全屏显示
if has('gui_running') && has("win32")
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif
imap <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
au GUIEnter * simalt ~x


if has("gui_running")
    au GUIEnter * simalt ~x  " 窗口启动时自动最大化
    "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
    "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
    "set guioptions-=m       " 隐藏菜单栏
    "set guioptions-=T        " 隐藏工具栏
    set guioptions-=L       " 隐藏左侧滚动条
    set guioptions-=r       " 隐藏右侧滚动条
    set guioptions-=b       " 隐藏底部滚动条
    set showtabline=0       " 隐藏Tab栏
endif

"配置cscope
if has("cscope")
"	set csprg=/usr/bin/cscope
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

"添加omniComplete的cpp标准库路径
set tags+=~/cppTags/cppTags
set tags+=~/cppTags/qtTags
set tags+=~/cppTags/cppunitTags

"powerline
set laststatus=2
let g:Powerline_symbols='unicode'
"开启光亮光标行
set cursorline
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"开启高亮光标列
set cursorcolumn
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white


" 设置新的主题
"syntax enable
"set background=dark
"colorscheme solarized
colorscheme molokai 

"自动补全的设置
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

"vim airline 配置
let g:airline_powerline_fonts = 1


