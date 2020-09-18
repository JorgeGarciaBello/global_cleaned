real(8) function db_inv_p8_detector_response(E_rec)
    implicit none
    real(8) :: E_rec
    real(8), parameter :: A=0.001675839849542d0
    real(8), parameter :: B=1.01483292750646d0
    real(8) :: C    

    C=B/(2.0d0*A)
    if(E_rec <= 5.3176033136612295d0 ) then
        db_inv_p8_detector_response=0.0d0
    else if(E_rec <= 12.630393718784644d0 ) then
        db_inv_p8_detector_response=sqrt((E_rec/A) + C**2) - C
    else
        db_inv_p8_detector_response=0.0d0
    end if
    return
end function db_inv_p8_detector_response