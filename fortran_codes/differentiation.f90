program differentiation
  implicit none

  real :: h, x, val

  read(*,*) x

  val  = (func(x+h) - func(x-h))/(2*h)

  print *, "The derivative of the function at x =", x, "is", val

contains

real function func (x) 
  real :: x
  func = x
end function func
  
end program differentiation