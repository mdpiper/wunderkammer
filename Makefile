FC = gfortran
CC = gcc
CFLAGS = -c -std=f2003
LFLAGS =

type_anything:
%: %.o
	${FC} ${LFLAGS} $^ -l${FC} -o $@
	@date	
%.o: %.f90
	${FC} ${CFLAGS} $<

clean:
	rm -rf *~ *.o *.so *.mod type_anything
