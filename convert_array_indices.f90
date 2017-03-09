! An example of converting the indices of a 9-element rank 1 array
! into the indices of a 3-by-3 rank 2 array. Column major ordering!
program convert_array_indices

  implicit none

  integer, dimension(9) :: a, j, i
  integer :: n, k, ny = 3
  
  n = size(a)

  do k = 1, n
     a(k) = k
  end do
  write(*, "(a, 9(i3))") "a =", a

  do k = 1, n
     j(k) = mod((k-1), ny) + 1
     i(k) = (k-1)/ny + 1
  end do
  write(*, "(a, 9(i3))") "j =", j
  write(*, "(a, 9(i3))") "i =", i

end program convert_array_indices
