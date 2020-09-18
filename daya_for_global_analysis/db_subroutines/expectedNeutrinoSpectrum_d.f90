!####################################################################
!
!   expectedNeutrinoSpectrum_d is the function that return the
!       expected neutirno spectrum in the detector "d" from 
!       all reactors
!
!####################################################################
real(8) function expectedNeutrinoSpectrum_d(x,P,d,t13,dm31)
    use db_data, only: RCTS,LT_d
    !Definición tomada de: 
    !Improved Measurement of the Reactor Antineutrino Flux and Spectrum at Daya Bay
    !Eq (6)    
    implicit none    
    real(8) :: x                  ! Neutrino energy in [MeV]
    integer :: P                  ! period representa el periodo de colecta de datos (period=1,2,3) 
    integer :: d,r                ! the number ot detector
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested   
    real(8) :: expectedNeutrinoSpectrum_dr! Is the expected neutirno spectrum in the detector "d" from the reactor "r"    
    
    expectedNeutrinoSpectrum_d = 0.0
    do r = 1,RCTS
        expectedNeutrinoSpectrum_d = &
            expectedNeutrinoSpectrum_d + &
            expectedNeutrinoSpectrum_dr(x,d,r,t13,dm31) ![#/MeV]
    enddo 
    expectedNeutrinoSpectrum_d = 86400.0d0*LT_d(P,d)*expectedNeutrinoSpectrum_d! Al multiplicar por 86400 se transforman los días a segundos
    return
end function expectedNeutrinoSpectrum_d