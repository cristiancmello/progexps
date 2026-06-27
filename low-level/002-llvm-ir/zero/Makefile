# Makefile - compila src/zero.ll para x86_64 usando clang/LLVM
#
# Uso:
#   make        -> compila para x86_64 em build/zero
#   make run    -> compila (se preciso) e executa build/zero
#   make asm    -> gera o assembly (.s) x86_64 em build/zero.s
#   make clean  -> remove os artefatos gerados

CC      := clang -g
SRC     := src/zero.ll
BUILD   := build
BIN     := $(BUILD)/zero

TARGET  := x86_64-linux-gnu

.PHONY: all run asm clean

all: $(BIN)

$(BUILD):
	mkdir -p $(BUILD)

$(BIN): $(SRC) | $(BUILD)
	$(CC) -target $(TARGET) $(SRC) -o $(BIN)

run: $(BIN)
	./$(BIN); echo "Exit code: $$?"

asm: | $(BUILD)
	$(CC) -S -target $(TARGET) $(SRC) -o $(BUILD)/zero.s

clean:
	rm -rf $(BUILD)