subroutine read_grid()
    use data_settings, only: n,t13_M_data,dm_M_data
    implicit none
    call read_matrix(0.,0.,n,t13_M_data,'grid_t13_M.dat')
    call read_matrix(0.,0.,n,dm_M_data,'grid_dm_M.dat')
    return
end subroutine read_grid