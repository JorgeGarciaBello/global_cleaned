real(8) function db_M_Total_ij(t13,dmee,i,j,Nbar_i,U)
!real(8) function db_M_Total_ij(t13,dmee,i,j,rand_w_i,Nbar_i,U)
    use db_data, only: num_experiments, N_obs_n, N_obs_f, bkg_t_N_n, bkg_t_N_f,  &
                       rand_Nacc_n, rand_Nacc_f, rand_Nalpha_n, rand_Nalpha_f, rand_Namc_n, rand_Namc_f, &
                       rand_NLiHe_n, rand_NLiHe_f, rand_Nfastn_n, rand_Nfastn_f
    implicit none
    real(8) :: t13,dmee    
    integer :: i,j
    real(8) :: rand_w_i(156,num_experiments)
    real(8) :: U(156)
    real(8) :: Nbar_i(156,num_experiments)
    integer :: k    
    ! Obtención la entrada ij de la matriz M de la incertidumbre en Accidental-Background
    db_M_Total_ij=0.0d0
    do k=1,num_experiments
        db_M_Total_ij=db_M_Total_ij+(  Nbar_i(i,k) - U(i)  )  *  ( Nbar_i(j,k) - U(j) )
    enddo     

    db_M_Total_ij=db_M_Total_ij/real(num_experiments)
    return
end function db_M_Total_ij