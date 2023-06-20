CC65_URL = https://github.com/cc65/cc65/archive/refs/tags/V2.19.tar.gz
CC65_DIR = tools/cc65
current_dir = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SPRITE_DEBUG ?= 0

debug: temp/sprite.rle compile assemble link
build: temp/sprite.rle compile assemble link clean
get_dependencies:
	$(info Installing cc65...)
	mkdir -p "${CC65_DIR}"
	curl -L "${CC65_URL}" | tar -xz --strip-components=1 -C "${CC65_DIR}"
	cd "${CC65_DIR}" && $(MAKE)

temp/sprite.rle:
	$(info Compressing sprite.chr...)
	mkdir -p temp
	python3 tools/utils/RLE.py -i sprite.chr -no-delta -o temp/sprite.rle

compile:
	$(info Compling...)
	mkdir -p temp
	mkdir -p rom
	"${CC65_DIR}/bin/cc65" -v -I . -Oi source/c/main.c --add-source --include-dir "${CC65_DIR}/include" -o temp/main.c.asm $(if $(filter $(word 1, ${MAKECMDGOALS}), debug), --debug-info -D SPRITE_DEBUG=${SPRITE_DEBUG})

assemble:
	$(info Assembling...)
	"${CC65_DIR}/bin/ca65" -I . -o temp/crt0.o source/assembly/system-runtime.asm --debug-info 
	"${CC65_DIR}/bin/ca65" -I . -o temp/main.c.o temp/main.c.asm $(if $(filter $(word 1, ${MAKECMDGOALS}), debug), --debug-info)

link:
	$(info Linking...)
	"${CC65_DIR}/bin/ld65" -v -o rom/pizza-tower-demo.nes -C config/ca65.cfg temp/crt0.o temp/main.c.o "${CC65_DIR}/lib/nes.lib" $(if $(filter $(word 1, ${MAKECMDGOALS}), debug), --dbgfile rom/pizza-tower-demo.dbg)

clean:
	rm -R temp/

.PHONY: build
