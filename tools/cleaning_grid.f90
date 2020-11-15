subroutine cleaning_grid()
    use types
    implicit none
    real(dp) ::   data(851200,5)
    integer  :: i,j,u

    open(newunit=u, file='data/sk.complete.2018.nh.x')
        read(u,*) ((data(i,j), j=1,5), i=1,851200)
    close(u)

    open(newunit=u, file='data/sk-complete-nh.dat')
        do i=1,851200
            write(u,*) data(i,1:4)
        enddo
    close(u)
end subroutine cleaning_grid

