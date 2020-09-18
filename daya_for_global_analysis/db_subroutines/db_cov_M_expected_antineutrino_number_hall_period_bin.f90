real(8) function db_cov_M_expected_antineutrino_number_hall_period_bin(H,P,j,i_bin,k,t13,dm31)
    use db_data, only: calibration_period_hall                       
    implicit none
    integer :: H                  ! is the number of the experimental hall
    integer :: P                  ! P is the number of the period of data collected
    integer :: j,k,i_bin                ! is the number of bin
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested    
    real(8) :: db_cov_M_expected_antineutrino_number_period_detector_bin ! (P,d,j,t13,dm31)
    real(8) :: result

    result=0.0d0    
    select case(H)
        case(1)
            result= result+db_cov_M_expected_antineutrino_number_period_detector_bin(P,1,j,i_bin,k,t13,dm31) &
                          +db_cov_M_expected_antineutrino_number_period_detector_bin(P,2,j,i_bin,k,t13,dm31)
        case(2)
            result= result+db_cov_M_expected_antineutrino_number_period_detector_bin(P,3,j,i_bin,k,t13,dm31) &
                          +db_cov_M_expected_antineutrino_number_period_detector_bin(P,4,j,i_bin,k,t13,dm31)
        case(3)
            result= result+db_cov_M_expected_antineutrino_number_period_detector_bin(P,5,j,i_bin,k,t13,dm31) &
                          +db_cov_M_expected_antineutrino_number_period_detector_bin(P,6,j,i_bin,k,t13,dm31) &
                          +db_cov_M_expected_antineutrino_number_period_detector_bin(P,7,j,i_bin,k,t13,dm31) &
                          +db_cov_M_expected_antineutrino_number_period_detector_bin(P,8,j,i_bin,k,t13,dm31)
    end select
    db_cov_M_expected_antineutrino_number_hall_period_bin=result*calibration_period_hall(P,H)
    return
end function db_cov_M_expected_antineutrino_number_hall_period_bin