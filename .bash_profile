#
# ~/.bash_profile
#

export PATH="/home/vklein52/anaconda3/bin:$PATH"

# added by Anaconda3 5.2.0 installer
export PATH="/anaconda3/bin:$PATH"

# added by Anaconda3 5.2.0 installer
export PATH="/Users/vklein/anaconda3/bin:$PATH"

source $HOME/.bash_aliases
export EDITOR="emacs -nw"

if [ -d "$HOME/.help.d/" ]; then
    source "$HOME/.help.d/"*.help
fi

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/home/vklein52/Downloads/aur/cudatk/opt/cuda/bin:$PATH"
