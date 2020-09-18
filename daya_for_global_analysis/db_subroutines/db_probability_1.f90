function db_probability_1(t13,dmee,l,x)
    use types 
    implicit none
    real(dp) :: db_probability_1
    real(dp) :: t13,dmee
    real(dp) :: l,x
    real(dp) :: t12=0.5837630476d0
    real(dp) :: dm21=7.53D-5

    db_probability_1= 1.0d0 - cos(t13)**4*sin(2.0d0*t12)**2*sin(1.267d0*dm21*l/x)**2   &
                            - sin(2.0d0*t13)**2*sin(1.267d0*dmee*l/x)**2
    return
end function db_probability_1