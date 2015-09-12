if has('vim_starting')

  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/dotfiles/vimfiles/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/dotfiles/vimfiles/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'


""" plugin設定 {{{
""" unite.vim
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" 起動時にinsert状態から始める
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200


"prefix keyの設定
nmap <Space> [unite]

"スペースキーとaキーでカレントディレクトリを表示
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files file<CR>

"スペースキーとfキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer file_mru<CR>

"スペースキーとdキーで最近開いたディレクトリを表示
nnoremap <silent> [unite]d :<C-u>Unite<Space>directory_mru<CR>

"スペースキーとbキーでバッファを表示
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>

"スペースキーとrキーでレジストリを表示
nnoremap <silent> [unite]r :<C-u>Unite<Space>register<CR>

"スペースキーとtキーでタブを表示
nnoremap <silent> [unite]t :<C-u>Unite<Space>tab<CR>

"スペースキーとhキーでヒストリ/ヤンクを表示
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>

"スペースキーとoキーでoutline
nnoremap <silent> [unite]o :<C-u>Unite<Space>outline<CR>

"スペースキーとENTERキーでfile_rec:!
nnoremap <silent> [unite]<CR> :<C-u>Unite<Space>file_rec:!<CR>

"unite.vimを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
    " ESCでuniteを終了
        nmap <buffer> <ESC> <Plug>(unite_exit)
        endfunction"}}}

" yank の履歴を表示
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>

" source に file_mru と buffer が指定された状態で unite が起動
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>


""" ファイルをtree表示してくれる
"" :NERDTree
NeoBundle 'scrooloose/nerdtree'
noremap <silent>,n :NERDTreeToggle<CR>
" nnoremap <silent> ,N :NERDTreeToggle<CR>


""" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'


""" neomru.vim
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'


""" emmet
NeoBundleLazy 'mattn/emmet-vim', {
 \ 'autoload' : {
 \   'filetypes' : ['html', 'html5', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee'],
 \   'commands' : []
 \ }}

let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '  '
    \ }


""" vimのテキストオブジェクトを拡張
NeoBundle 'taichouchou2/surround.vim'


""" urlを開いたりググったり出来る
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'


""" ブラウザを自動更新する
NeoBundle 'tell-k/vim-browsereload-mac'


""" css3のシンタックス追加
NeoBundle 'hail2u/vim-css3-syntax'

""" html5のシンタックス追加
NeoBundle 'taichouchou2/html5.vim'

""" jsのシンタックス追加
NeoBundle 'taichouchou2/vim-javascript'

""" coffee-script シンタックス追加
NeoBundle 'kchmck/vim-coffee-script'

""" coffee-react シンタックス追加
NeoBundle 'mtscout6/vim-cjsx'

""" node
NeoBundle 'moll/vim-node'

""" js シンタックス
NeoBundle 'pangloss/vim-javascript'

""" インデントに色をつける
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1


""" 行末の半角スペースを可視化
"" :FixWhitespace
NeoBundle 'bronson/vim-trailing-whitespace'



""" 挙動確認
" 関数の挙動だとか、この言語だとこれってtrue/falseどっちに評価されるっけ？みたいなことってちょこちょこありますよね。そんな時、「ちょっとしたコード片を書いて実行して確認」、みたいなことをすると思います。それをVim開いたまま実行して結果を表示してくれる
NeoBundle 'thinca/vim-quickrun'


""" 言わずもだが、grepの拡張
NeoBundle 'grep.vim'


""" シンタックスチェック
" 今は何も設定していない
NeoBundle 'scrooloose/syntastic'
let g:syntastic_check_on_open = 0 "ファイルオープン時にはチェックをしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施
""" }}}


call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Required:
filetype plugin indent on


""" {{{ 基本設定

" 文字コードをUTF-8
set encoding=utf-8

"行数表示
set number

" vimの無名レジスタとクリップボードを連携
set clipboard=unnamed

"折りたたみ有効化
set foldmethod=marker

"tab文字と行末文字の設定
set list
set listchars=eol:<,tab:>.

"ソフトタブ無効
set noexpandtab

"インデント時にインデントする文字数
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
" C言語スタイルのインデント
set cindent

"補完
set wildmenu wildmode=list:full

"シンタックスハイライト
colorscheme desert
syntax on
set nohlsearch
set cursorline

" ファイルタイプによるスニペットを有効化
filetype on

""" }}}


""" マッピング {{{
"ノーマルモード時にエンターキーで改行挿入
noremap <CR> o<ESC>

" ノーマルモード時にスペースキーで半角スペース挿入
" noremap <space> i<space><ESC>l

" tree
noremap ,N :NERDTreeToggle

" insertモードから通常モードへ
imap <c-j> <ESC>

""" }}}
