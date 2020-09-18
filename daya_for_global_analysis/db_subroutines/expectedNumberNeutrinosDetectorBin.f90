!##########################################################
!
!   expectedNumberNeutrinosDetectorBin is the function 
!       that return the number of expected neutrinos  
!       per detector and per energy bin, for the given 
!       oscillation parameters:   "t13" and  "dm31"
!
!##########################################################
real(8) function expectedNumberNeutrinosDetectorBin(P,d,j,t13,dm31)
    use db_data, only: bines,p_bines,NBIN,calibration_period_hall
    implicit none     
    integer :: P                  ! P is the number of the period of data collected
    integer :: d                  ! is the number of detector    
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested
    real(8) :: x                  ! Neutrino energy in [MeV]    
    real(8) :: expectedNeutrinoSpectrum_d!is the expected neutirno spectrum in the detector "d"
    real(8) :: db_energy_relation_anu_prompt
    real(8) :: db_detector_response_model_function
    real(8) :: db_inv_detector_response
    real(8) :: a,b,h              ! parameters for the integral
    integer :: i,j,n=10
    real(8) :: cali
    if((j>26).or.(j<1)) print*,'Error, algun indice i en los bines de energía se encuentra fuera del rango aceptado'
    !a=bines(j,1);    b=bines(j,2)
    a=p_bines(j,1);  b=p_bines(j,2)
    h=(b-a)/real(n)
    expectedNumberNeutrinosDetectorBin=0.0d0
    do i=1,n
        x=a+h*real(i-1)
        x=db_energy_relation_anu_prompt(j,db_inv_detector_response(x))
        expectedNumberNeutrinosDetectorBin=expectedNumberNeutrinosDetectorBin           &
                                         + h*db_detector_response_model_function(x)*    &
                                             (  expectedNeutrinoSpectrum_d(x,P,d,t13,dm31)   &
                                               +expectedNeutrinoSpectrum_d(x+h,P,d,t13,dm31) &
                                             )/2.0d0
    enddo
    if(d<=2) then
        cali=calibration_period_hall(P,1)  ! Corresponde a la sala H1
    elseif(d<=4) then
        cali=calibration_period_hall(P,2)  ! Corresponde a la sala H2
    elseif(d<=8) then
        cali=calibration_period_hall(P,3)  ! Corresponde a la sala H3
    end if

    expectedNumberNeutrinosDetectorBin=cali*expectedNumberNeutrinosDetectorBin
    return
end function expectedNumberNeutrinosDetectorBin