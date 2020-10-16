module data_settings
    implicit none
    !integer,parameter :: n=1000             ! size of the grid   for RENO only
    integer,parameter :: n=10                ! size of the grid

    real(8) :: t13_M_data(n,n)
    real(8) :: dm_M_data(n,n)
end module data_settings