real(8) function db_cov_M_total_antineutrino_flux(i_bin,k,r,x) ! [1/MeV/s]
    use db_data, only: rand_Nthermalpower, rand_Nfissionfraction,                &
                       rand_Navrgenergyperfission, rand_Nenergyperfission,       &    
                       rand_Nhubermuellermodel
    implicit none
    integer :: i_bin
    integer :: k
    integer :: r
    real(8) :: x
    real(8) :: spectrum235U, spectrum238U,spectrum239Pu, spectrum241Pu
    
    db_cov_M_total_antineutrino_flux=0.0d0    
    db_cov_M_total_antineutrino_flux=db_cov_M_total_antineutrino_flux +                   &
        (rand_Nthermalpower(i_bin,r,k)/rand_Navrgenergyperfission(i_bin,1,k))*  &
        (rand_Nfissionfraction(i_bin,1,k))*                                          &        
        spectrum235U(x)                           &
        +                                                                                 &
        (rand_Nthermalpower(i_bin,r,k)/rand_Navrgenergyperfission(i_bin,1,k))*  &
        (rand_Nfissionfraction(i_bin,2,k))*                                          &        
        spectrum238U(x)                           &
        +                                                                                 &
        (rand_Nthermalpower(i_bin,r,k)/rand_Navrgenergyperfission(i_bin,1,k))*  &
        (rand_Nfissionfraction(i_bin,3,k))*                                          &        
        spectrum239Pu(x)                          &
        +                                                                                 &
        (rand_Nthermalpower(i_bin,r,k)/rand_Navrgenergyperfission(i_bin,1,k))*  &
        (rand_Nfissionfraction(i_bin,4,k))*                                          &        
        spectrum241Pu(x)

    db_cov_M_total_antineutrino_flux=rand_Nhubermuellermodel(i_bin,k)*db_cov_M_total_antineutrino_flux!*6.2415D+21
    ! (rand_Nthermalpower) =>  6.2415*1E+21 => [1GW] = [1GJ/s] = [6,2415 × 10^27 eV/s] = [6,2415 × 10^21 MeV/s]   
    return
end function db_cov_M_total_antineutrino_flux