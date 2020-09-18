real(8) function db_detector_response_model_function(x)
    implicit none
    real(8), parameter :: A=0.992288616103d0
    real(8), parameter :: B=0.0189518503428d0
    real(8), parameter :: C=1.01444475577d0
    real(8), parameter :: D=1.00942150338d0
    real(8) :: x            ! X = E_true => It is the true energy

    db_detector_response_model_function=A + B*log(C*x-D)
    return
end function db_detector_response_model_function