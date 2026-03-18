# dotfiles
macOS 環境のドットファイルを Git で管理するためのリポジトリ。

## 管理ファイル一覧
| ファイル | 元の配置 | 用途 |
|---|---|---|
| `git/config-sample` | `~/.config/git/config` | 「元の配置」にコピーして書き換え |
| `git/ignore` | `~/.config/git/ignore` | グローバル gitignore |
| `tmux/tmux.conf` | `~/.config/tmux/tmux.conf` | tmux 設定 |
| `vimrc` | `~/.vimrc` | Vim 設定 |
| `zprofile` | `~/.zprofile` | Zprofile 設定 |
| `zshrc` | `~/.zshrc` | Zsh 設定 |

## 初回セットアップ
### 1. リポジトリを作成
```sh
mkdir ~/.dotfiles
cd ~/.dotfiles
git init
```

### 2. .gitignore を作成
```sh
vim .gitignore

.DS_Store
*.swp
*.swo
*.tmp
*.bak
```

### 3. 既存のドットファイルをリポジトリに移動
ドットを外した名前で管理するのが一般的。
```sh
mv ~/.config/git/ignore ~/.dotfiles/git/ignore
mv ~/.config/tmux/tmux.conf ~/.dotfiles/tmux/tmux.conf
mv ~/.vimrc ~/.dotfiles/vimrc
mv ~/.zprofile ~/.dotfiles/zprofile
mv ~/.zshrc ~/.dotfiles/zshrc
```

### 4. シンボリックリンクを作成
元の場所からリポジトリ内のファイルを参照するようにする。
```sh
# gitignore_global
mkdir -p ~/.config/git
ln -s ~/.dotfiles/git/ignore ~/.config/git/ignore
git config --global core.excludesfile ~/.config/git/ignore

# tmux.conf
mkdir -p ~/.config/tmux
ln -s ~/.dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf

# vimrc / zprofile / zshrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zprofile ~/.zprofile
ln -s ~/.dotfiles/zshrc ~/.zshrc
```

### 5. 確認
シンボリックリンクが正しく張られていることを確認する。
```sh
ls -l ~/.config/git/ignore      # -> ~/.dotfiles/git/ignore
ls -l ~/.config/tmux/tmux.conf  # -> ~/.dotfiles/tmux/tmux.conf
ls -l ~/.vimrc                  # -> ~/.dotfiles/vimrc
ls -l ~/.zprofile               # -> ~/.dotfiles/zprofile
ls -l ~/.zshrc                  # -> ~/.dotfiles/zshrc
```

### 6. 設定を反映
```sh
source ~/.zprofile
source ~/.zshrc
```
> vimrc は Vim 起動時に自動で読み込まれるため、再読み込みは不要。

### 7. Git に追加
```sh
cd ~/.dotfiles
git add .
git commit -m "initial dotfiles"
```

## 新しいドットファイルを追加するには
```sh
# 1. 既存ファイルをリポジトリに移動（ドットを外す）
mv ~/.xxxx ~/.dotfiles/xxxx

# 2. シンボリックリンクを作成
ln -s ~/.dotfiles/xxxx ~/.xxxx

# 3. Git に追加
cd ~/.dotfiles
git add xxxx
git commit -m "add xxxx"
```
