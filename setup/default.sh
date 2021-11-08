packages=(vim curl nodejs tmux flameshot)
for i in ${packages[@]}
do
    printf "\nINSTALLING $i\n"
    sleep 2
    sudo apt install $i -y
done

printf "\nINSTALLING vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

printf "\nINSTALLING tmux plugin manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
