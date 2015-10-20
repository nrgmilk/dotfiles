set bs=indent,eol,start
set bufhidden=hide
set encoding=utf-8
set fileencodings=utf-8,cp932,sjis,euc-jp,iso-2022-jp
set history=20
set hlsearch
set incsearch
set laststatus=2
set nonumber
set showmatch
set showmode
set smartcase
set tabstop=4
set expandtab
set nocompatible
set statusline=
set statusline+=[*%n]\  " バッファ番号
set statusline+=%f\     " ファイル名
set statusline+=%{'['.(&fenc!=''?&fenc:'?').'-'.&ff.']'} " 文字コード
set statusline+=%m      " バッファ状態[+]とか
set statusline+=%r      " 読み取り専用フラグ
set statusline+=%h      " ヘルプバッファ
set statusline+=%w      " プレビューウィンドウ
set statusline+=%=      " 区切り
set statusline+=%5l,%3c " 行、列
set statusline+=%4p%%   " どこにいるか
set statusline+=%<      " 折り返しの指定
syntax on

