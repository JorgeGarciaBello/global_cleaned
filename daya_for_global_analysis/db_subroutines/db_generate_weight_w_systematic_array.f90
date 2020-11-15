subroutine db_generate_weight_w_systematic_array(t13,dmee,rand_w_i)
    use db_data, only: num_experiments, bkg_t_N_n, bkg_t_N_f,rand_Nspectramodel_n, rand_Nspectramodel_f
    use omp_lib
    implicit none
    real(8) :: t13, dmee
    real(8) :: rand_w_i(156,num_experiments)
    real(8) :: db_cov_M_expected_antineutrino_number_far_bin
    real(8) :: db_cov_M_expected_antineutrino_number_near_bin
    integer :: i,k,max
    
    ! Obtención de vectores Nbar    
    !$omp parallel do
    do i=1,156
        do k=1,num_experiments            
            rand_w_i(i,k)=(rand_Nspectramodel_f(i,k)*db_cov_M_expected_antineutrino_number_far_bin(i,k,t13,dmee))/ &
                          (rand_Nspectramodel_n(i,k)*db_cov_M_expected_antineutrino_number_near_bin(i,k,t13,dmee))            
        enddo
        print*, i
    enddo
    !$omp end parallel do
    return
end subroutine db_generate_weight_w_systematic_array