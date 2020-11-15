subroutine db_generate_weight_w_array(t13,dmee,rand_W_k)
    implicit none
    real(8) :: t13, dmee
    real(8) :: rand_W_k(156)
    real(8) :: db_create_w_i
    integer :: i
    
    do i=1,156
        rand_W_k(i)=db_create_w_i(t13,dmee,i)
        print*,'weight: ', i, 'from t13: ', t13, 'dm: ', dmee
    enddo
    return
end subroutine db_generate_weight_w_array