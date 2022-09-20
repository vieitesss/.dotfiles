MAKEFLAGS += --silent

flags := -Wall -Wextra -Wshadow -Wpedantic
files := $(shell find . -name '*.c')
# target := exit

.PHONY: all run check clean exit
all: check run

check:
ifeq ($(files),)
	echo '#include <stdio.h>\n\nint main() {\n  printf("Hola mundo\\n");\n  return 0;\n}' > main.c
	echo 'main.c creado'
files := main.c
endif

run: $(target)
	./$(target)

$(target): $(files)
	gcc $(flags) $(files) -o $(target)

clean:
	rm -rf $(target)
