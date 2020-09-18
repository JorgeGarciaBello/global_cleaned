!####################################################################
!
!   expectedNeutrinoSpectrum_dr is the function that return the
!       expected neutirno spectrum in the detector "d" from the
!       reactor "r"
!
!####################################################################
real(8) function expectedNeutrinoSpectrum_dr(x,d,r,t13,dm31) ![#/MeV]
    use db_data, only: osc,length_d_r,TP_d,NBIN,bines,ADS
    !use neu_osc_parameters
    implicit none    
    real(8) :: x                  ! Neutrino energy in [MeV]
    integer :: d,r                ! the number ot detector and reactor respectively
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested
    integer :: i
    
    real(8) :: probabilityOfTransition_4f! Is the probability of transition three-framework
    real(8) :: probabilityOfTransition,probability
    real(8) :: crossSection       ! Is the cross section for the inverse beta decay [m^2]
    real(8) :: reactorSpectrum    ! Is the spectrum of the reactors
    real(8) :: length             ! Is the length between reacto-detector [m]
    real(8) :: corrections(NBIN)    
    real(8) :: cali_ads(ADS), calibration_by_hall(ADS), cali_to_dat(ADS)
    real(8) :: cali_ads_1(ADS), final_calibration(ADS)
    real(8) :: cal(ADS)
    !Datos tomados de: Daya Bay Reactor Neutrino Experiment
    !Supplemental Material
    !March 2016
    !PRINT*, 'expectedNeutrinoSpectrum_dr'
    length = length_d_r(d,r)
    select case(osc)
        case(1)            
            expectedNeutrinoSpectrum_dr = (1.0D0 / (4.0D0*3.1415D0*length**2))* &   ![1/m^2]
                            !probabilityOfTransition_4f(1,1,t12,t13,t14,t23,t24,t34, &
                            !                               delta1,delta2,delta3,    &
                            !                               dm21,dm31,dm41,length,x)*&
                            probability(t13,dm31,length,x)*       &
                            reactorSpectrum(x,r)* &                         ![#/MeV]                            
                            crossSection(x)* &                              ![m^2]                            
                            TP_d(d)                                         ![#ofProtons]
        case(2)
                expectedNeutrinoSpectrum_dr = (1.0D0 / (4.0D0*3.1415D0*length**2))* &   ![1/m^2]                            
                            reactorSpectrum(x,r)* &                         ![#/MeV]
                            crossSection(x)* &                              ![m^2]
                            TP_d(d)                                         ![#ofProtons]
        case DEFAULT
            !expectedNeutrinoSpectrum_dr = (1.0D0 / (4.0D0*3.1415D0*length**2))* &   ![1/m^2]
                            !probabilityOfTransition_4f(1,1,t12,t13,t14,t23,t24,t34, &
                            !                               delta1,delta2,delta3,    &
                            !                               dm21,dm31,dm41,length,x)*&
                            !reactorSpectrum(x,r)* &                         ![#/MeV]
                            !crossSection(x)* &                              ![m^2]
                            !TP_d(d)                                     ![#ofProtons]
    end select
    calibration_by_hall=(/1.05800017511854,1.05800017511854,0.978200128910053,0.978200128910053, &
                          0.924540745574893,0.938977810777609,0.924540745574893,0.938977810777609/)    
    expectedNeutrinoSpectrum_dr=expectedNeutrinoSpectrum_dr!*calibration_by_hall(d)
    return
end function expectedNeutrinoSpectrum_dr