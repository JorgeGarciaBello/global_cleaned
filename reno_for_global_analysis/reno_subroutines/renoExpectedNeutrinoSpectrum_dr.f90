!####################################################################
!
!   renoExpectedNeutrinoSpectrum_dr is the function that return the
!       expected neutirno spectrum in the detector "d" from the
!       reactor "r"
!
!####################################################################
function renoExpectedNeutrinoSpectrum_dr(x,d,r,t13,dmee) ![#/MeV]
    use types
    use reno_data, only: osc,length_d_r,TP_d,NBIN    
    implicit none    
    real(dp) :: renoExpectedNeutrinoSpectrum_dr
    real(dp) :: x,t13,dmee                  ! Neutrino energy in [MeV]
    integer  :: d,r                ! the number ot detector and reactor respectively            
    real(dp) :: reno_probability_of_survival
    real(dp) :: crossSection       ! Is the cross section for the inverse beta decay [m^2]
    real(dp) :: reno_reactorSpectrum    ! Is the spectrum of the reactors    
    !Datos tomados de: Daya Bay Reactor Neutrino Experiment
    !Supplemental Material
    !March 2016    
    renoExpectedNeutrinoSpectrum_dr = (1.0D0 / (4.0D0*3.1415D0*length_d_r(d,r)**2))* &   ![1/m^2]                            
                    reno_probability_of_survival(x,length_d_r(d,r),t13,dmee)*        &
                    reno_reactorSpectrum(x,r)*                                       &   ![#/MeV]                            
                    crossSection(x)*                                                 &   ![m^2]                            
                    TP_d(d)                                                              ![#ofProtons]
        
    return
end function renoExpectedNeutrinoSpectrum_dr