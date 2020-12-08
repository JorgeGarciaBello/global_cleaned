subroutine reno_semi_far_spectrum_per_reactor_and_bin(r,bin,Y,XX,result)
    use types
    use reno_data, only: NBIN, NDIM, bines, nearObs, constant_flux_per_bin,length_d_r,LT_d,TP_d,detector_efficiency, bkg
    implicit none
    integer, parameter :: d=2
    integer  :: r,bin
    real(dp) :: result
    real(dp) :: t13,dmee
    real(dp) :: a,b,h               ! limits of the bin    
    integer  :: k,n=5
    real(dp) :: x
    real(dp) :: reno_probability_of_survival
    real(dp) :: bin_constant_reactor_flux(NBIN)
    real(dp) :: crossSection       ! Is the cross section for the inverse beta decay [m^2]
    real(dp) :: constant, Y(12), bin_semi_spectrum
    real(dp) :: XX(NDIM)

    dmee = Y(2) 
    t13  = Y(5)
    
    call reno_semi_constant_near_spectrum_per_bin(bin,Y,XX,bin_semi_spectrum)
    bin_constant_reactor_flux(bin)=nearObs(bin)/(bin_semi_spectrum*(1.0_dp+XX(2)+XX(3)) + bkg(bin,1)*XX(5) )

    a=bines(bin,1); b=bines(bin,2); h=(b-a)/real(n)
    result=0.0d0
    do k=1,n
        x = a + h*real(k-1)
        if (x < 1.8010001) x=1.8010001
        result=result + h*( reno_probability_of_survival(x,length_d_r(d,r),t13,dmee)*crossSection(x) + & 
                            reno_probability_of_survival(x+h,length_d_r(d,r),t13,dmee)*crossSection(x+h))/2.0d0
    enddo
    constant = (detector_efficiency(d)*TP_d(d)*(86400.0d0*LT_d(d))*0.2d0) / (4.0D0*3.1415D0*length_d_r(d,r)**2)
    result = bin_constant_reactor_flux(bin)*constant*result/(b-a)
    return
end subroutine reno_semi_far_spectrum_per_reactor_and_bin