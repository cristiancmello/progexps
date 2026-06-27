# Makefile - compila src/hello.ll para x86_64 usando clang/LLVM
#
# Uso:
#   make        -> compila para x86_64 em build/hello
#   make run    -> compila (se preciso) e executa build/hello
#   make debug  -> compila com simbolos de debug (-g) em build/hello_debug
#   make asm    -> gera o assembly (.s) x86_64 em build/hello.s
#   make clean  -> remove os artefatos gerados

CC      := clang
SRC     := src/hello.ll
BUILD   := build
BIN     := $(BUILD)/hello
BIN_DBG := $(BUILD)/hello_debug

TARGET  := x86_64-linux-gnu

.PHONY: all run debug asm clean

all: $(BIN)

$(BUILD):
	mkdir -p $(BUILD)

$(BIN): $(SRC) | $(BUILD)
	$(CC) -target $(TARGET) $(SRC) -o $(BIN)

run: $(BIN)
	./$(BIN); echo "Exit code: $$?"

debug: $(SRC) | $(BUILD)
	$(CC) -g -target $(TARGET) $(SRC) -o $(BIN_DBG)

asm: | $(BUILD)
	$(CC) -S -target $(TARGET) $(SRC) -o $(BUILD)/hello.s

clean:
	rm -rf $(BUILD)