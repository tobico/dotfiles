ghcl () { mkdir -p ~/src && git clone git@github.com:$1/$2 ~/src/$2 }

# Function to switch and save the current path
# http://blog.eexit.net/2011/05/zsh-open-a-new-window-using-the-last-pwd.html
function cd() {
  builtin cd "$@";
  pwd > ~/.cwd;
}
export cd
alias cwd='cd "$(cat ~/.cwd)"'
