# dotfiles

File: .zshrc
  // does not work on mac that's why comment out
  xset r rate 210 40
  // work around
command line:
  // view : https://mac-key-repeat.zaymon.dev/
  # normal minimum is 15 (225 ms) 10 = 150ms 
  # dont go under 10
  defaults write -g InitialKeyRepeat -int 15
  # normal minimum is 2 (30 ms)
  defaults write -g KeyRepeat -int 1 
  
If Error for insecure directories than run:
sudo chmod -R 755 path/to-directory
Example:
sudo chmod -R 755 /Users/juridiener/.config/zsh/completion/

Install Alacritty:
brew install --cask alacritty
brew install tmux
brew install neovim
brew install prettier
brew install black
brew install stylua
brew install luarocks
curl https://sh.rustup.rs -sSf | sh
brew install fd
brew install fzf
brew install ripgrep
npm install -g ls_emmet



FOR M1 CHIPS
In terminal and in tmux execute uname -a
both should show arm64

