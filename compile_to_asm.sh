# $1: name of the c file to compile to assembly
# $2 output path
opt="$(echo $3 | sed -e "s/-O0/$(cat /etc/gcc.opt)/g") -Wno-error -finline-limit=2"

if ! gcc  -I. -I./src  -Wextra -Wall -Wno-unused-parameter -Wno-unused-function -Woverlength-strings  -I./modules/oniguruma/src -g -pthread $opt -S -masm=intel -o "$2" "$1"; then
	echo "error compile to asm"
	exit 1
fi
