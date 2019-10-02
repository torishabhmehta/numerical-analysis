program simpson
  implicit none

  real :: a, b, h, I = 0
  integer :: n, ii, weight

  read(*,*) a, b, n

  h = (b-a)/n;
  I = I + func(a) + func(b);

  do ii = 1,n-1
    weight = merge(4, 2, mod(ii,2) == 1)
    I = I + weight*func(a + ii*h)
  end do

  I = h*I/3.
  print *, "The integration of the above function under limits", a, "and", b, "is:", I

contains

real function func (x)
  implicit none
  real :: x
  func = x**0.5
end function func

end program simpson
