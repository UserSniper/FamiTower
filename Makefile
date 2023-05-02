build: compile assemble link clean
compile:
ifeq (,$(wildcard ./sound/sfx.asm))
	tools/famitone2/nsf2data sound/sfx.nsf -ca65
ifneq (,$(wildcard ./sound/sfx.s))
	mv sound/sfx.s sound/sfx.asm
endif
endif
	mkdir -p temp
	tools/cc65/bin/cc65 -v -I . -Oi source/c/main.c --add-source --include-dir ./tools/cc65/include -o temp/main.c.asm --debug-info 
assemble:
	tools/cc65/bin/ca65 -I . -o temp/crt0.o source/assembly/system-runtime.asm --debug-info 
	tools/cc65/bin/ca65 -I . -o temp/main.c.o temp/main.c.asm --debug-info 
link:
	tools/cc65/bin/ld65 -v -o rom/pizza-tower-demo.nes -C config/ca65.cfg temp/crt0.o temp/main.c.o tools/cc65/lib/nes.lib --dbgfile rom/pizza-tower-demo.dbg 
clean:
	rm -R temp/