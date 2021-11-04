packages=(vim curl nodejs)
for i in ${packages[@]}
do
    printf "\nINSTALLING $i\n"
    sleep 2
    sudo apt install $i -y
done

printf "\nINSTALLING vim-plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
