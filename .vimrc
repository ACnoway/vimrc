"关闭vi
set nocompatible
filetype plugin on
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'luochen1990/rainbow'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'wakatime/vim-wakatime'
Plug 'yggdroot/indentline'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'SirVer/ultisnips'
" 你自己的代码仓库 git 地址
Plug 'ACnoway/vim-snippets'
call plug#end()
"透明背景
"let g:gruvbox_transparent_bg = '1'
" autocmd vimenter * ++nested colorscheme gruvbox
colorscheme dracula

let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_extensions = []
let g:airline#extensions#tabline#enabled = 1                " 设置开启tab样式
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'  " 设置默认tab栏样式
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty= '⚡'

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" 按下 F2 调出/隐藏 NERDTree
map <F2> :silent! NERDTreeToggle<cr>
" 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
let g:NERDTreeFileLines = 1

let g:UltiSnipsExpandTrigger="<tab>"
" 使用 tab 切换下一个触发点，shit+tab 上一个触发点
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
let g:UltiSnipsEditSplit="vertical"

let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"高亮
syntax enable
syntax on
"状态栏
set laststatus=2
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)
"行号
set nu
"高亮当前行
set cul
"tab为4空格
set ts=4
"缩进为4空格
set sw=4
"tab转为空格
set et
"继承上一行空格
set smartindent
"自动缩进
set autoindent
"括号匹配
set sm
"切换粘贴模式
set pastetoggle=<F9>
"深色主题
set background=dark
set wildmenu             " 开启zsh支持
set wildmode=full        " zsh补全菜单
set mouse=a              " 开启鼠标支持
set ignorecase          " 设置忽略大小写
set smartcase           " 设置智能大小写
set ruler               " 设置显示当前位置
filetype on			" 开启文件类型检测
filetype plugin indent on  " 开启文件类型插件检测
set autochdir            " 移至当前文件所在目录，简写为 :set acd
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
set wildmenu             " 开启zsh支持
set wildmode=full        " zsh补全菜单

nnoremap <F11> :call CompileRunCode()<CR>
func! CompileRunCode()
    exec "w"
    if(&ft=='cpp')
        exec '!g++ "%" -o "/tmp/output/%<"'
        exec '!time "/tmp/output/%<"'
    elseif(&ft=='python')
        exec '!python "%"'
    endif
endfunc

nnoremap <s-F11> :call ShowRawCode()<CR>
func! ShowRawCode()
    exec "w"
    exec '!cat "%"'
endfunc

