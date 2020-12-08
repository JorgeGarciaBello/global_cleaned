subroutine reno_semi_constant_near_spectrum_per_bin(bin,Y,XX,bin_semi_spectrum)
    use types
    use reno_data, only: NDIM
    implicit none
    integer  :: r,bin
    real(dp) :: bin_semi_spectrum
    real(dp) :: result, Y(12)
    real(dp) :: XX(NDIM)

    bin_semi_spectrum=0.0_dp
    do r=1,6
        call reno_semi_constant_near_spectrum_per_reactor_and_bin(r,bin,Y,result)
        bin_semi_spectrum = bin_semi_spectrum + result*(1.0_dp + XX(1))
    enddo
    return
end subroutine reno_semi_constant_near_spectrum_per_bin