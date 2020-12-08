subroutine reno_semi_constant_near_spectrum_per_reactor_and_bin(r,bin,Y,result)
    use types
    use reno_data, only: osc,LT_d,length_d_r,TP_d,NBIN,bines,detector_efficiency
    implicit none
    integer, parameter :: d=1
    integer  :: r,bin    
    real(dp) :: t13,dmee    
    real(dp) :: a,b,h               ! limits of the bin    
    integer  :: k,n=5
    real(dp) :: x,result            ! Neutrino energy in [MeV]    
    real(dp) :: reno_probability_of_survival
    real(dp) :: crossSection       ! Is the cross section for the inverse beta decay [m^2]
    real(dp) :: constant, Y(12)
    
    
    dmee = Y(2) 
    t13  = Y(5)

    a=bines(bin,1); b=bines(bin,2); h=(b-a)/real(n)
    result=0.0d0
    do k=1,n
        x = a + h*real(k-1)
        if (x < 1.8010001) x=1.8010001
        result=result + h*( reno_probability_of_survival(x,length_d_r(d,r),t13,dmee)*crossSection(x) + & 
                            reno_probability_of_survival(x+h,length_d_r(d,r),t13,dmee)*crossSection(x+h))/2.0d0
    enddo
    constant = (detector_efficiency(d)*TP_d(d)*(86400.0d0*LT_d(d))*0.2d0) / (4.0D0*3.1415D0*length_d_r(d,r)**2)
    !constant = (0.9922603691_dp*detector_efficiency(d)*TP_d(d)*(86400.0d0*LT_d(d))*0.2d0) / (4.0D0*3.1415D0*length_d_r(d,r)**2)
    result = constant*result/(b-a)

    return
end subroutine reno_semi_constant_near_spectrum_per_reactor_and_bin