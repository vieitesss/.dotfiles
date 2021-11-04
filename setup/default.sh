packages=(vim curl nodejs)
for i in ${packages[@]}
do
    printf "\nINSTALLING $i\n"
    sleep 
    sudo apt install $i -y
done
