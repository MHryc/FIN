program test
    use algorithms

    implicit none
    real :: output

    print *, trap_int(-1.0, 1.0, [0.0, 0.0, 1.0])
    print *, riemann_int(-1.0, 1.0, [0.0, 0.0, 1.0])

end program
