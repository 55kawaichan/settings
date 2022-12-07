if exists('g:vscode')
    xmap gc  <Plug>VSCodeCommentary
    nmap gc  <Plug>VSCodeCommentary
    omap gc  <Plug>VSCodeCommentary
    nmap gcc <Plug>VSCodeCommentaryLine

    nnoremap  fp call VSCodeNotify('workbench.action.quickOpen')
    nnoremap  fgs call VSCodeNotify('workbench.view.scm')

    call plug#begin('~/.config/nvim/plugged')
    Plug 'tpope/vim-commentary' "コメントプラグイン
    Plug 'rhysd/clever-f.vim'
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-expand-region'
    Plug 'asvetliakov/vim-easymotion'
    call plug#end()
    nmap s <Plug>(easymotion-s2)
else
    call plug#begin('~/.config/nvim/plugged')
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-commentary' "コメントプラグイン
    Plug 'tomasiser/vim-code-dark' "vimのカラースキーマ
    Plug 'lambdalisue/fern.vim' "ファイラー
    Plug 'lambdalisue/fern-git-status.vim' "ファイルツリーにgit差分表示
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'easymotion/vim-easymotion'
    Plug 'terryma/vim-expand-region'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    call plug#end()
    nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
    let g:fern#renderer = 'nerdfont'
    nmap s <Plug>(easymotion-overwin-f2)
endif

set clipboard=unnamed,unnamedplus
map K <Plug>(expand_region_expand)
map J <Plug>(expand_region_shrink)

" easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" 文字コードを UFT-8 に設定する
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるようにする
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" クリップボード連携を有効にする (MacOS の場合は unnamedplus ではなく unnamed で有効にできた・vi ではなく vim を使うこと)
set clipboard&
set clipboard^=unnamed
" クリップボード連携を有効にした時に BackSpace (Delete) が効かなくなるので設定する
set backspace=indent,eol,start

set completeopt=menuone,noinsert
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

" 見た目
" ------------------------------------------------------------
" フォント設定
set termguicolors
set guifont=Hack\ Nerd\ Font:h13
set guifontwide=Hack\ Nerd\ Font:h13
let g:fern#renderer = 'nerdfont'

" 行番号を表示する
set number
" 現在の行を強調表示する
set cursorline
" カーソルラインの色をクリアする
hi clear CursorLine
" 行末の1文字先までカーソルを移動できるようにする
set virtualedit=onemore
" スマートインデントにする
set smartindent
" ビープ音を可視化する
set visualbell
" 括弧入力時の対応する括弧を表示する
set showmatch
" ステータスラインを常に表示する
set laststatus=2
" コマンドライン補完を有効にする
set wildmode=list:longest
" 折り返し時に表示行単位での移動をできるようにする
nnoremap j gj
nnoremap k gk
" US-ASCIIの文字と同じ幅を使う
set ambiwidth=single

" Tab 文字
" ------------------------------------------------------------

" 不可視文字を可視化 (タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab 文字を半角スペースにする
set expandtab
" 行頭以外の Tab 文字の表示幅 (スペースの数)
set tabstop=2
" 行頭での Tab 文字の表示幅
set shiftwidth=2


" 検索
" ------------------------------------------------------------

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示する
set hlsearch


" ウィンドウ
" ------------------------------------------------------------

" t + \ ・ t + | でウィンドウを垂直縦分割する
nmap t<Bslash> :vsplit<Return><C-w>w
nmap t<Bar> :vsplit<Return><C-w>w
" t + - でウィンドウを水平横分割する
nmap t- :split<Return><C-w>w

" t + hjkl でウィンドウ移動する
map th <C-w>h
map tj <C-w>j
map tk <C-w>k
map tl <C-w>l

" Space でウィンドウ移動する
nmap <Space> <C-w>w

" Tab・Space + Tab でタブ移動
nmap <Tab> :tabnext<Return>
nmap <S-Tab> :tabprev<Return>

" Esc 連打で :nohlsearch が出ないようにする
nnoremap <Esc><Esc> <Esc>

" Esc をjjに代替
inoremap <silent> jj <ESC>

" netrw
" ------------------------------------------------------------
" 上部に表示される情報を非表示
let g:netrw_banner = 0
" 表示形式をTreeViewに変更
let g:netrw_liststyle = 3
" 左右分割を右側に開く
let g:netrw_altv = 1
