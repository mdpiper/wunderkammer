! Change the rank of a Fortran array while preserving the reference to
! the array.
! 
! F03 is needed for rank 1 -> 2. See http://stackoverflow.com/a/5406261.
! F08 is needed for rank 2 -> 1. See http://stackoverflow.com/a/5406584.
! Needs gfortran >= 4.6.

program keep_array_reference

  integer, pointer :: a(:)
  integer, pointer, contiguous :: b(:,:) ! 'contiguous' is F08
  integer, pointer :: c(:)
  integer :: n = 3

  allocate(a(n**2))
  a = 0
  b(1:n, 1:n) => a              ! works in F03

  write(*,*) "Shape of a:", shape(a)
  write(*,*) "Shape of b:", shape(b)

  a(1) = 42
  write(*,*) "a =", a
  write(*,*) "b =", b

  c(1:n**2) => b                ! requires F08
  write(*,*) "Shape of c:", shape(c)
  write(*,*) "c =", c

end program keep_array_reference
