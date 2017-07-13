"dein Scripts-----------------------------

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/xxxxx/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/xxxxx/.vim/bundle')
  call dein#begin('/Users/xxxxx/.vim/bundle')

  " Let dein manage dein
  " Required:
  call dein#add('/Users/xxxxx/.vim/bundle/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('scrooloose/nerdtree')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

" 自動でファイルツリーが表示される
autocmd vimenter * NERDTree

" alias for NERDTree
map <C-n> :NERDTreeToggle<CR>

"End dein Scripts-------------------------


""" {{{ 基本設定

" 文字コードをUTF-8
set encoding=utf-8

"行数表示
set number

" ダーク系のカラースキームを使う
set background=dark

" vimの無名レジスタとクリップボードを連携
set clipboard=unnamed

"折りたたみ有効化
"set foldmethod=marker

"tab文字と行末文字の設定
set list
set listchars=eol:<,tab:>.

"ソフトタブ無効
"set noexpandtab

"インデント
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=2     " 画面上でタブ文字が占める幅
set shiftwidth=2  " 自動インデントでずれる幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する

"補完
set wildmenu wildmode=list:full

" ファイルタイプによるスニペットを有効化
filetype on

"シンタックスハイライト
colorscheme desert
syntax on
set nohlsearch
set cursorline

" カーソル
set backspace=indent,eol,start
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う
set showcmd " 入力中のコマンドをステータスに表示する
set laststatus=2 " ステータスバーを常に表示する

" ファイル
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない
set hidden " ファイル変更中に他のファイルを表示可能にする
set title " 編集中のファイル名をタブバーに表示可能

" サーチ
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない

" インサートモードから抜けると自動的にIMEをオフにする
"set iminsert=2


""" }}}
