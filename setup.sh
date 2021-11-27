#!/bin/bash

for file in $DOTFILES/setup/*;
do
    printf "\nEXECUTING FILE $file\n"
    $file
done

echo "EXECUTE :PlugInstall in vim"
echo "EXECUTE Ctrl+B I in tmux"
