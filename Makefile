OPT=-Os -Wall
CFLAGS=-fno-ident
LDFLAGS=-L. -nostartfiles -nostdlib -Wl,--exclude-all-symbols,--enable-stdcall-fixup,--dynamicbase,--nxcompat,--subsystem,windows:6.0

PREFIX64=C:/mingw64/bin/

CC64=gcc -Wl,-eDllMain -municode

all: hwreqchk.dll

hwreqchk.dll: hwreqchk.c
	$(PREFIX64)$(CC64) $(OPT) $< hwreqchk.def -shared -o $@ $(CFLAGS) $(LDFLAGS)
	strip -s $@

clean:
	rm -f *.dll *.res.o *.a
