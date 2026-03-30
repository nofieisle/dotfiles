"--- Display ---
"シンタックスハイライト
syntax enable

"タイトルバーにファイル名を表示
set title

"行番号を表示
set number

"行番号の色
highlight lineNr ctermfg=8

"相対番号を表示
"set relativenumber

"現在の行を強調表示
set cursorline

"折り返し表示
"set nowrap

"対応する括弧を表示
set showmatch

"対応する括弧に <> を追加
set matchpairs+=<:>

"タブや行末の半角スペース、改行などを可視化
"set list

"どの文字で可視化するかを設定
"set listchars=tab:>.,trail:⋰

"常にステータス行を表示
set laststatus=2

"ステータスラインにカーソル位置の情報を表示
set ruler

"コマンドをステータス行に表示
set showcmd


"--- Tab ---
"Tabのスペース数
set tabstop=4

"改行時のインデントを tabstop の値にする
set shiftwidth=0

"自動的にインデント
set autoindent


"--- Cursor ---
"行末の1文字先までカーソルを移動できるようにする
set virtualedit=onemore

"折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk


"--- Search ---
"検索語をハイライト
set hlsearch

"検索時に大文字小文字を区別しない
"set ignorecase

"検索時に大文字と小文字が含まれている場合、大文字と小文字を区別する
"set smartcase

"検索時、最後まで行ったら最初に戻る
"set wrapscan


"--- File ---
"バックアップファイルを作成しない
set nobackup

"バッファが編集中でもその他のファイルを開けるようにする
set hidden


"--- Others ---
"Esc
inoremap jj <Esc>

"ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>
