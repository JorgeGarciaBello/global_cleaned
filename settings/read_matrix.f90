subroutine read_matrix(t13,dmee,dim,V,name)    
    implicit none
    real(8) :: t13,dmee
    integer :: dim    
    real(8) :: V(dim,dim)
    Character(len = *) :: name
    Character(len = 60) :: filename    
    integer :: i,j,u

    filename='data/'//name
    open(newunit=u, file=filename)
    do i=1,dim
            read(u,*) V(i,:)
    enddo
    close(u)
    return
 end subroutine read_matrix