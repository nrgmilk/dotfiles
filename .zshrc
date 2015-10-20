PATH=${HOME}/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
export LANG=ja_JP.UTF-8 EDITOR=vim
fpath=(${HOME}/.zshrc.completion $fpath)

#mozc_server_start
export XIM=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=xim
export XMODIFIERS=@im=ibus
export XIM_PROGRAM="ibus-daemon"
export XIM_ARGS="-r --daemonize --xim"

### エイリアス
alias du="du -sh" df="df -h" su="su -l" vi="vim" cp="cp -a" grep="egrep --color" ..="cd .."

### 拡張子別の起動アプリ
alias -s txt=vim sh=sh pl=perl php=php py=python rb=ruby js=node

### 音オプション
setopt no_beep              #ビープ音を鳴らさないようにする
setopt nolistbeep           #補完候補表示時にビープ音を消す

### プロンプトオプション
#setopt ignore_eof          #^Dでexitしない
setopt extended_glob        #ファイル名で #, ~, ^ の3文字を正規表現として扱う
setopt interactive_comments #コマンドラインでも # 以降をコメントと見なす
setopt long_list_jobs       #jobs の出力をデフォルトでjobs -l にする
setopt no_checkjobs         #ログアウト時にバックグラウンドのジョブを確認しない
setopt no_flow_control      #＾S/＾Qによるフロー制御を使わないようにする
setopt no_hup               #ログアウト時にバックグラウンドのジョブに HUP シグナルを送らない
setopt notify               #バックグラウンドジョブが終了したら(プロンプトの表示を待たずに)すぐに知らせる
setopt numeric_glob_sort    #ソートを数字優先にする
setopt print_eight_bit      #8bit文字を表示
setopt prompt_subst         #色を使う
setopt rm_star_silent       #*でrmする場合、確認画面を出さない
setopt transient_rprompt    #ぶつかったらRPROMPTを自動的に消す
unsetopt promptcr           #改行コードで終わらない出力をプロンプトで上書きするのを防ぐ

### キーバインド
bindkey -e
bindkey "^?"      backward-delete-char              # BSで後方の1文字を消す
bindkey "^[[3~"   delete-char                       # Deleteで前方の1文字を消す
bindkey "^[Mb"    backward-delete-word              # Alt+BSで後方の1単語を消す
bindkey "^[[A"    history-beginning-search-backward # ↑で履歴から補完：ｑする(tcshライク)
bindkey "^[[B"    history-beginning-search-forward  # ↓で履歴から補完する(tcshライク)

### 履歴オプション
setopt hist_ignore_all_dups #重複した履歴は追加しない
setopt hist_ignore_dups     #直前と同じコマンドを履歴に追加しない
setopt hist_ignore_space    #先頭がスペースで始まる場合、履歴に追加しない
setopt hist_no_store        #history (fc -l) コマンドを履歴一覧から取り除く
setopt hist_save_no_dups    #履歴をファイルに書き出すとき古いコマンドと同じなら無視
setopt share_history        #履歴を共有する

### 補完オプション
#setopt auto_menu           #補完キー（Tab, ^I) を連打するだけで順に補完候補を自動で補完する
setopt auto_cd              #ディレクトリー名だけで移動できる
setopt auto_list            #補完候補が複数ある時に、一覧表示する
setopt auto_param_keys      #カッコの対応などを自動的に補完
setopt auto_param_slash     #ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_pushd           #cd -[TAB]で今まで移動したディレクトリー一覧を表示し、数字で移動
setopt brace_ccl            #{a-c} を a b c に展開する機能を使えるようにする
setopt complete_aliases     #補完される前にオリジナルのコマンドまで展開してチェックする
setopt correct              #コマンドの間違いを指摘
setopt equals               #=command を command のパス名に展開する
setopt list_packed          #補完候補を詰めて表示
setopt list_types           #補完候補一覧でファイルの種別をマーク表示
setopt magic_equal_subst    #コマンドラインの引数で --prefix=/usr などの=以降でも補完できる
setopt mark_dirs            #ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt no_auto_menu         #補完キー（Tab, ^I) を連打するだけで順に補完候補を自動で補完しない
setopt complete_in_word     #途中でもカーソル位置で補完

### zstyle
# 補完時の色分け
zstyle ':completion:*' list-colors 'no=00:fi=00:di=00;34:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;32:*.cmd=00;32:*.exe=00;32:*.com=00;32:*.btm=00;32:*.bat=00;32:*.sh=00;32:*.csh=00;32:*.tar=00;31:*.tgz=00;31:*.arj=00;31:*.taz=00;31:*.lzh=00;31:*.zip=00;31:*.z=00;31:*.Z=00;31:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.jpg=00;35:*.gif=00;35:*.bmp=00;35:*.xbm=00;35:*.xpm=00;35:*.png=00;35:*.tif=00;35:'

# 補完の時に大文字小文字を区別しない (但し、大文字を打った場合は小文字に変換しない)
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'

# キャッシュを有効にする
zstyle ':completion:*' use-cache true

# メニュー補完候補を ←↓↑→ で選択
#zstyle ':completion:*:default' menu select=1

### autoload
autoload -U compinit; compinit      # 補完機能を有効
autoload -U colors; colors          # プロンプトに色を付ける
#autoload -U predict-on; predict-on # 予測補完を有効にする

### 履歴設定
HISTFILE=~/.zsh_history
HISTSIZE=100000000
SAVEHIST=100000000
LISTMAX=0

### プロンプト設定
SPROMPT="%B%r%b? [%Uy%ues,%Un%uo,%Ue%udit]: "
RPROMPT=""
PROMPT="
[%*][%~]"

case ${UID} in
0)
PROMPT=${PROMPT}"
%B"$'%{\e[31m%}'"[%n@%M]#"$'%{\e[m%}'"%b "
   ;;
*)
PROMPT=${PROMPT}"
%B[%n@%M]$%b "
   ;;
esac

### OS別の処理
case `uname -s` in
    "Linux")
        alias ls="ls --color"
        alias ll="ls --color -al"
    ;;
    "FreeBSD")
        alias ls="ls -G -w"
        alias ll="ls -G -w -al"
        alias top="top -P"
    ;;
    "darwin")
        alias ls="ls -G -w"
        alias ll="ls -G -w -al"
    ;;
esac

#移動後に自動でls
function chpwd() { ls }

test -f ${HOME}/.zshrc.extra && source ${HOME}/.zshrc.extra

