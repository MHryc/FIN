! --------------------
! module algorithms:
!   This module provides implementations of numerical integration algorithms.
!   (1) riemann_int()   - Left Riemann sum
!   (2) trap_int()      - Trapezoidal rule
! --------------------

module algorithms
    implicit none

    real, parameter :: dx = 0.01

    private
    public :: riemann_int, trap_int

    contains
        pure function riemann_int(a, b, coefs) result(integral)
            real, intent(in) :: a, b, coefs(:)
            real :: x, integral
            real, allocatable :: y(:)
            real :: xvalues(size(coefs))
            integer :: i, j, k

            k = ceiling(abs(b - a) / dx)
            allocate(y(k))

            do concurrent (i=1:k)
                x = a + (i - 1) * dx
                y(i) = sum(coefs * [(x**j, j=0, size(coefs) - 1)])
            end do

            integral = sum(y * dx)
        end function riemann_int

        pure function trap_int(a, b, coefs) result(integral)
            real, intent(in) :: a, b, coefs(:)
            real :: x, integral
            real :: x1values(size(coefs)), x2values(size(coefs))
            real, allocatable :: y(:)
            integer :: i, j, k
            real :: y1, y2

            k = ceiling(abs(b - a) / dx)
            allocate(y(k))

            do concurrent(i=1:k)
                x = a + (i - 1) * dx
                y(i) = sum(coefs * [(x**j, j=0, size(coefs) - 1)])
            end do

            do concurrent(i=1:k-1)
                y1 = y(i)
                y2 = y(i + 1)

                if (y1 .lt. y2) then
                    integral = integral + y1 * dx + ((y2 - y1) * dx) / 2
                else
                    integral = integral + y2 * dx + ((y1 - y2) * dx) / 2
                end if

            end do
        end function trap_int

endmodule algorithms
