# nkoester .bashrc

if [ "$TERM" != "dumb" ]; then
    
    # netboot fucker
    touch $HOME/nkoester/.bashrc.techfak
    # source private bash settings...
    source $HOME/nkoester/.bashrc.techfak
    
    # netboot fucker
    touch $HOME/.bashrc.priv
    # source private bash settings...
    source $HOME/.bashrc.priv
fi


source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
