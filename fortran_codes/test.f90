program integration
  implicit none
  common /dims/n

  real :: a, b, h, I
  integer :: n, ii, weight
  real, allocatable :: X(:), Y(:)

  open (unit = 1, file = "../input/data.in", status = 'old')
  read (1,*) n, a, b

  allocate ( X(n), Y(n) )

  read(1,*) (X(ii), Y(ii), ii = 1,n)
  h = (b-a)/100.

  I = inter(a, X, Y) + inter (b, X, Y)

  do ii = 1,99
    weight = merge(4, 2, mod(ii,2) == 1)
    I = I + weight*inter(a + ii*h, X, Y)
  end do

  I = I*h/3.

  print *, "The integration of the interpolated function is", I

  contains

  real function inter (xx, X, Y)
    implicit none
    common /dims/n

    integer :: n,i
    real :: xx, X(n), Y(n)

    inter = 0
    do i = 1,n
      inter = inter + Li(xx, X, i)*Y(i)
    end do
  end function

  real function Li (xx, X, i)
    implicit none
    common /dims/n

    integer :: n,i,j
    real :: xx, X(n)

    Li = 1.
    do j=1,n
      if (j == i) cycle
      Li = Li*(xx - X(j))/(X(i) - X(j))
    end do
  end function

end program

