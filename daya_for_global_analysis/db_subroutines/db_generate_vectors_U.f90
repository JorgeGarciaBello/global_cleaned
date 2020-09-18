subroutine db_generate_vectors_U(t13,dmee,rand_w_i,Nbar_i,U)
    use db_data, only: num_experiments, N_obs_n, N_obs_f, &
                       rand_Nacc_n, rand_Nacc_f, rand_Nalpha_n, rand_Nalpha_f, rand_Namc_n, rand_Namc_f, &
                       rand_NLiHe_n, rand_NLiHe_f, rand_Nfastn_n, rand_Nfastn_f
    implicit none
    real(8) :: t13,dmee    
    real(8) :: rand_w_i(156,num_experiments)
    real(8) :: Nbar_i(156,num_experiments)
    real(8) :: U(156)    
    integer :: i,k
    ! Obtención de vectores Ubar
    do i=1,156
        !$omp parallel do
        do k=1,num_experiments        
            Nbar_i(i,k)= N_obs_f(i) - (  rand_w_i(i,k)*( N_obs_n(i)-(rand_Nacc_n(i,k)+rand_Nalpha_n(i,k)+rand_Namc_n(i,k)+ &
                                                                   rand_NLiHe_n(i,k)+rand_Nfastn_n(i,k)                  &
                                                                  )                                                      &
                                                     )                                                                   &
                                                     +                                                                   &
                                                     ( rand_Nacc_f(i,k)+rand_Nalpha_f(i,k)+rand_Namc_f(i,k)+             &
                                                       rand_NLiHe_f(i,k)+rand_Nfastn_f(i,k)                              &
                                                     )                                                                   &
                                    )       
        enddo
        !$omp end parallel do
        ! OBtención del promedio de los vectores Nbar
        U(i)=sum(Nbar_i(i,:))/real(num_experiments)
    enddo    
    return
end subroutine db_generate_vectors_U