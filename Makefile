CC65_URL = https://github.com/cc65/cc65/archive/refs/tags/V2.19.tar.gz
CC65_DIR = tools/cc65
current_dir = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SPRITE_DEBUG ?= 0
DEBUG ?= 0

.SILENT:

debug: ARGS = -v --debug-info -g
debug: CCARGS = -D SPRITE_DEBUG=${SPRITE_DEBUG}
debug: CAARGS = -W1
debug: LDARGS = --dbgfile rom/pizza-tower-demo.dbg -v

build: GFXARGS = -s
build: CAARGS = -W0

build: cc65 gfx compile assemble link clean
debug: cc65 gfx compile assemble link

cc65: ${CC65_DIR}/bin/cc65
gfx: $(patsubst graphics/%.chr,temp/%.rle,$(wildcard graphics/*.chr))
compile: temp/main.c.asm
assemble: temp/crt0.o temp/main.c.o
link: rom/pizza-tower-demo.nes

${CC65_DIR}/bin/cc65:
	printf "Installing cc65...\n"
	mkdir -p "${CC65_DIR}"
	wget -c "${CC65_URL}" -O - | tar -xz --strip-components=1 -C "${CC65_DIR}"
	cd "${CC65_DIR}" && $(MAKE) -s

temp/%.rle: graphics/%.chr
	$(info Compressing $<...)
	mkdir -p temp
	python3 tools/utils/RLE.py -i $< -o $@ ${GFXARGS}

temp/main.c.asm: source/c/*.c
	$(info Compling...)
	mkdir -p temp
	mkdir -p rom
	"${CC65_DIR}/bin/cc65" -I . -Oi source/c/main.c --add-source --include-dir "${CC65_DIR}/include" -o temp/main.c.asm ${ARGS} ${CCARGS}

temp/crt0.o: source/assembly/*.asm source/assembly/*.s sound/*.s sound/*.dmc temp/*.rle
	$(info Assembling...)
	"${CC65_DIR}/bin/ca65" -I . -o temp/crt0.o source/assembly/system-runtime.asm ${ARGS} ${CAARGS}
temp/main.c.o: temp/main.c.asm
	"${CC65_DIR}/bin/ca65" -I . -o temp/main.c.o temp/main.c.asm ${ARGS} ${CAARGS}

rom/pizza-tower-demo.nes: temp/crt0.o temp/main.c.o config/ca65.cfg
	$(info Linking...)
	"${CC65_DIR}/bin/ld65" -o rom/pizza-tower-demo.nes -C config/ca65.cfg temp/crt0.o temp/main.c.o "${CC65_DIR}/lib/nes.lib" ${LDARGS}
clean:
	rm -rf temp/
