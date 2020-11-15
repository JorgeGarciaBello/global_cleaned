real(8) function db_chi_square_spectral_analysis2_period(t13,dmee)
 use db_data, only: num_experiments,NBIN,PD, i_name,j_name
    implicit none
    real(8) :: t13,dmee
    real(8) :: rand_W_k(156),rand_w_i(156,num_experiments)    
    real(8) :: V(NBIN*2*PD,NBIN*2*PD)
    real(8) :: N_i(156)
    real(8) :: chi, chi_m(156,156)    
    real(8) :: Ubar(156)
    real(8) :: Nbar_i(156,num_experiments)
    character(len=200) :: filename,count_bin,count_perc,format_string,format_string_2
    integer :: i,j,u
    real :: t1,t2    
    call db_generate_weight_w_array(t13,dmee,rand_W_k)
    call db_generate_weight_w_systematic_array(t13,dmee,rand_w_i)

    call db_generate_vectors_U(t13,dmee,rand_w_i,Nbar_i,Ubar)
    !call db_create_vectors_N(t13,dmee,rand_W_k,N_i)

    call db_create_M_stat_signal_bkg(t13,dmee,rand_W_k,Nbar_i,Ubar,V)    
    if (i_name < 10) then
        format_string = "(I1)"
    else
        format_string = "(I2)"
    endif
    if (j_name < 10) then
        format_string_2 = "(I1)"
    else
        format_string_2 = "(I2)"
    endif
    write (count_perc, format_string)  i_name
    write (count_bin, format_string_2)  j_name
    filename='db_ji_vs_bines.dat'
    !filename='db_ji_per_reactor_flux_perc_'//trim(count_perc)//'_all_bin.dat'
    !filename='db_ji_per_reactor_flux_perc_'//trim(count_perc)//'_all_bin_'//trim(count_bin)//'.dat'    
    chi=0.0d0    
    do i=1, NBIN*2*PD                                            ! (# de biines)*(# de combinaciones FAR/NEAR)*(# de periodos de colecta de datos)        
        do j=1,NBIN*2*PD                                         ! (# de biines)*(# de combinaciones FAR/NEAR)*(# de periodos de colecta de datos)
                chi_m(i,j)=Ubar(j)*V(i,j)*Ubar(i)!*A(i,j)
                chi=chi+chi_m(i,j)
        enddo    
    enddo    
    !open(newunit=u, file='db_data/'//filename)
    !do i=1, NBIN*2*PD
    !    write(u,*) i,chi_m(i,i)
    !enddo
    !close(u)
    db_chi_square_spectral_analysis2_period=chi
    return
end function db_chi_square_spectral_analysis2_period