subroutine db_generate_B_Nacc()
    use db_data, only: NDIM, PD, num_experiments, rand_Nacc_n, rand_Nacc_f, &
                       bkg_all_N_n, bkg_all_N_f
    implicit none    
    real(8) :: sigma=(0.01d0)
    real(8) :: min_n, max_n, min_f, max_f
    real(8) :: r,re
    integer :: i,n

    do i=1,156
        min_n=bkg_all_N_n(i,1) - bkg_all_N_n(i,1)*sigma
        max_n=bkg_all_N_n(i,1) + bkg_all_N_n(i,1)*sigma

        min_f=bkg_all_N_f(i,1) - bkg_all_N_f(i,1)*sigma
        max_f=bkg_all_N_f(i,1) + bkg_all_N_f(i,1)*sigma

        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Nacc_n(i,n) = min_n*(1.0d0-r) + max_n*r            
            CALL RANDOM_NUMBER(r)
            rand_Nacc_f(i,n) = min_f*(1.0d0-r) + max_f*r
        enddo        
    enddo    
    return
end subroutine db_generate_B_Nacc