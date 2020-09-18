real(8) function db_cov_M_expected_antineutrino_number_period_detector_bin(P,d,j,i_bin,k,t13,dm31)
    use db_data, only: bines,NBIN,ADS_calibration,p_bines,rand_Nenergy
    implicit none     
    integer :: P                  ! P is the number of the period of data collected
    integer :: d                  ! is the number of detector    
    integer :: j,k,i_bin
    real(8) :: t13, dm31          ! are the neutrino oscillation parameters we are interested
    real(8) :: x                  ! Neutrino energy in [MeV]
    real(8) :: result
    real(8) :: db_cov_M_expected_antineutrino_spectrum_detector
    real(8) :: db_M_energy_relation_anu_prompt
    real(8) :: db_inverse_detector_response_model_function
    real(8) :: db_detector_response_model_function
    real(8) :: db_inv_detector_response
    real(8) :: a,b,h              ! parameters for the integral
    integer :: i,n=10 
    
    a=p_bines(j,1);  b=p_bines(j,2)
    h=(b-a)/real(n)
    result=0.0d0
    do i=1,n
        x=a+h*real(i-1)
        !x=db_inverse_detector_response_model_function(E_rec)
        ! E_true is the input energy. P(E_rec,E_true) is the output energy

        x= db_M_energy_relation_anu_prompt(j,k,db_inv_detector_response(x)) ! E_rec is the input energy. E_nu is the output neutrino energy
        !result=result+ h*db_detector_response_model_function(x)* &
        result=result+ h* &
                        (  db_cov_M_expected_antineutrino_spectrum_detector(x,P,d,i_bin,k,t13,dm31)    &
                           +db_cov_M_expected_antineutrino_spectrum_detector(x+h,P,d,i_bin,k,t13,dm31)  &
                         )/2.0d0
    enddo
    db_cov_M_expected_antineutrino_number_period_detector_bin=result
    return
end function db_cov_M_expected_antineutrino_number_period_detector_bin
