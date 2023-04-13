# Linux Command
alias ll='ls -alFG'
# 意味不明な処理は 'find . -type f | xargs grep ○○ 'で追う
# find <dirpath> -name <filename> | xargs grep <pattern> # filenameで*.phpなど拡張子を指定した中からgrepする
# grep <pattern> --include=<filename> -r # grepはファイルの中身を検索するコマンド,patternには正規表現を使用可能

# 直下ディレクトリ以下全てのファイル名検索
alias findgrep='find . -type f | grep' # 後に検索したいファイル名を指定
# 直下ディレクトリ以下全てのファイル内の文章(文字列)検索
alias findstrgr='find . -type f | xargs grep' # 後に検索したいキーワードを指定

# Docker
alias dcs='docker-compose stop'
# Laravelアプリの実体のあるworkspaceコンテナ内に入り、`composer`や`php artisan`コマンド実行
# 特にphp artisan migrationなどDB環境はローカルとコンテナ内とで連動しないので注意
# ※ "~/{Laravel-projectname}/laradock"で実行
alias dcewb='docker-compose exec workspace bash'
function dcin () {
  docker ps; read ms; docker exec -it $ms /bin/bash;
}

# Open Chrome
alias opch='open -a google\ chrome'

# reboot .bash_profile
alias sourcebp='source ~/.bash_profile'

# Shortcut
alias desk='cd ~/Desktop'

# Git
alias gst="git status"
alias glo="git log --oneline"
alias gcm="git commit -m"
alias grs="git remote set-url origin"
alias makeprj='git commit --allow-empty -m "Make PR"'
## 修正/追加されたインデックスを直前のコミットにまとめる（コミットメッセージ変更なし）
alias gcane='git commit --amend --no-edit'

# 新しいプロジェクト、ワークスペースでgit init〜GitHub登録まで一連の流れを関数化しておくと便利
function gcre() {
  myid = "itachi-P" # GitHubのログインID
  mypass = "gthbps01"
  git init && git add -A && git status;
  read -p "type repository name  : " name;
  read -p "type repo description : " description;
  #githubのAPIを叩いているのでブラウザを開く必要がない
  curl -u ${myid} https://api.github.com/user/repos -d '{"name":"'"${name}"'","description":"'"${description}"'","private":true}';
  git commit -m "first commit";
  git remote add origin https://github.com/itachi-P/${name}.git;
  #git remote set-url origin git@github.com:${myid}/${name}.git;
  git push --set-upstream origin master;
  # bitbucketならこうする。
  ## curl -X POST --user ${yourid}:${yourpass} https://api.bitbucket.org/2.0/repositories/${yourid}/${name} --data '{"is_private":true}'
}

# コミットメッセージ入力と同時に全ての変更ファイルをステージング→ push
function gpA() {
  read -p "type commit message >> " ms;
  git add -A && git status && git commit -m "$ms" && git push;
}
# ステージングに上げるファイルを選別したい場合(interactiveモード)
function gpS() {
  read -p "type commit message >> " ms;
  git add -i && git status && git commit -m "$ms" && git push;
}

# 辞書に登録しているgit系コマンドを一覧
alias gitls='alias | grep git'
# 操作履歴を10個まで表示する
alias ghis='git reflog --date=local -n 10'

# ghisで確認したコミットハッシュ値を引数にして、指定コミットに戻る
function grst() {
    git reflog --date=local -n 10;
    read -p "type commit massage >> " cn;
    git reset --hard ${cn};
}
# ghisで確認したコミットハッシュ値を引数にして、指定コミットのメッセージを修正する
function gcamd() {
    git reflog --date=local -n 10;
    read -p "type commit massage >> " cn;
    git commit -amend ${cn};
}
# git履歴をツリー状に表示
alias gtree='git log --graph'
# 直前のコミットに一部ファイル修正/追加をする
alias gredo='git add -i & git commit --amend & git push'

# カレントディレクトリが所属しているリポジトリのルートのパスに移動する
alias gcd='git rev-parse --show-toplevel | xargs cd'
# ステータス変更があったファイル名だけ表示
alias gdif='git diff --name-only'
# ステージング対象から除外 showで一覧 popで復帰
alias gsta='git stash'
# 別ブランチのコミットをマージする。これはreflogで見れないのでコミットハッシュ値は確認必要。
alias gpick='git cherry-pick'

# Laravel
alias pas='php artisan serve'

# etc.
HISTFILESIZE=10000
HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S '
PS1='\[\033[44;1;31m\] [\u@\h:\W \t]\$\[\033[00m\] '

# Node.js
export PATH=$PATH:/Users/itachi-p/.nodebrew/current/bin

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
source /Users/itachi-p/.phpbrew/bashrc
source $HOME/.phpbrew/bashrc

function prev() {
  PREV=$(echo `history | tail -n2 | head -n1` | sed 's/[0-9]* //')
  sh -c "pet new `printf %q "$PREV"`"
}

function pet-select() {
  BUFFER=$(pet search --query "$READLINE_LINE")
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-x\C-r": pet-select'

# 3つ下のレベル（階層）までのツリー表示
alias tr3="tree -L 3"

#### 42Tokyo ####

alias c42='cc -Wall -Wextra -Werror'
alias gc42='gcc -Wall -Wextra -Werror'
alias norm='norminette -R CheckForbiddenSourceHeader'
# ヘッダーの書式チェック用オプション
alias normd="norminette -R CheckDefine"
# 現在地以下のPiscine課題ファイル群の中身を一覧
alias ftcat="find . -type f -name 'ft_*'| xargs cat"
# 2つのディレクトリ間で差のあるファイル名だけ(--briefオプション)を列挙
alias difd="diff -r --brief"
alias code="open -a /Applications/Visual\ Studio.app/"
