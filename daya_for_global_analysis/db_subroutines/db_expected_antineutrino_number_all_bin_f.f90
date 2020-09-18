real(8) function db_expected_antineutrino_number_all_bin_f(bin,t13,dmee)
    implicit none
    integer :: bin                                 ! is the number of energy bin
    real(8) :: t13, dmee

    real(8) :: expectedNumberNeutrinoByHallPeriodBin    
    integer :: P,H
    real(8) :: result

    result=0.0d0

    if(bin<=26) then
        P=1; H=3;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin,t13,dmee)
    elseif(bin<=52) then
        P=1; H=3;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-26,t13,dmee)
    elseif(bin<=78) then
        P=2; H=3;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-52,t13,dmee)
    elseif(bin<=104) then
        P=2; H=3;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-78,t13,dmee)
    elseif(bin<=130) then
        P=3; H=3;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-104,t13,dmee)
    elseif(bin<=156) then
        P=3; H=3;
        result=expectedNumberNeutrinoByHallPeriodBin(H,P,bin-130,t13,dmee)    
    end if
    db_expected_antineutrino_number_all_bin_f=result
    return
end function db_expected_antineutrino_number_all_bin_f