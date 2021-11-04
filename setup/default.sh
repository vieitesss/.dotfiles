packages=(vim curl nodejs)
for i in packages
do
    echo "installing $i\n"
    sleep 2
    sudo apt install $i
done
