program Gauss

  implicit none
  common/dims/n

  integer :: n, i, j
  real :: sum = 0.
  real, allocatable :: A(:,:), C(:), X(:)

  open (unit = 1, file = "../input/gauss_elim.in", status = 'old')
  read(1,*) n

  allocate ( A(n, n), C(n), X(n) )

  read (1,*) ((A(i,j), j = 1,n), C(i), i = 1,n)
  close(1)

  do i = 1, n-1

    j = i+1

    do while (A(i,1) == 0)
      call Swap (i, j, A, C)
      j = j + 1

      if (j == n) exit
    end do

    call Minus (i, A, C)

  end do

  X(n) = C(n)/A(n,n)

  do i = n-1, 1

    sum = 0.

    do j = n, i+1
      sum = sum + X(j)*A(i,j)
    end do

    X(i) =  (C(i) - sum)/A(i,i)

  end do

  print *, (i, X(i), i = 1,n)

end program Gauss

subroutine Swap (i, j, A, C)

  implicit none
  common /dims/n

  integer :: n, k, i, j
  real :: A(n,n), C(n), x = 0.

  do k = 1, n
    x = A(i,k)
    A(i,k) = A(j,k)
    A(j,k) = x
  end do

  x = C(i)
  C(i) =  C(j)
  C(j) = x

return
end

subroutine Minus (i, A, C)

  implicit none
  common /dims/n

  integer :: n, i, j
  real :: A(n,n), C(n)

  C(i+1) = C(i+1) - C(i)*A(i+1,i)/A(i,i)
  
  do j = n, 1
    A(i+1,j) = A(i+1,j) - A(i,j)*A(i+1,i)/A(i,i)
  end do

return
end 