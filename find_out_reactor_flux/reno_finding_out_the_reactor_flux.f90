subroutine reno_finding_out_the_reactor_flux()
    use types
    use reno_data, only: NBIN,nearObs, farObs
    implicit none
    integer  :: r, bin
    real(dp) :: bin_constant_flux
    real(dp) :: bin_constant_reactor_flux(NBIN)
    real(dp) :: result, bin_semi_spectrum, f_spectrum
    real(dp) :: Y(12)
    !r=1
    !bin=11
    !call reno_semi_constant_near_spectrum_per_reactor_and_bin(r,bin,result)
    !call reno_semi_constant_near_spectrum_per_bin(bin,bin_semi_spectrum)
    !call reno_constant_near_flux_per_bin(bin,bin_constant_flux)
!    print*, result, bin_semi_spectrum!, bin_constant_flux
    do bin=1,NBIN
        call reno_semi_constant_near_spectrum_per_bin(bin,bin_semi_spectrum)
        bin_constant_reactor_flux(bin)=nearObs(bin)/bin_semi_spectrum
        print*, bin_constant_reactor_flux(bin)!, / (4.0D0*3.1415D0*length_d_r(d,r)**2)
    enddo   

    !Y=0.0_dp
    !do bin=1,NBIN
    !    call reno_semi_far_spectrum_per_bin(bin,Y,f_spectrum) 
    !    print*, f_spectrum
    !enddo

    return
end subroutine reno_finding_out_the_reactor_flux