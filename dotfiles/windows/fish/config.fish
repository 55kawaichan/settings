export PATH=$PATH:/usr/bin
export PATH=$PATH:$HOME/bin

## neovimで開く
alias vi='/usr/bin/nvim'

## for windows explorer
alias open='/mnt/c/Windows/explorer.exe'
alias e='/mnt/c/Windows/explorer.exe .'

# VSCode
export PATH="$PATH:/mnt/c/Users/${username}/AppData/Local/Programs/Microsoft VS Code/bin"

# Rancher Desktop
export PATH="$PATH:/mnt/c/Program Files/Rancher Desktop/resources/resources/linux/bin"

# cd > ls
function cd
  builtin cd $argv
    ls -a
end

# lsの色を見やすく変更
if test ! -e ~/.dircolors/dircolors.ansi-dark
  git clone https://github.com/seebi/dircolors-solarized.git ~/.dircolors
end
eval (dircolors -c ~/.dircolors/dircolors.256dark)
set fish_color_command white

# aliases for git
alias g="git"
