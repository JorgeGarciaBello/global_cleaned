real(8) function reno_get_chi_square_from_a_set_of_pulls(X,XX)
    use reno_data, only: NDIM
    implicit none
    REAL*8     X(NDIM),XX(NDIM-1)    
    real(8) :: reno_FUNC_2
    real(8) :: reno_FUNC_3

    reno_get_chi_square_from_a_set_of_pulls=0.0d0
    reno_get_chi_square_from_a_set_of_pulls=reno_FUNC_2(X)
    !reno_get_chi_square_from_a_set_of_pulls=reno_FUNC_3(XX)
    return
end function reno_get_chi_square_from_a_set_of_pulls