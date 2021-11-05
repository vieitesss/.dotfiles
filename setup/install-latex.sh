packages=(texlive texlive-full zathura latexmk)
for i in ${packages[@]}
do
    printf "\nINSTALLING $i\n"
    sleep 2
    sudo apt install $i -y
done
