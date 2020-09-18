real(8) function reno_reactorSpectrum(x,r) ! [MeV/s]
    use reno_data, only:RCTS,RIR,FNF,TP_r
    implicit none
    real(8) :: x                  ! x es la energía de neutrino
    real(8) :: reactorFlu
    real(8) :: spectrum, spectrum235U, spectrum238U, spectrum239Pu, spectrum241Pu
    real(8) :: meanThermalEnergy = 205.95586D0 ![MeV fission-1]
    integer :: i, r    
       
    reactorFlu = 0.0
    do i=1,4
        select case(i)
            case (1)
                spectrum = spectrum235U(x)
            case (2)
                spectrum = spectrum238U(x)
            case (3)
                spectrum = spectrum239Pu(x)
            case (4)
                spectrum = spectrum241Pu(x)
        end select
        reactorFlu = reactorFlu + FNF(i)*spectrum ![# MeV-1 fission-1]
    enddo
    !La definición esta en: 
    !New measurement of θ 13 via neutron capture on hydrogen at Daya Bay    
    reno_reactorSpectrum = (TP_r(r)/meanThermalEnergy)*reactorFlu*6.2415D+21
    ! 6.2415*1E+21 => [1GW] = [1GJ/s] = [6,2415 × 10^27 eV/s] = [6,2415 × 10^21 MeV/s]
    !                   [MeV/s]*[MeV-1*fission]*[# MeV-1 fission-1]=[# MeV-1 s-1]
end function reno_reactorSpectrum