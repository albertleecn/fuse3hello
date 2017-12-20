Dependenced libs:
libfuse3.so.3.2.1
(https://github.com/libfuse/libfuse)
meson-0.44.0
https://github.com/mesonbuild/meson/releases

export LD_LIBRARY_PATH=/usr/local/lib/i386-linux-gnu:$LD_LIBRARY_PATH 
sudo ldconfig

compiling:
gcc -c -Wall -D_FILE_OFFSET_BITS=64 -I/usr/local/include/fuse3  hello.c
gcc -o hello hello.o -D_FILE_OFFSET_BITS=64 -I/usr/local/include/fuse3 -L/usr/local/lib/i386-linux-gnu -lfuse3 -lpthread 

run:
mkdir testdir
##mount:
./hello testdir
##umount:
fusermount -u -z testdir
