program numerov
  implicit none

  integer :: i, n = 6
  real :: h = 1.0

  real, allocatable :: y(:), x(:)

  allocate ( x(0:n) )
  allocate ( y(0:n) )

  x = (/(i*1.0,i=0,n)/)

  y(0) = 0
  y(1) = 1

  do i = 1, n-1
    y(i+1) = (2*y(i)*(1-5*h*h*g(x(i))/12.) - y(i-1)*(1+h*h*g(x(i-1))/12.) + h*h*(s(x(i+1)) + 10*s(x(i)) + s(x(i-1)))/12.)
    y(i+1) = y(i+1)/(1+h*h*g(x(i+1))/12.)
  end do

  print *, (x(i), i=0,n)
  print *, (y(i), i=0,n)

  contains

  real function g(x)
    implicit none
    real :: x
    g = -x
  end function g

  real function s(x)
    implicit none
    real :: x
    s = 0
  end function s
  
end program numerov