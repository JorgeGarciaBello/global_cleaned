!subroutine reno_chi_square_constant_reactor_flux(dmee,t13,chi)
subroutine reno_chi_square_constant_reactor_flux(dmee,t13,alpha,chi)
    use types
    use reno_data, only: NDIM, reno_chi_from_newoua,alp
    use neu_osc_parameters, only: Y
    implicit none
    real(dp) :: dmee,t13, alpha,chi
    real(dp) :: X(NDIM),W(10000)
    integer  :: IPRINT=2
    integer  :: MAXFUN=5000
    real(dp) :: RHOBEG
    real(dp) :: RHOEND=1.0D-6
    integer  :: N,NPT

    alp = alpha
    Y=0.0_dp
    Y(2) = dmee
    Y(5) = t13

    N=NDIM
    NPT=2*N+1
    X(1)=DFLOAT(1)/DFLOAT(N+1)    
    RHOBEG=0.2D0*X(1)  
    CALL NEWUOA (N,NPT,X,RHOBEG,RHOEND,IPRINT,MAXFUN,W)    
    chi=reno_chi_from_newoua    
    return
end subroutine reno_chi_square_constant_reactor_flux