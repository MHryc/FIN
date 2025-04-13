FC = gfortran
FFLAGS = -O2

#OUTDIR = bin
#TARGET = $(OUTDIR)/main

all: fin

bin/algorithms.o: src/algorithms.f90
	mkdir -p bin
	$(FC) $(FFLAGS) -c $< -o $@

bin/main: src/main.f90 bin/algorithms.o
	$(FC) $(FFLAGS) -o $@ $^ 

fin: bin/main
	ln -s $< fin
