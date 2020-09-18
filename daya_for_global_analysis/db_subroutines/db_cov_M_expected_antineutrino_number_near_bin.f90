real(8) function db_cov_M_expected_antineutrino_number_near_bin(j,k,t13,dmee)    
    implicit none
    integer :: j,k
    real(8) :: t13, dmee
    real(8) :: db_cov_M_expected_antineutrino_number_hall_period_bin  ! (H,P,j,k,t13,dmee)
    real(8) :: result
    integer :: H,P    
    result=0.0d0
    if(j<=26) then
        H=1; P=1
        result=db_cov_M_expected_antineutrino_number_hall_period_bin(H,P,j,j,k,t13,dmee)
    else if(j<=52) then
        H=2; P=1
        result=db_cov_M_expected_antineutrino_number_hall_period_bin(H,P,j-26,j,k,t13,dmee)
    else if(j<=78) then
        H=1; P=2
        result=db_cov_M_expected_antineutrino_number_hall_period_bin(H,P,j-52,j,k,t13,dmee)
    else if(j<=104) then
        H=2; P=2
        result=db_cov_M_expected_antineutrino_number_hall_period_bin(H,P,j-78,j,k,t13,dmee)
    else if(j<=130 ) then
        H=1; P=3
        result=db_cov_M_expected_antineutrino_number_hall_period_bin(H,P,j-104,j,k,t13,dmee)
    else if(j<=156 ) then
        H=2; P=3
        result=db_cov_M_expected_antineutrino_number_hall_period_bin(H,P,j-130,j,k,t13,dmee)
    end if
    db_cov_M_expected_antineutrino_number_near_bin=result
    return
end function db_cov_M_expected_antineutrino_number_near_bin