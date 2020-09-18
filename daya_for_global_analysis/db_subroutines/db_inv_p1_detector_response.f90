real(8) function db_inv_p1_detector_response(E_rec)
    implicit none
    real(8) :: E_rec
    real(8) :: A=-0.14600d0
    real(8) :: B=1.093898d0    
    real(8) :: C

    C=B/(2.0d0*A)
    if(E_rec < 0.96387756000000013d0) then
        db_inv_p1_detector_response=0.0d0
    else if(E_rec <= 0.97974032000000011d0 ) then
        db_inv_p1_detector_response=-sqrt((E_rec/A) + C**2) - C
    else
        db_inv_p1_detector_response=0.0d0
    end if
    return
end function db_inv_p1_detector_response