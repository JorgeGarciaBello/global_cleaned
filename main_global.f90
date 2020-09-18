program main_global
    use types
    use data_settings, only: n,t13_M_data,dm_M_data    
    implicit none
    real(dp) :: RENO_data(n,n),DC_data(n,n),DB_data(n,n)    
    real(dp) :: chi_dayabay, chi_reno, chi_doubleCHOOZ, chi_min_global,db_chi_min
    real(dp) :: db_chi_square_spectral_analysis2_period
    real(dp) :: DC_FUNC    
    real(dp) :: reno_chi_square_spectral_analysis
    real(dp) :: Y(12)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )        
    real(dp) :: val(3)
    integer  :: i,j

    call grid_setting()
    
    call db_read_data()      ! Lee datos de Dayabay
    call readRENOData()    ! Lee datos de RENO    
    
    
    Y=0.0    
    do i=1,n
        do j=1,n
          Y(2)=t13_M_data(i,j); Y(11)=dm_M_data(i,j)

            !####################################################################################################
            !
            !                                         DAYA BAY
            !
            !#####################################################################################################
            !
            !   Covariance Matrix Approach
            !
            !#################################            
            !call daya_bay_cov(Y,db_chi_min); DB_data(i,j)=db_chi_min            
            
            !####################################################################################################
            !
            !                                         RENO
            !
            !#####################################################################################################
            !
            !   Pull Approach
            !
            !#################################
            call renoChi2(Y,chi_reno); RENO_data(i,j) = chi_reno            
       enddo
        !write(u,*) ' '
        print*, i
    enddo
    call write_results(n,RENO_data,'db_data.dat')
  
end program main_global