program lagr

  implicit none
  common/dims/n

  integer :: n,i
  real :: xx, val = 0.
  real, dimension (:), allocatable :: X, Y

  open (unit = 1, file = "../input/lagr.in", status = 'old')
  read(1,*) n, xx

  allocate ( X(n) )
  allocate ( Y(n) )

  read(1,*) (X(i), Y(i), i = 1,n)
  close(1)

  do i = 1,n
    val = val + Li(xx, X, i)*Y(i)
  end do

  print *, "The value of the interpolated function is =", val

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

end program lagr


