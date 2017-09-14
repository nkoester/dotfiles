# nkoester .bashrc

if [ "$TERM" != "dumb" ]; then

    # netboot fucker
    touch $HOME/.bashrc.techfak
    # source private bash settings...
    source $HOME/.bashrc.techfak

    # netboot fucker
    touch $HOME/.bashrc.priv
    # source private bash settings...
    source $HOME/.bashrc.priv
fi

export TERMINAL="/usr/bin/termite"

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"


#source ~/.xsh

