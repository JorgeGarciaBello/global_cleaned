real(8) function db_inv_p6_detector_response(E_rec)
    implicit none
    real(8) :: E_rec
    real(8), parameter :: A=0.00399729020979d0
    real(8), parameter :: B=1.0023179055944d0
    real(8) :: C    

    C=B/(2.0d0*A)
    if(E_rec <= 4.0208351027797216d0 ) then
        db_inv_p6_detector_response=0.0d0
    else if(E_rec <= 4.6952450265733958d0 ) then
        db_inv_p6_detector_response=sqrt((E_rec/A) + C**2) - C
    else
        db_inv_p6_detector_response=0.0d0
    end if
    return
end function db_inv_p6_detector_response