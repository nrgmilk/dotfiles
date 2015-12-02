"------------------------------------------------------------------------------
"環境依存関係 Copyright (C) 2007 KaoriYa/MURAOKA Taro
"------------------------------------------------------------------------------
" WinではPATHに$VIMが含まれていないときにexeを見つけ出せないので修正
if has('win32') && $PATH !~? '\(^\|;\)' . escape($VIM, '\\') . '\(;\|$\)'
  let $PATH = $VIM . ';' . $PATH
endif

if has('mac')
  " Macではデフォルトの'iskeyword'がcp932に対応しきれていないので修正
  set iskeyword=@,48-57,_,128-167,224-235
endif
"------------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
  let uname = system('uname')
  if uname =~? "linux"
    set term=builtin_linux
  elseif uname =~? "freebsd"
    set term=builtin_xterm
  elseif uname =~? "Darwin"
    set term=builtin_xterm
  else
    set term=builtin_xterm
  endif
  unlet uname
endif
set t_Co=256
"------------------------------------------------------------------------------
" コンソール版で環境変数$DISPLAYが設定されていると起動が遅くなる件へ対応
if !has('gui_running') && has('xterm_clipboard')
  set clipboard=exclude:cons\\\|linux\\\|cygwin\\\|rxvt\\\|screen
endif

"------------------------------------------------------------------------------
"基本
"------------------------------------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" ビープ音を鳴らさない
set vb t_vb=
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I
"set keymap=japanese

"------------------------------------------------------------------------------
"編集
"------------------------------------------------------------------------------
" 改行コードの自動認識
set fileformats=unix,dos,mac
" バックスペースキーで削除できるものを指定
set backspace=indent,eol,start
" 文字コードの設定
set encoding=utf-8 		"winならset encoding=cp932
set termencoding=utf-8	"winならset termencoding=cp932
"set fileencoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,iso-2022-jp,ucs-2le,ucs-2
" コマンド、検索パターンを100個まで履歴に残す
set history=100
"バッファがウィンドウ内に表示されなくなったときの動作を指定する
"(hide,unload,delete)
set bufhidden=hide

"------------------------------------------------------------------------------
"インデント
"------------------------------------------------------------------------------
" タブを挿入するとき、代わりに空白を使わない
set noexpandtab
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブやバックスペースの使用等の編集操作をするときに、タブが対応する空白の数
set softtabstop=4
" タブが対応する空白の数
set tabstop=4

"------------------------------------------------------------------------------
"検索
"------------------------------------------------------------------------------
" 検索結果文字列のハイライトを有効にする
set hlsearch
" インクリメンタルサーチを使う
set incsearch
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻らない
set nowrapscan

"------------------------------------------------------------------------------
"表示
"------------------------------------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を非表示 (number:非表示)
set nonumber
" ルーラーを表示 (noruler:非表示)
set ruler
" 現在行をハイライト
set cursorline
hi clear CursorLine
hi CursorLine ctermbg=LightBlue
" タブや改行を表示 (list:表示)
set nolist
" どの文字でタブや改行を表示するかを設定
"set listchars=tab:>-,extends:<,trail:-,eol:<
"カーソルが何行目の何列目に置かれているかを表示する。
set rulerformat=l
" 括弧入力時の対応する括弧を表示
set showmatch
" シンタックスハイライトを有効にする
syntax on
"現在のモードを表示する
set showmode
" コマンドライン補完を拡張モードにする
set wildmenu
" コマンドラインの高さ
set cmdheight=2
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト用の設定(by. 西岡拓洋さん)
let format_allow_over_tw = 1	" ぶら下り可能幅
" ステータスラインを常に表示
set laststatus=2
" ステータスライン表示項目
set statusline=
set statusline+=[*%n]\ " バッファ番号
set statusline+=%f\ " ファイル名
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'} " 文字コード
set statusline+=%m " バッファ状態[+]とか
set statusline+=%r " 読み取り専用フラグ
set statusline+=%h " ヘルプバッファ
set statusline+=%w " プレビューウィンドウ
set statusline+=%= " 区切り
set statusline+=%5l,%3c " 行、列
set statusline+=%4p%% " どこにいるか
set statusline+=%< " 折り返しの指定
colorscheme default

"------------------------------------------------------------------------------
"バックアップ
"------------------------------------------------------------------------------
" バックアップをとらない
set nobackup
" バックアップをとる場合
"set backup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap
" swpを作成しない
set noswapfile

"------------------------------------------------------------------------------
"GUI向け
"------------------------------------------------------------------------------
" カラー設定
colorscheme default
"------------------------------------------------------------------------------
" フォント設定:
if has('gui_running')
	if has('win32')
	  " Windows用
	  set guifont=MS_Gothic:h12:cSHIFTJIS
	  "set guifont=MS_Mincho:h12:cSHIFTJIS
	  " 行間隔の設定
	  set linespace=1
	  " 一部のUCS文字の幅を自動計測して決める
	  if has('kaoriya')
	    set ambiwidth=auto
	  endif
	elseif has('mac')
	  set guifont=Source\ Han\ Code\ JP
	elseif has('xfontset')
	  " UNIX用 (xfontsetを使用)
	  set guifontset=a14,r14,k14
	endif
