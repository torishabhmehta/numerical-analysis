program practice

  implicit none
  common/dims/n

  integer :: n,i
  real :: xx, h = 1., diff_x
  real, dimension (:), allocatable :: X, Y

  open (unit = 1, file = "../input/practice.in", status = 'old')
  read(1,*) n

  allocate ( X(n) )
  allocate ( Y(n) )

  read(1,*) (X(i), Y(i), i = 1,n)
  close(1)

  do i = 0,4
    xx = 301. + i*h
    diff_x = (interpol(xx + h, X, Y) - interpol(xx, X, Y))/h
    print *, xx, diff_x
  end do

  close(2)

contains

real function Li (xx, X, i)

  implicit none
  common/dims/n

  integer :: n, i, j
  real :: xx, X(n)

  Li = 1.
  do j = 1, n
    if (j == i) cycle
    Li = Li*(xx - X(j))/(X(i) - X(j));
  end do

end function Li

real function interpol (xx, X, Y)

  implicit none
  common/dims/n

  integer :: n, i
  real :: xx, X(n), Y(n)

  interpol = 0.
  do i = 1,n
    interpol = interpol + Li(xx, X, i)*Y(i)
  end do

end function interpol

end program practice


