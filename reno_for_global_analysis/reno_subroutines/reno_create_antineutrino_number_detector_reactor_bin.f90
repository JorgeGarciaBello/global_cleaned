subroutine reno_create_antineutrino_number_detector_reactor_bin(dmee,t13)
    use types    
    use reno_data, only: NBIN,ADS,RCTS,data
    implicit none
    real(dp) :: t13,dmee                                                      ! are the neutrino oscillation parameters we are interested
    real(dp) :: reno_expected_antineutrino_number_detector_reactor_bin    
    integer  :: d,r,bin,k

    data=0.0_dp
    k=1
    do d=1,ADS
        do r=1,RCTS
            do bin=1,NBIN                
                data(bin,d,r)=reno_expected_antineutrino_number_detector_reactor_bin(d,r,bin,t13,dmee)
            enddo
        enddo
    enddo
    return
end subroutine reno_create_antineutrino_number_detector_reactor_bin