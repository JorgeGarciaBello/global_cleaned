real(8) function expectedNumberNeutrinoByHallPeriodBin(H,P,j,t13,dm31)
    use db_data, only: calibration_period_hall,first_bin_calibration,second_bin_calibration
                       !correction6ADhalls,correction8ADhalls,correction7ADhalls, &
                       !second_correction6ADhalls,second_correction8ADhalls
    implicit none
    integer :: H                  ! is the number of the experimental hall
    integer :: P                  ! P is the number of the period of data collected
    integer :: j                  ! is the number of bin
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested    
    real(8) :: expectedNumberNeutrinosDetectorBin ! (P,d,j,t13,dm31)

    expectedNumberNeutrinoByHallPeriodBin=0.0d0    
    select case(H)
        case(1)
            expectedNumberNeutrinoByHallPeriodBin= expectedNumberNeutrinoByHallPeriodBin             &
                                                 +expectedNumberNeutrinosDetectorBin(P,1,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(P,2,j,t13,dm31)
        case(2)
            expectedNumberNeutrinoByHallPeriodBin= expectedNumberNeutrinoByHallPeriodBin             &
                                                 +expectedNumberNeutrinosDetectorBin(P,3,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(P,4,j,t13,dm31)
        case(3)
            expectedNumberNeutrinoByHallPeriodBin= expectedNumberNeutrinoByHallPeriodBin &
                                                 +expectedNumberNeutrinosDetectorBin(P,5,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(P,6,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(P,7,j,t13,dm31) &
                                                 +expectedNumberNeutrinosDetectorBin(P,8,j,t13,dm31)
    end select    
    return
end function expectedNumberNeutrinoByHallPeriodBin