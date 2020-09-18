real(8) function db_N_f_exp_i(i,rand_W_k,t13,dmee)
    use db_data, only: N_obs_n, bkg_t_N_n, bkg_t_N_f
    implicit none
    integer :: i
    real(8) :: rand_W_k(156)
    real(8) :: t13,dmee
    
    real(8) :: db_create_w_i
    
    db_N_f_exp_i=0.0d0
    !db_N_f_exp_i=db_create_w_i(t13,dmee,i)*(N_obs_n(i)-bkg_t_N_n(i)) + bkg_t_N_f(i)
    db_N_f_exp_i=rand_W_k(i)*(N_obs_n(i)-bkg_t_N_n(i)) + bkg_t_N_f(i)
    return
end function db_N_f_exp_i