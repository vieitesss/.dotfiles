for file in ./setup/*
do
    echo "\nEXECUTING FILE $file\n"
    $file
done

print "EXECUTE :PlugInstall in vim"
print "EXECUTE Ctrl+B I in tmux"
