! I want to implement a procedure that allows generic types for input
! and output. I think the way forward is with the CLASS(*)
! declaration. This works for an 'inout' parameter (both scalar and 1D
! array), but not for an 'out' parameter.
program type_anything

  implicit none

  integer :: x, rx
  real :: y, ry
  integer :: a(3)
  real :: b(3)

  print *, 'Using `inout` scalar parameter'
  x = 5
  write(*,*) 'x in :', x
  call times2scalar(x)
  write(*,*) 'x out:', x

  y = 6.0
  write(*,*) 'y in :', y
  call times2scalar(y)
  write(*,*) 'y out:', y
  print *

  print *, 'Using `inout` array parameter'
  a = [3, 5, 7]
  write(*,*) 'a in :', a
  call times2array(a)
  write(*,*) 'a out:', a

  b = [2, 4, 6]
  write(*,*) 'b in :', b
  call times2array(b)
  write(*,*) 'b out:', b
  print *

  print *, 'Using separate `out` scalar parameters'
  x = 9
  call times2boo(x, rx, ry)
  write(*,*) 'x, rx:', x, rx
  y = 4.5
  call times2boo(y, rx, ry)
  write(*,*) 'y, ry:', y, ry


contains

  subroutine times2scalar(val)
    class(*), intent(inout) :: val

    select type(val)
    type is (integer)
       val = val*2
    type is (real)
       val = val*2.0
    end select
  end subroutine times2scalar

  subroutine times2array(val)
    class(*), intent(inout) :: val(:)

    select type(val)
    type is (integer)
       val = val*2
    type is (real)
       val = val*2.0
    end select
  end subroutine times2array

  subroutine times2boo(val, resi, resr)
    class(*), intent(in), target :: val
    integer, intent(out) :: resi
    real, intent(out) :: resr

    select type(val)
    type is (integer)
       resi = val*2
    type is (real)
       resr = val*2.0
    end select
  end subroutine times2boo

end program type_anything
