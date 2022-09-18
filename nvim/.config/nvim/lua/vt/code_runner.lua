require("code_runner").setup {
  term = {
    size = 50,
    position = "vert botright"
  },
  filetype = {
    python = "python3 $file",
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt && rm $fileNameWithoutExt.class",
    c = "cd $dir && make -f ~/.dotfiles/c/Makefile"
  }
}
