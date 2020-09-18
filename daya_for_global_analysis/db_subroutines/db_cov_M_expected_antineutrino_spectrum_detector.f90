real(8) function db_cov_M_expected_antineutrino_spectrum_detector(x,P,d,i_bin,k,t13,dm31) ! [1/MeV]
    use db_data, only: RCTS,LT_d    
    implicit none    
    real(8) :: x                  ! Neutrino energy in [MeV]
    integer :: P                  ! period representa el periodo de colecta de datos (period=1,2,3) 
    integer :: d,k,r,i_bin        ! the number ot detector
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested
    real(8) :: result
    real(8) :: db_cov_M_expected_antineutrino_spectrum_detector_reactor    
    
    result = 0.0
    do r = 1,RCTS
        result=result+db_cov_M_expected_antineutrino_spectrum_detector_reactor(x,d,r,i_bin,k,t13,dm31) ![#/MeV/s]
    enddo 
    db_cov_M_expected_antineutrino_spectrum_detector = 86400.0d0*LT_d(P,d)*result*6.2415D+21
    ! (rand_Nthermalpower) =>  6.2415*1E+21 => [1GW] = [1GJ/s] = [6,2415 × 10^27 eV/s] = [6,2415 × 10^21 MeV/s] Al multiplicar por 86400 se transforman los días a segundos
    return
end function db_cov_M_expected_antineutrino_spectrum_detector
