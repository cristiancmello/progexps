.PHONY: all tiny debug clean run run-tiny run-debug size

all: build/noop

build:
	mkdir -p build

build/noop.o: src/noop.s | build
	as src/noop.s -o build/noop.o

build/noop: build/noop.o
	ld build/noop.o -o build/noop

tiny: build/noop_tiny

build/noop_tiny: build/noop.o
	ld -N --build-id=none -s build/noop.o -o build/noop_tiny

debug: build/noop_dbg

build/noop_dbg.o: src/noop.s | build
	as -g src/noop.s -o build/noop_dbg.o

build/noop_dbg: build/noop_dbg.o
	ld build/noop_dbg.o -o build/noop_dbg

run: build/noop
	./build/noop; echo "exit code: $$?"

run-tiny: build/noop_tiny
	./build/noop_tiny; echo "exit code: $$?"

run-debug: build/noop_dbg
	gdb build/noop_dbg

size: build/noop build/noop_tiny
	@echo "normal: $$(stat -c%s build/noop) bytes"
	@echo "tiny:   $$(stat -c%s build/noop_tiny) bytes"

clean:
	rm -rf build