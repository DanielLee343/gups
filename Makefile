# Makefile for Linux

SHELL = /bin/sh

# System-specific settings
CC = 	mpicc
LINK = 	mpicc
OPT_FLAGS = 	-O3 -march=native
COMMON_FLAGS =	$(OPT_FLAGS) -DCHECK

# Default target
all: gups_vanilla gups_nonpow2 gups_opt

# Link targets

gups_vanilla: gups_vanilla.o
	$(LINK) $(COMMON_FLAGS) -g gups_vanilla.o -lmpich -o gups_vanilla

gups_nonpow2: gups_nonpow2.o
	$(LINK) $(COMMON_FLAGS) -g gups_nonpow2.o -o gups_nonpow2

gups_opt: gups_opt.o
	$(LINK) $(COMMON_FLAGS) -g gups_opt.o -o gups_opt

# Compilation rules

%.o:%.c
	$(CC) $(CCFLAGS) -c $<

# Clean target
clean:
	rm -f gups_vanilla gups_nonpow2 gups_opt *.o