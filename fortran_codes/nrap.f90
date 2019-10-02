program nrap

  real :: tol = 1e-4, eta = 100., x(2) = [200.,0.1]

  do while (eta > tol)

    x(2) = x(1) - func(x(1))/diff_func(x(1))
    eta = abs ((x(2) - x(1))*100/x(1))
    x(1) = x(2)

  end do

  print *, "The root of the given expression is : ", x(1) 
  print *, "The error is                        : ", eta


end program nrap

real function func (x)
  real :: x
  func = log(x) + 5*x - 1000
end function func

real function diff_func (x)
  real :: x
  diff_func = 1/x + 5
end function diff_func