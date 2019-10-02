program hermite

  implicit none
  common/dims/n

  integer :: n,i
  real :: xx, val = 0.
  real, allocatable :: X(:), Y(:), K(:)

  open (unit = 1, file = "../input/hermite.in", status = 'old')
  read(1,*) n, xx

  allocate ( X(n), Y(n), K(n) )

  read(1,*) (X(i), Y(i), K(i), i = 1,n)
  close(1)

  do i = 1,n
    val = val + ((1-2*(xx-X(i))*Li_dash(X, i))*Y(i) + (xx-X(i))*K(i))*Li(xx, X, i)*Li(xx, X, i)
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

real function Li_dash (X, i)

  implicit none
  common/dims/n

  integer :: n, i, j
  real :: X(n)

  Li_dash = 0.
  do j = 1, n
    if (j == i) cycle
    Li_dash = Li_dash + 1/(X(i) - X(j));
  end do

end function Li_dash

end program hermite


