subroutine write_results(dim,V,name)
    use types    
    use data_settings,only: t13_M_data,dm_M_data
    implicit none
    integer :: dim
    real(dp) :: V(dim,dim)
    real(dp) :: t13, dmee
    Character(len = *) :: name
    Character(len = 200) :: filename
    integer :: i,j,u
    
    filename='data/chi_matrix_'//name
    open(newunit=u, file=filename)
        do i=1,dim
            write(u,*) V(i,:)
        enddo
    close(u)

    filename='data/'//name
    open(newunit=u, file=filename)
    do i=1,dim
        do j=1,dim
            t13=t13_M_data(i,j);dmee=dm_M_data(i,j)            
            write(u,*) sin(2.0d0*t13)**2, dmee, V(i,j)
        enddo
        write(u,*) ' '
    enddo
    close(u)
    return
end subroutine write_results