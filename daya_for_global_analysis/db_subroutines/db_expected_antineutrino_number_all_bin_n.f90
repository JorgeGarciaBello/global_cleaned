real(8) function db_expected_antineutrino_number_all_bin_n(bin,t13,dm31)
    implicit none
    integer :: bin                                 ! is the number of energy bin
    real(8) :: t13, dm31

    real(8) :: expectedNumberNeutrinoByHallPeriodBin    
    integer :: P,H
    real(8) :: result

    result=0.0d0

    if(bin<=26) then
        P=1; H=1;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin,t13,dm31)
    elseif(bin<=52) then
        P=1; H=2;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-26,t13,dm31)
    elseif(bin<=78) then
        P=2; H=1;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-52,t13,dm31)
    elseif(bin<=104) then
        P=2; H=2;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-78,t13,dm31)
    elseif(bin<=130) then
        P=3; H=1;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-104,t13,dm31)
    elseif(bin<=156) then
        P=3; H=2;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-130,t13,dm31)    
    end if
    db_expected_antineutrino_number_all_bin_n=result
    return
end function db_expected_antineutrino_number_all_bin_n