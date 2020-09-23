program main_global
    use types
    use data_settings, only: n,t13_M_data,dm_M_data    
    implicit none
    real(dp) :: RENO_data(n,n),DC_data(n,n),DB_data(n,n)    
    real(dp) :: chi_dayabay, chi_reno, chi_doubleCHOOZ, chi_min_global,db_chi_min
    real(dp) :: db_chi_square_spectral_analysis2_period
    real(dp) :: DC_FUNC    
    real(dp) :: reno_chi_square_spectral_analysis
    real(dp) :: Y(13)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )        
    real(dp) :: val(3)
    integer  :: i,j

    call grid_setting()
    
    call db_read_data()      ! Lee datos de Dayabay
    call readRENOData()    ! Lee datos de RENO    
    Y=0.0

    

   Y(1)=8.0d-5 ! dm2_12   
   !Y(2)=2.5d-3 !dm2_23
   Y(3)=0.0d0 !dm2_34
   
   Y(4)=0.5d0 !theta_12
   !Y(5)=0.1  !theta_13
   Y(6)=0.78  !theta_23
   
   Y(7)=0.0d0 !theta_14
   Y(8)=0.0d0 !theta_24
   Y(9)=0.0d0 !theta_34
   Y(10)=0.0

    do i=1,n
        do j=1,n          
          Y(5)=t13_M_data(i,j); Y(2)=dm_M_data(i,j)

            !####################################################################################################
            !
            !                                         DAYA BAY
            !
            !#####################################################################################################
            !
            !   Covariance Matrix Approach
            !
            !#################################            
            call daya_bay_cov(Y,db_chi_min); DB_data(i,j)=db_chi_min
            
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
end program main_global