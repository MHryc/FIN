! --------------------
! module algorithms:
!   This module provides numerical methods for integration, differentation and ODEs 
!   (1) riemann_int()   - Left Riemann sum
!   (2) trap_int()      - Trapezoidal rule
!   (3) basic_diff()    - basic differentation with constant dx
! --------------------

module algorithms
    implicit none

    ! real, parameter :: dx = 0.01

    private
    public :: riemann_int, trap_int, basic_diff

    contains
        pure function riemann_int(a, b, coefs, dx) result(integral)
            real, intent(in) :: a, b, coefs(:)
            real :: x, integral
            real, allocatable :: y(:)
            real :: xvalues(size(coefs))
            integer :: i, j, k
            real, optional :: dx ! optional step size

            if (present(dx)) then
                k = ceiling((b - a) / dx)
                allocate(y(k))

                do concurrent (i=1:k)
                    x = a + (i - 1) * dx
                    y(i) = sum(coefs * [(x**j, j=0, size(coefs) - 1)])
                end do
            else
                k = ceiling((b - a) / 0.01)
                allocate(y(k))

                do concurrent (i=1:k)
                    x = a + (i - 1) * 0.01
                    y(i) = sum(coefs * [(x**j, j=0, size(coefs) - 1)])
                end do
            end if


            integral = sum(y * dx)
        end function riemann_int

        pure function trap_int(a, b, coefs, dx) result(integral)
            real, intent(in) :: a, b, coefs(:)
            real :: x, integral
            real :: x1values(size(coefs)), x2values(size(coefs))
            real, allocatable :: y(:)
            integer :: i, j, k
            real :: y1, y2
            real, optional :: dx ! optional step size

            if (present(dx)) then
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
            else
                k = ceiling(abs(b - a) / 0.01)
                allocate(y(k))

                do concurrent(i=1:k)
                    x = a + (i - 1) * 0.01
                    y(i) = sum(coefs * [(x**j, j=0, size(coefs) - 1)])
                end do

                do concurrent(i=1:k-1)
                    y1 = y(i)
                    y2 = y(i + 1)

                    if (y1 .lt. y2) then
                        integral = integral + y1 * 0.01 + ((y2 - y1) * 0.01) / 2
                    else
                        integral = integral + y2 * 0.01 + ((y1 - y2) * 0.01) / 2
                    end if
                end do
            end if

        end function trap_int

        pure function basic_diff(a, b, coefs, dx) result(diff)
            real, intent(in) :: a, b, coefs(:)
            real :: x, integral
            real, allocatable :: d(:)
            integer :: i, j, k
            real, optional :: dx

            ! this is mostly copied from integration methods, calculating 
            ! differential over a range doesn't make much sense tbh
            if (present(dx)) then
                k = ceiling(abs(b - a) / dx)
                allocate(d(k))

                do concurrent(i=1:k)
                    x = a + (i - 1) * dx
                    d(i) = sum(coefs * [(x**j, j=0, size(coefs) - 1)]) + &
                        sum(coefs * [((x + dx)**j, j=0, size(coefs) - 1)])
                end do
            else
                k = ceiling(abs(b - a) / 0.01)
                allocate(d(k))

                do concurrent(i=1:k)
                    x = a + (i - 1) * 0.01
                    d(i) = sum(coefs * [(x**j, j=0, size(coefs) - 1)]) + &
                        sum(coefs * [((x + dx)**j, j=0, size(coefs) - 1)])
                end do
            end if
        end function

endmodule algorithms
