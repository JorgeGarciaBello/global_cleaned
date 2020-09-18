subroutine db_create_statistical_covariance_matrix(t13,dmee,rand_W_k,Vstat)
    use db_data, only: NBIN,PD,statFarError,N_obs_n, N_obs_f, bkg_all_N_f
                       
    implicit none
    real(8) :: t13, dmee
    real(8) :: rand_W_k(156)    
    real(8) :: Vstat(NBIN*2*PD,NBIN*2*PD)    
    real(8) :: db_N_f_exp_i
    integer :: i, j, u    

    Vstat=0.0d0    
    do i=1,NBIN*2*PD        
        Vstat(i,i)=N_obs_f(i)        
    enddo    
    return
end subroutine db_create_statistical_covariance_matrix