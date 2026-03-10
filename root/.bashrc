if [ -f ~/.bash_profile ]; then
    . ~/.bash_profile
fi

my_exit_script() {
    /root/bin/unmount.sh
}

# Set the trap to run the function on shell exit
trap my_exit_script EXIT
