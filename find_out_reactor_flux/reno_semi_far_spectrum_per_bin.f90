subroutine reno_semi_far_spectrum_per_bin(bin,Y,f_spectrum) 
    use types
    implicit none
    integer  :: bin, r
    real(dp) :: Y(12)
    real(dp) :: f_spectrum, result

    f_spectrum=0.0_dp
    do r=1,6
        call reno_semi_far_spectrum_per_reactor_and_bin(r,bin,Y,result)
        f_spectrum = f_spectrum + result
    enddo
    return
end subroutine reno_semi_far_spectrum_per_bin