require("code_runner").setup {
    term = {
        position = "vert",
        size = 40
    },
    filetype = {
        python = "python3 $file",
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt && rm $fileNameWithoutExt.class"
    }
}
