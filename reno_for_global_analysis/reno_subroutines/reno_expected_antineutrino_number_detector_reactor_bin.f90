!####################################################################
!
!   reno_expected_antineutrino_number_detector_reactor_bin 
!       is the function that return the
!       expected neutirno spectrum by hall
!
!####################################################################
function reno_expected_antineutrino_number_detector_reactor_bin(d,r,bin,t13,dmee)
    use types
    use reno_data, only: NBIN,bines,detector_efficiency,detector_calibration,LT_d,neutrino_energy
    implicit none    
    real(dp) :: reno_expected_antineutrino_number_detector_reactor_bin
    integer  :: d,r,bin
    real(dp) :: t13,dmee    
    real(dp) :: renoExpectedNeutrinoSpectrum_dr !is the expected neutirno spectrum in the detector "d" from all reactors
    real(dp) :: a,b,h               ! limits of the bin    
    integer  :: k,n=5
    real(dp) :: x,result   

    a=bines(bin,1); b=bines(bin,2); h=(b-a)/real(n)
    result=0.0d0
    do k=1,n      
        x=a+h*real(k-1)
        x=neutrino_energy(bin)*x
        if (x<1.8010001) x=1.8010001
        result=result+h*(renoExpectedNeutrinoSpectrum_dr(x,d,r,t13,dmee)+renoExpectedNeutrinoSpectrum_dr(x+h,d,r,t13,dmee))/2.0d0
    enddo
    select case(d)
        case(1) ! Near detector
            reno_expected_antineutrino_number_detector_reactor_bin=1.01267474277184d0*detector_efficiency(d)*  &
                                                                                      86400.0d0*LT_d(d)*       &
                                                                                      detector_calibration(d)* &
                                                                                      0.2d0*(result/(b-a))
        case(2) ! Far detector
            reno_expected_antineutrino_number_detector_reactor_bin=1.08102772018778d0*detector_efficiency(d)*  &                                                                   
                                                                                      86400.0d0*LT_d(d)*       &
                                                                                      detector_calibration(d)* &
                                                                                      0.2d0*(result/(b-a))
   end select
    return
end function reno_expected_antineutrino_number_detector_reactor_bin