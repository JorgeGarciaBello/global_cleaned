function reno_probability_1(t13,dmee,l,x)
    use types 
     implicit none    
    real(dp) :: reno_probability_1
    real(dp) :: t13, dmee
    real(dp) :: x,l          ! leng is the length between reactor-detector                                               ! leng es la distancia entre r_d en Metros 
    real(dp) :: m21=7.53D-5, m32= 2.44D-3 !Jerarquia normal ! m32= 2.52E-3 !Jerarquia invertida
    real(dp) :: s2_2t12=0.846D0, c2_t12=0.6962D0, s2_t12=0.3038D0
    
    reno_probability_1 = 1.D0 - (cos(t13)**4)*s2_2t12*(sin(1.267D0*m21*l/x)**2) &    
                                        - (sin(2.0D0*t13)**2)*(sin(1.267D0*dmee*l/x)**2)
    return
end function reno_probability_1