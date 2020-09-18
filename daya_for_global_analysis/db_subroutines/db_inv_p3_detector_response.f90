real(8) function db_inv_p3_detector_response(E_rec)
    implicit none
    real(8) :: E_rec
    real(8), parameter :: A=0.021290537587412d0
    real(8), parameter :: B=0.951215262805946d0
    real(8) :: C    

    C=B/(2.0d0*A)
    if(E_rec <= 1.9939340000000001d0) then
        db_inv_p3_detector_response=0.0d0
    else if(E_rec <= 2.6702332466433574d0 ) then
        db_inv_p3_detector_response=sqrt((E_rec/A) + C**2) - C
    else
        db_inv_p3_detector_response=0.0d0
    end if
    return
end function db_inv_p3_detector_response