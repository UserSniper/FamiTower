CC65_URL = https://github.com/cc65/cc65/archive/refs/tags/V2.19.tar.gz
CC65_DIR = tools/cc65
current_dir = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

debug: compile assemble link
build: compile assemble link clean
get_dependencies:
	$(info Installing cc65...)
	mkdir -p "${CC65_DIR}"
	curl -L "${CC65_URL}" | tar -xz --strip-components=1 -C "${CC65_DIR}"
	cd "${CC65_DIR}" && $(MAKE)

compile:
	$(info Compling...)
ifeq (,$(wildcard ./sound/sfx.asm))
	tools/famitone2/nsf2data sound/sfx.nsf -ca65
ifneq (,$(wildcard ./sound/sfx.s))
	$(info nsf2data seems to have compiled to sfx.s instead of sfx.asm, copying...)
	mv sound/sfx.s sound/sfx.asm
else
	$(wildcard ./sound/*)
endif
endif
	mkdir -p temp
	mkdir -p rom
	"${CC65_DIR}/bin/cc65" -I . -Oi source/c/main.c --add-source --include-dir "${CC65_DIR}/include" -o temp/main.c.asm --debug-info 

assemble:
	$(info Assembling...)
	"${CC65_DIR}/bin/ca65" -I . -o temp/crt0.o source/assembly/system-runtime.asm --debug-info 
	"${CC65_DIR}/bin/ca65" -I . -o temp/main.c.o temp/main.c.asm --debug-info 

link:
	$(info Linking...)
	"${CC65_DIR}/bin/ld65" -v -o rom/pizza-tower-demo.nes -C config/ca65.cfg temp/crt0.o temp/main.c.o "${CC65_DIR}/lib/nes.lib" --dbgfile rom/pizza-tower-demo.dbg 

clean:
	rm -R temp/

.PHONY: build