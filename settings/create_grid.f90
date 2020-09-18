subroutine create_grid(t13_min,t13_max,dm_min,dm_max)
    use data_settings, only: n,t13_M_data,dm_M_data
    implicit none    
    real(8) :: t13_min, t13_max                 ! Initial and final Values of the mixing angle
    real(8) :: dm_min, dm_max                   ! Initial and final Values of the mass mixing term
    real(8) :: jump_t13, jump_dm            ! Jumps in th grid    
    integer :: i,j
    integer :: u

    jump_t13=(t13_max-t13_min)/real(n)
    jump_dm =(dm_max -  dm_min)/real(n)

    do i=1,n
        do j=1,n
            t13_M_data(i,j)=t13_min+jump_t13*j
        enddo
    enddo
    call write_matrix_m_n(n,t13_M_data,'grid_t13_M')
    do j=1,n
        do i=1,n
            dm_M_data(i,j)=dm_min+jump_dm*i
        enddo
    enddo
    call write_matrix_m_n(n,dm_M_data,'grid_dm_M')

    open(newunit=u,file='data/grid_data_dmee.dat')
    do i=1,n        
        write(u,*) dm_min+jump_dm*i        
    enddo
    close(u)

    open(newunit=u,file='data/grid_data_s22t13_.dat')
    do i=1,n        
        write(u,*) sin(2.0d0*(t13_min+jump_t13*(i)))**2
    enddo
    close(u)
    return
end subroutine create_grid