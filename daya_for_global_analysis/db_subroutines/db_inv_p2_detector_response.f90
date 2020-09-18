real(8) function db_inv_p2_detector_response(E_rec)
    implicit none
    real(8) :: E_rec
    real(8), parameter :: A=0.056274671052632d0
    real(8), parameter :: B=0.884417657894736d0
    real(8) :: C    

    C=B/(2.0d0*A)               
    if(E_rec <= 0.97974032000000011d0) then
        db_inv_p2_detector_response=0.0d0
    else if(E_rec <= 1.9939340000000001d0 ) then
        db_inv_p2_detector_response=sqrt((E_rec/A) + C**2) - C
    else
        db_inv_p2_detector_response=0.0d0
    end if
    return
end function db_inv_p2_detector_response