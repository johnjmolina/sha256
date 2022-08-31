CXX=clang++
CC=clang

#LLVM=/opt/homebrew/opt/llvm/
#CXX=${LLVM}/bin/clang++
#CC=${LLVM}/bin/clang

#GCC=/usr/local
#CXX=${GCC}/bin/g++-11
#CC=${GCC}/bin/gcc-11
#NLOPT=/opt/nlopt/2.70-gcc
#BREWPATH=/opt/homebrew
CFLAGS=-O3
LINKS=-lm

OBJS=sha256.o 
TESTOBJS=sha256_tests.o $(OBJS)
HASHOBJS=hash_file.o $(OBJS)
.SUFFIXES: .c .o

TEST=sha256_tests
HASH=hash_file

all: $(TEST) $(HASH)

$(TEST): $(TESTOBJS)
	$(CC) $(TESTOBJS) -o $(TEST).out $(CFLAGS) $(LINKS)

$(HASH): $(HASHOBJS)
	$(CC) $(HASHOBJS) -o $(HASH).out $(CFLAGS) $(LINKS)

.c.o:
	$(CC) -c $< $(CFLAGS) -o $@

clean:
	rm -f *.o *.out
