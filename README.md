# .dotfiles

macOS 環境のドットファイルを Git で管理するためのリポジトリ。

## 管理ファイル一覧

| ファイル | 元の配置 | 用途 |
|---|---|---|
| `vimrc` | `~/.vimrc` | Vim 設定 |
| `zshrc` | `~/.zshrc` | Zsh 設定 |
| `tmux.conf` | `~/.config/tmux/tmux.conf` | tmux 設定 |
| `gitignore_global` | `~/.config/git/ignore` | グローバル gitignore |

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
```

### 3. 既存のドットファイルをリポジトリに移動

ドットを外した名前で管理するのが一般的。

```sh
mv ~/.vimrc ~/.dotfiles/vimrc
mv ~/.zshrc ~/.dotfiles/zshrc
mv ~/.config/tmux/tmux.conf ~/.dotfiles/tmux.conf
mv ~/.config/git/ignore ~/.dotfiles/gitignore_global
```

### 4. シンボリックリンクを作成

元の場所からリポジトリ内のファイルを参照するようにする。

```sh
# vimrc / zshrc
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc

# tmux.conf
mkdir -p ~/.config/tmux
ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf

# gitignore_global
mkdir -p ~/.config/git
ln -s ~/.dotfiles/gitignore_global ~/.config/git/ignore
git config --global core.excludesfile ~/.config/git/ignore
```

### 5. 確認

シンボリックリンクが正しく張られていることを確認する。

```sh
ls -l ~/.vimrc                  # -> ~/.dotfiles/vimrc
ls -l ~/.zshrc                  # -> ~/.dotfiles/zshrc
ls -l ~/.config/tmux/tmux.conf  # -> ~/.dotfiles/tmux.conf
ls -l ~/.config/git/ignore      # -> ~/.dotfiles/gitignore_global
```

### 6. 設定を反映

```sh
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
