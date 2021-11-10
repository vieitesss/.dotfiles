for file in ./setup/*
do
    echo "\nEXECUTING FILE $file\n"
    $file
done

echo "EXECUTE :PlugInstall in vim"
echo "EXECUTE Ctrl+B I in tmux"
