"ハイライト（キーワードのカラー表示）
syntax enable
" 行番号表示
set number
" マウスクリック有効
set mouse=a

" 検索結果をハイライト表示
set hlsearch
" 行末のスペースを可視化
set listchars=eol:$,tab:>.,trail:_
set list
" コマンドラインの履歴を10000件保存する
set history=10000
" コメントの色を指定(1:赤,2:緑,3:黄,4:紫,5:桃,6:水色,7:白,8:灰)
hi Comment ctermfg=5
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=4
" タブキー押下時に挿入される文字幅を指定
set tabstop=4
" ファイル内にあるタブ文字の表示幅
set tabstop=4

" 対応する括弧を強調表示
set showmatch
" タイトルを表示
set title

" 編集箇所のカーソルを記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/bundle/dart-vim-plugin')

"... <snip other plugins>
Plug 'dart-lang/dart-vim-plugin'

" Initialize plugin system
call plug#end()

