subroutine reno_data_analysis_constant_reactor_flux()
    use types
    use reno_data, only: NBIN, alp
    use neu_osc_parameters, only: Y
    implicit none
    integer, parameter :: n=50
    real(dp) :: dmee, t13, alpha, chi
    real(dp) :: data(n,n,n)
    real(dp) :: dmee_shift, t13_shift, alpha_shift
    real(dp) :: dmee_data(n), t13_data(n), alpha_data(n)
    real(dp) :: t13_i,   t13_f
    real(dp) :: dmee_i,  dmee_f
    real(dp) :: alpha_i, alpha_f
    real(dp) :: alpha_i_j(n,n)
    integer  :: i, j, k, u

    t13_i=asin(sqrt(0.03))/2.0_dp
    t13_f=asin(sqrt(0.12))/2.0_dp

    dmee_i=1.0d-3
    dmee_f=3.5d-3

    alpha_i=0.8_dp
    alpha_f=1.2_dp

    t13_shift   = (t13_f   - t13_i)/real(n)
    dmee_shift  = (dmee_f  - dmee_i)/real(n)
    alpha_shift = (alpha_f - alpha_i)/real(n)
    do i=1,n
        t13_data(i)   = t13_i   +  t13_shift*i
        dmee_data(i)  = dmee_i  +  dmee_shift*i
        alpha_data(i) = alpha_i +  alpha_shift*i        
    enddo

    do i=1,n
        do j=1,n
            !!$omp parallel do private (t13,dmee,alpha,chi,Y)            
            do k=1,n
                t13   = t13_data(i)
                dmee  = dmee_data(j)
                alpha = alpha_data(k)
                !call reno_chi_square_constant_reactor_flux(dmee,t13,chi)
                !alpha_i_j(i,j) = alp
                call reno_chi_square_constant_reactor_flux(dmee,t13,alpha,chi)
                !data(i,j,1) = chi
                data(i,j,k) = chi                
            enddo
            !!$omp end parallel do
        enddo
        print*,i
    enddo
    open(newunit=u, file='find_out_reactor_flux/data_grid_12x12.dat')
    do i=1,n
        do j=1,n
            do k=1,n
                 write(u,*) sin(2.0_dp*t13_data(i))**2, dmee_data(j), alpha_data(k), data(i,j,k)
                 !write(u,*) sin(2.0_dp*t13_data(i))**2, dmee_data(j), alpha_i_j(i,j), data(i,j,1)                 
                 !write(u,*) sin(2.0_dp*t13_data(i))**2, dmee_data(j), data(i,j,1)
            enddo
        enddo
    enddo
    close(u)
    return
end subroutine reno_data_analysis_constant_reactor_flux




