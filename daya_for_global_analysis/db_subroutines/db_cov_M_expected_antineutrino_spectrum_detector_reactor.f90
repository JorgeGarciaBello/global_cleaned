real(8) function db_cov_M_expected_antineutrino_spectrum_detector_reactor(x,d,r,i_bin,k,t13,dmee)
    use db_data, only: length_d_r,TP_d, &
                       rand_Ncrosssection, rand_Nweightedefficiencytp
    implicit none
    real(8) :: x                  ! Neutrino energy in [MeV]
    integer :: d,r,k,i_bin        ! the number ot detector and reactor respectively
    real(8) :: t13,dmee          ! are the neutrino oscillation parameters we are interested    
    real(8) :: db_cov_M_total_antineutrino_flux
    real(8) :: probability, crossSection
    real(8) :: result

    result=0.0d0    
    result = (1.0D0 / (4.0D0*3.1415D0*length_d_r(d,r)**2))*         &   ![1/m^2]
              probability(t13,dmee,length_d_r(d,r),x)*              &
              db_cov_M_total_antineutrino_flux(i_bin,k,r,x)*        &   ![#/MeV]
              rand_Ncrosssection(i_bin,1,k)*crossSection(x)*   &   ![m^2]              
              rand_Nweightedefficiencytp(i_bin,d,k)

    db_cov_M_expected_antineutrino_spectrum_detector_reactor=result  
    return
end function db_cov_M_expected_antineutrino_spectrum_detector_reactor