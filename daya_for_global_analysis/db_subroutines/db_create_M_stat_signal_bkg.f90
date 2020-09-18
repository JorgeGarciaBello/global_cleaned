subroutine db_create_M_stat_signal_bkg(t13,dmee,rand_W_k,Nbar_i,U,V)
    use db_data, only: NBIN,PD, num_experiments
    implicit none
    real(8) :: t13,dmee
    real(8) :: rand_W_k(156)
    real(8) :: Nbar_i(156,num_experiments)
    real(8) :: U(156)
    real(8) :: V(NBIN*2*PD,NBIN*2*PD)
    !real(8) :: rand_w_i(156,num_experiments)
    real(8) :: Vstat(NBIN*2*PD,NBIN*2*PD)    
    
    real(8) :: db_M_Total_ij
    integer :: i,j    

    call db_create_statistical_covariance_matrix(t13,dmee,rand_W_k,Vstat)    
    do i=1,NBIN*2*PD
        do j=1,NBIN*2*PD
            V(i,j)=db_M_Total_ij(t13,dmee,i,j,Nbar_i,U)            
        enddo
    enddo    
    V=V+Vstat
    
    call db_get_inverse_covariance_matrix(NBIN*2*PD,V)    
    return
end subroutine db_create_M_stat_signal_bkg