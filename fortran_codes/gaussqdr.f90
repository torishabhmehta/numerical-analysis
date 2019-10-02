program gaussqdr
  implicit none

  real :: a, b, x, C, t, I = 0
  integer :: n, ii

  open(unit = 1, file = "../input/gaussqdr.in", status = 'old')
  read(1,*) n
  read(1,*) a, b

  do ii = 1,n-1
    read(1,*) C, t
    x = (b-a)*t/2 + (b+a)/2
    I = I + C*func(x)*(b-a)/2
  end do
  
  print *, "The integration of the above function under limits", a, "and", b, "is:", I

contains

real function func (x)
  implicit none
  real :: x
  func = 2*x**2 -3*x
end function func

end program gaussqdr
