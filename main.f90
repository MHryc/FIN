!module utils    
!    contains
!
!end module utils

program integrate
    implicit none

    ! let's leave higher precission for when this program works at all!
    ! use iso_fortran_env, only: real64

    ! this program will integrate polynomial f(x) over a to b range
    character(32) :: filename
    ! differential size
    real, parameter :: dx = 0.01
    ! integration domain, function x and y, final integral value
    real :: a, b, x, y, integral
    ! polynomial coefficients vector
    real, allocatable :: coefs(:)
    ! iterator, file handle, number of args, length of coefs array and existance bool
    integer :: i, io, argcount, coefs_len
    logical :: exists, briefmode
    ! integer for switching which algorithm to use for integration
    integer :: algoswitch

    ! check if filename (and nothing else) was passed
    argcount = command_argument_count()
    if (argcount .ne. 1) then
        print *, "Pass just 1 file"
        stop
    end if

    ! get the arg and check if it is a file that exists
    call get_command_argument(1, filename)
    inquire(file=filename, exist=exists)
    if (.not. exists) then
        print *, "There is no ", filename, " file."
        stop
    end if

    ! handle the file
    open(newunit=io, file=filename, status="old", action="read")
    ! read the number of coefficients from file line1 and the range for integration
    read(io, *) coefs_len, a, b, briefmode
    ! allocate and read coefficients into array based on provided size
    allocate(coefs(coefs_len))
    read(io, *) coefs
    close(io)

    ! printing coefs how I see them
    if (.not. briefmode) then
        print *, "Calculating values of a:", size(coefs), " degree polynomial"
        print *, "over ", "[", a, b, "] range and dx = ", dx
        print *, "With these coefficients:"
        do i = 1, size(coefs)
            print *, coefs(i)
        enddo
        print *, "================"
    endif

    ! get function value at each step and integrate
    integral = 0
    x = a


!    block ! trapezoid approach, doesn't work yet
!        real :: y1, y2, integral2
!        do while (x < b)
!            y1 = 0.0
!            do concurrent(i=1:size(coefs))
!                y1 = coefs(i) * (x)**(i - 1) + y1
!                y2 = coefs(i) * (x + dx)**(i - 1) + y2
!            enddo
!            integral2 = integral + y1 * dx + ((y2 - y1) * dx) / 2
!            x = x + dx
!        enddo
!        print *, integral2
!    endblock

end program integrate
