UNAME_S := $(shell uname -s)

INCLUDE = -I. -I/usr/local/include
LIBOPTS = -shared -L/usr/local/lib/lua/5.1 -L/usr/local/lib/
CFLAGS = -O3 -c -fpic -Wall
CC = gcc

ifeq ($(UNAME_S),Darwin)
	LDFLAGS += -lTH -lluajit -lluaT
endif


.PHONY : all
all : lib8cc.so


8cc.o :
	$(CC) $(CFLAGS) $(INCLUDE) 8cc.c


lib8cc.so : 8cc.o
	$(CC) $< $(LIBOPTS) -o $@ $(LDFLAGS)


install : lib8cc.so
	cp lib8cc.so /usr/local/lib/lua/5.1/

uninstall :
	rm /usr/local/lib/lua/5.1/lib8cc.so

.PHONY : clean
clean :
	rm -f *.o lib8cc.so