      SUBROUTINE RFCN(X,F,N,PAR)
        use reno_data, only: RCTS, ADS
         IMPLICIT REAL*8 (A-H,O-Z)
         REAL*8 X(N),F(N),PAR(1)
         REAL*8 reno_partial_derivative_efficiency
         REAL*8 reno_partial_derivative_energy_scale
         REAL*8 reno_partial_derivative_reactor_flux
         REAL*8 reno_partial_derivative_bkg_near
         REAL*8 reno_partial_derivative_bkg_far

         real(8) :: b_d(ADS)
         real(8) :: fr(RCTS)
         real(8) :: eps
         real(8) :: eta        
         

         b_d=(/X(1),X(2)/)
         fr=(/X(3),X(4),X(5),X(6),X(7),X(8)/)
         eps=X(9)
         eta=X(10)


         F(1)=reno_partial_derivative_efficiency(b_d,fr,eps,eta)

         F(2)=reno_partial_derivative_energy_scale(b_d,fr,eps,eta)

         F(3)=reno_partial_derivative_reactor_flux(1,b_d,fr,eps,eta)
         F(4)=reno_partial_derivative_reactor_flux(2,b_d,fr,eps,eta)
         F(5)=reno_partial_derivative_reactor_flux(3,b_d,fr,eps,eta)
         F(6)=reno_partial_derivative_reactor_flux(4,b_d,fr,eps,eta)
         F(7)=reno_partial_derivative_reactor_flux(5,b_d,fr,eps,eta)
         F(8)=reno_partial_derivative_reactor_flux(6,b_d,fr,eps,eta)

         F(9)=reno_partial_derivative_bkg_near(b_d,fr,eps,eta)
         F(10)=reno_partial_derivative_bkg_far(b_d,fr,eps,eta)

         RETURN
      END