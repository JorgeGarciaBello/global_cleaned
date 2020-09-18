function reno_probability_2(dmee,l,x)
    use types
    use neu_osc_parameters, only: t12,t13,t14,t23,t24,t34,delta1,delta2,delta3,dm21,dm31,dm41
    implicit none
    real(dp) :: reno_probability_2
    real(dp) :: dmee,dm32
    real(dp) :: l,x

    dm32=dm31-dm21
    reno_probability_2= 1.0d0 -cos(t13)**4*sin(2.0d0*t12)**2*sin(1.267d0*dm21*l/x)**2     &
                            -sin(2.0d0*t13)**2*(  cos(t12)**2*sin(1.267d0*dm31*l/x)**2  &
                                                 +sin(t12)**2*sin(1.267d0*dm32*l/x)**2)
    return
end function reno_probability_2