endif
"------------------------------------------------------------------------------
if has('gui_running')
	" ウインドウの幅
	set columns=80
	" ウインドウの高さ
	set lines=25
endif
"---------------------------------------------------------------------------
" 日本語入力に関する設定:
if has('gui_running')
	if has('multi_byte_ime') || has('xim')
	  " IME ON時のカーソルの色を設定(設定例:紫)
	  highlight CursorIM guibg=Purple guifg=NONE
	  " 挿入モード・検索モードでのデフォルトのIME状態設定
	  set iminsert=0 imsearch=0
	  if has('xim') && has('GUI_GTK')
	    " XIMの入力開始キーを設定:
	    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
	    "set imactivatekey=s-space
	  endif
	  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
	  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
	endif
endif
"---------------------------------------------------------------------------
" マウスに関する設定:
"
" 解説:
" mousefocusは幾つか問題(一例:ウィンドウを分割しているラインにカーソルがあっ
" ている時の挙動)があるのでデフォルトでは設定しない。Windowsではmousehide
" が、マウスカーソルをVimのタイトルバーに置き日本語を入力するとチラチラする
" という問題を引き起す。
if has('gui_running')
	" どのモードでもマウスを使えるようにする
	set mouse=a
	" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
	set nomousefocus
	" 入力時にマウスポインタを隠す (nomousehide:隠さない)
	set mousehide
	" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
	"set guioptions+=a
endif
"---------------------------------------------------------------------------
" メニューに関する設定
"
" 解説:
" "M"オプションが指定されたときはメニュー("m")・ツールバー("T")供に登録され
" ないので、自動的にそれらの領域を削除するようにした。よって、デフォルトのそ
" れらを無視してユーザが独自の一式を登録した場合には、それらが表示されないと
" いう問題が生じ得る。しかしあまりにレアなケースであると考えられるので無視す
" る。
"
if has('gui_running')
	if &guioptions =~# 'M'
	  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
	endif
endif
"---------------------------------------------------------------------------
" 印刷に関する設定
" 印刷用フォント
if has('printer')
  if has('win32')
    set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif

" $VIMRUNTIME/syntax/php.vim
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

" $VIMRUNTIME/syntax/sql.vim
let g:sql_type_default = 'mysql'

"---------------------------------------------------------------------------
" NeoBundle

if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" NeoBundleを初期化
call neobundle#begin(expand('~/.vim/bundle/'))

" インストールするプラグインをここに記述
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimproc', {'build': {'bsd': 'gmake','mac': 'make' , 'unix': 'gmake',},}
NeoBundle "cohama/vim-hier"
NeoBundle 'stephpy/vim-php-cs-fixer'
"NeoBundle "thinca/vim-ref"
"NeoBundle "thinca/vim-quickrun"
"NeoBundle "osyo-manga/shabadou.vim"
"NeoBundle "osyo-manga/vim-watchdogs"

call neobundle#end()

" ファイルタイプ別のプラグイン/インデントを有効にする
filetype plugin indent on

NeoBundleCheck

"---------------------------------------------------------------------------
" lightline
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'mode_map': {'c': 'NORMAL'},
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
			\ },
			\ 'component_function': {
			\   'modified': 'LightLineModified',
			\   'readonly': 'LightLineReadonly',
			\   'fugitive': 'LightLineFugitive',
			\   'filename': 'LightLineFilename',
			\   'fileformat': 'LightLineFileformat',
			\   'filetype': 'LightLineFiletype',
			\   'fileencoding': 'LightLineFileencoding',
			\   'mode': 'LightLineMode'
			\ }
			\ }

function! LightLineModified()
	return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
	return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
	return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
				\ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
				\  &ft == 'unite' ? unite#get_status_string() :
				\  &ft == 'vimshell' ? vimshell#get_status_string() :
				\ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
				\ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
	try
		if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
			return fugitive#head()
		endif
	catch
	endtry
	return ''
endfunction

function! LightLineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
	return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
	return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
	return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"vim-ref
let g:ref_cache_dir     = $HOME .'/.vim/vim-ref/cache'
let g:ref_phpmanual_path=$HOME .'/.vim/vim-ref/php-chunked-xhtml'

"php-cs-fixer
" If php-cs-fixer is in $PATH, you don't need to define line below
let g:php_cs_fixer_path = "~/bin/php-cs-fixer" " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_level = "symfony"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
" If you want to define specific fixers:
"let g:php_cs_fixer_fixers_list = "linefeed,short_tag,indentation"
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an

