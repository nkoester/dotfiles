# nkoester .bashrc

if [ "$TERM" != "dumb" ]; then

    # source private bash settings...
    source $HOME/.bashrc.techfak

    # source private bash settings...
    source $HOME/.bashrc.priv
fi

export TERMINAL="/usr/bin/termite"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"


#source ~/.xsh

