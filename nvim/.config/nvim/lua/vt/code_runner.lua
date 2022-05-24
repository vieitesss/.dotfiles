require("code_runner").setup {
    term = {
        size = 50,
        position = "vert botright"
    },
    filetype = {
        python = "python3 $file",
        java = "cd $dir && javac $fileName && java $fileNameWithoutExt && rm $fileNameWithoutExt.class",
        -- c = "cd $dir/.. && if [[ -f Makefile ]]; then make; else echo 'Create a Makefile' && exit 0; fi && ./build/main"
        c = "./execute.sh"
    }
}
