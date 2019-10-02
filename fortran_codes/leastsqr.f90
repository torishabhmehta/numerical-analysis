program leastsqr
  implicit none

  integer :: n, i
  real :: err, S = 0, Sy, a0, a1, xbar = 0, ybar = 0, xsqrbar = 0, ysqrbar = 0, xybar = 0, cc
  real, allocatable :: X(:), Y(:)

  open(unit = 1, file = "../input/leastsqr.in", status = 'old')
  read(1,*) n

  allocate ( X(n) )
  allocate ( Y(n) )

  do i = 1, n
    read(1,*) X(i), Y(i)
    xbar = xbar + X(i)/n
    ybar = ybar + Y(i)/n
    xsqrbar = xsqrbar + X(i)*X(i)/n
    ysqrbar = ysqrbar + Y(i)*Y(i)/n
    xybar = xybar + X(i)*Y(i)/n
  end do

  a1 = (xybar - xbar*ybar)/(xsqrbar - xbar*xbar)
  a0 = ybar - a1*xbar

  do i = 1,n
    err = Y(i) - line(X(i), a0, a1)
    S = S + err*err
  end do

  Sy = n*(ysqrbar - ybar*ybar)

  cc = sqrt((Sy-S)/Sy)

  print *, "The fitted line is: ", a0 , "+", a1 , "x"
  print *, "Error squared is: ", S
  print *, "Corelation Coefficient is: ", cc

contains

real function line (a0, a1, x)
  implicit none
  real :: a0, a1, x
  line = a0 + a1*x
end function line

end program leastsqr