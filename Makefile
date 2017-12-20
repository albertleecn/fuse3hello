CC=gcc
EXES=hello
LIBS=-L/usr/local/lib/i386-linux-gnu -lfuse3 -lpthread
CFLAGS=-I/usr/local/include/fuse3
DEFINES=-D_FILE_OFFSET_BITS=64

MOUNTDIR=testdir

all:${EXES}

hello:hello.o
	${CC} -o $@ hello.o ${DEFINES} ${CFLAGS} ${LIBS} 

hello.o:hello.c
	${CC} -c -Wall ${DEFINES} ${CFLAGS}  $<
	
mount: ${EXES}
	mkdir -p ${MOUNTDIR}
	ls ${MOUNTDIR}
	./hello ${MOUNTDIR}

umount:
	fusermount -u -z ${MOUNTDIR}

clean:
	rm -fr *.o ${EXES}
