local status, cr = pcall(require, 'code_runner')
if (not status) then return end

cr.setup {
  startinsert = true,
  term = {
    size = 50,
    position = "vert botright"
  },
  filetype = {
    python = "python3 $file",
    java = "cd $dir && javac $fileName && java $fileNameWithoutExt && rm $fileNameWithoutExt.class",
    c = "cd $dir && make -f ~/.dotfiles/c/Makefile target=$fileNameWithoutExt && make -f ~/.dotfiles/c/Makefile clean"
  }
}
