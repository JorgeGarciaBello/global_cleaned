real(8) function db_inv_detector_response(E_rec)

    implicit none
    real(8) :: E_rec
    real(8) :: db_inv_p1_detector_response,db_inv_p2_detector_response,db_inv_p3_detector_response,db_inv_p4_detector_response
    real(8) :: db_inv_p5_detector_response,db_inv_p6_detector_response,db_inv_p7_detector_response,db_inv_p8_detector_response

    db_inv_detector_response=0.0d0
    if(E_rec <= 0.97974032000000011d0) then
        db_inv_detector_response=db_inv_p1_detector_response(E_rec)
    elseif (E_rec <= 1.9939340000000001d0) then
        db_inv_detector_response=db_inv_p2_detector_response(E_rec)
    elseif (E_rec <= 2.6702332466433574d0) then
        db_inv_detector_response=db_inv_p3_detector_response(E_rec)
    elseif (E_rec <= 3.3470116153846163d0) then
        db_inv_detector_response=db_inv_p4_detector_response(E_rec)
    elseif (E_rec <= 4.0208351027797216d0) then
        db_inv_detector_response=db_inv_p5_detector_response(E_rec)
    elseif (E_rec <= 4.6952450265733958d0) then
        db_inv_detector_response=db_inv_p6_detector_response(E_rec)
    elseif (E_rec <= 5.3176033136612295d0) then
        db_inv_detector_response=db_inv_p7_detector_response(E_rec)
    elseif (E_rec <= 12.630393718784644d0) then
        db_inv_detector_response=db_inv_p8_detector_response(E_rec)
    else
        db_inv_detector_response=0.0d0
    end if
    return
end function db_inv_detector_response