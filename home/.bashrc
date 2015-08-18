# nkoester .bashrc

if [ "$TERM" != "dumb" ]; then
    
    # netboot fucker
    touch /homes/nkoester/.bashrc.techfak
    # source private bash settings...
    source /homes/nkoester/.bashrc.techfak
    
    # netboot fucker
    touch /homes/nkoester/.bashrc.priv
    # source private bash settings...
    source /homes/nkoester/.bashrc.priv
fi


source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source "$HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash"
