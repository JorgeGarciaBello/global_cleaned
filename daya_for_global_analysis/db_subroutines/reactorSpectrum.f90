real(8) function reactorSpectrum(x,r) ! [1/MeV/s]
    use db_data, only: FNF,TP_r,reactor_flux_bin_var
    implicit none
    real(8) :: x                  ! x es la energía de neutrino
    real(8) :: reactorFlu
    real(8) :: spectrum
    real(8) :: spectrum235U
    real(8) :: spectrum238U
    real(8) :: spectrum239Pu
    real(8) :: spectrum241Pu    
    real(8) :: meanThermalEnergy = 205.95586D0 ![MeV/fission^2]    
    integer :: i, r
           
    reactorFlu = 0.0
    do i=1,4
        select case(i)
            case (1)
                spectrum = spectrum235U(x) ![1/fission/Mev]
            case (2)
                spectrum = spectrum238U(x) ![1/fission/Mev]
            case (3)
                spectrum = spectrum239Pu(x) ![1/fission/Mev]
            case (4)
                spectrum = spectrum241Pu(x) ![1/fission/Mev]
        end select
        reactorFlu = reactorFlu + FNF(i)*spectrum
    enddo
    !La definición esta en: 
    !New measurement of θ 13 via neutron capture on hydrogen at Daya Bay    
    reactorSpectrum = reactor_flux_bin_var(1)*(TP_r(r)/meanThermalEnergy)*reactorFlu*6.2415D+21
    ! (TP_r) =>  6.2415*1E+21 => [1GW] = [1GJ/s] = [6,2415 × 10^27 eV/s] = [6,2415 × 10^21 MeV/s]
end function reactorSpectrum