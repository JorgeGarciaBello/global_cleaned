subroutine db_generate_B_Nfastn()
    use db_data, only: NDIM, PD, num_experiments, rand_Nfastn_n, rand_Nfastn_f, &
                       bkg_all_N_n, bkg_all_N_f
    implicit none    
    real(8) :: sigma_n=(0.13d0)
    real(8) :: sigma_f=(0.17d0)
    real(8) :: min_n, max_n, min_f, max_f
    real(8) :: r
    integer :: i,n
    
    do i=1,156
        min_n=bkg_all_N_n(i,5) - bkg_all_N_n(i,5)*sigma_n
        max_n=bkg_all_N_n(i,5) + bkg_all_N_n(i,5)*sigma_n

        min_f=bkg_all_N_f(i,5) - bkg_all_N_f(i,5)*sigma_f
        max_f=bkg_all_N_f(i,5) + bkg_all_N_f(i,5)*sigma_f

        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Nfastn_n(i,n) = min_n*(1.0d0-r) + max_n*r
            CALL RANDOM_NUMBER(r)            
            rand_Nfastn_f(i,n) = min_f*(1.0d0-r) + max_f*r
        enddo
    enddo
    return
end subroutine db_generate_B_Nfastn