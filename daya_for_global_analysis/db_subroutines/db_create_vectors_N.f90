subroutine db_create_vectors_N(t13,dmee,rand_W_k,N_i)
use db_data, only: N_obs_f
    implicit none
    real(8) :: t13, dmee
    real(8) :: rand_W_k(156)
    real(8) :: N_i(156)
    real(8) :: db_N_f_exp_i    
    integer :: i

    N_i=0.0d0;
    do i=1,156
        N_i(i) = N_obs_f(i)-db_N_f_exp_i(i,rand_W_k,t13,dmee)
    enddo
    return
end subroutine db_create_vectors_N