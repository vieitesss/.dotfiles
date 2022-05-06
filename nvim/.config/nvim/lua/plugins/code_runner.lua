require("code_runner").setup {
    term = {
        size = 10
    },
    filetype = {
        python = "python3 $file",
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt && rm $fileNameWithoutExt.class",
        c = "cd $dir && gcc $fileName -o comp && ./comp"
    }
}
