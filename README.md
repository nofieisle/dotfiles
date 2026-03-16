# .dotfiles

ホームディレクトリでドットファイルを管理する。

## ◯ 準備
### .dotfiles 作成
`mkdir ~/.dotfiles`

### ~/.dotfiles 用の .gitignore を作成
1. `.dotfiles` に移動: `cd ~/.dotfiles`
2. `.gitignore` を作る: `touch .gitignore`
3. 中身を書く: `vim .gitignore`
```
.DS_Store
*.swp
*.swo
*.tmp
*.bak
```

### Git 初期化
```
git init
git add .gitignore
git commit -m "initial dotfiles"
```

## ◯ 設定手順
### 管理したいファイルの存在を確認
* `ls -la ~/.vimrc`
* `ls -la ~/.zshrc`
* `ls -la ~/.config/git/ignore`
* `ls -la ~/.config/tmux/tmux.conf`

### .dotfiles に移動
ドットを外して管理するのが一般的
* `mv ~/.vimrc ~/.dotfiles/vimrc`
* `mv ~/.zshrc ~/.dotfiles/zshrc`
* `mv ~/.config/git/ignore ~/.dotfiles/gitignore_global`
* `mv ~/.config/tmux/tmux.conf ~/.dotfiles/tmux.conf`

### シンボリックリンクを作る
* `ln -s ~/.dotfiles/vimrc ~/.vimrc`
* `ln -s ~/.dotfiles/zshrc ~/.zshrc`

#### gitignore_global 用
* `ls ~/.config/git`
* `mkdir -p ~/.config/git`
* `ln -s ~/.dotfiles/gitignore_global ~/.config/git/ignore`
* `git config --global core.excludesfile ~/.config/git/ignore`
* `git config --global core.excludesfile`

#### tmux.conf 用
* `ls ~/.config/tmux`
* `mkdir -p ~/.config/tmux`
* `ln -s ~/.dotfiles/tmux.conf ~/.config/tmux/tmux.conf`

### 確認
* `ls -l ~/.vimrc`
	* `/Users/username/.vimrc -> /Users/username/.dotfiles/vimrc`
* `ls -l ~/.zshrc`
	* `/Users/username/.zshrc -> /Users/username/.dotfiles/zshrc`
* `ls -l ~/.config/tmux`
	* `tmux.conf -> /Users/username/.dotfiles/tmux.conf`

### 設定を再読み込み
* `source ~/.zshrc`
* vimrc は vim 起動時に自動で読み込まれるので、再読み込み不要

## ◯ Git管理に追加
```
cd ~/.dotfiles
git add xxxx
git commit -m "add xxxx"
```
