function db_probability_2(dmee,l,x)
    use types
    use neu_osc_parameters, only: t12,t13,t14,t23,t24,t34,delta1,delta2,delta3,dm21,dm31,dm41,Y
    implicit none
    real(dp) :: db_probability_2
    real(dp) :: dmee,dm32
    real(dp) :: l,x
    dm21=Y(1)
    dm32=Y(2)
    !Y(3)=0.0d0 !dm2_34
    t12=Y(4)
    t13=Y(5)
    !Y(6)=0.78d0  !theta_23
    !Y(7)=0.0d0 !theta_14
    !Y(8)=0.0d0 !theta_24
    !Y(9)=0.0d0 !theta_34
    !Y(10)=0.0
    !Y(11)=0.0       
    !Y(12)=0.0       
    !Y(13)=0.0

    !dm32=dm31-dm21
    dm31=dm32+dm21
    db_probability_2= 1.0d0 -cos(t13)**4*sin(2.0d0*t12)**2*sin(1.267d0*dm21*l/x)**2     &
                            -sin(2.0d0*t13)**2*(  cos(t12)**2*sin(1.267d0*dm31*l/x)**2  &
                                                 +sin(t12)**2*sin(1.267d0*dm32*l/x)**2)
    return
end function db_probability_2