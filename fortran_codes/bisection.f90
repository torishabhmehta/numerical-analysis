program bisection   
    
  real :: xl = 3., xu = 4., tol = 1e-4, eta = 100., xm(2)
  integer :: n = 0

  do while (eta > tol)

    xm(2) = (xu + xl)/2.

    if (func(xm(1))*func(xu) > 0) then 
      xu = xm(2)
    else 
      xl = xm(2)
    end if

    if (n > 0) then
      eta = abs ((xm(2) - xm(1))*100/xm(1))
    end if

      xm(1) = xm(2)
      n = n + 1

  end do


  print *, "The root of the given expression is :", xm(1)
  print *, "The tolerance is                    :", eta
    
end program bisection

real function func (x)
  real :: x 
  func =  4*exp(-x)*(3.2*sin(x) - 0.5*cos(x))
end function func
    