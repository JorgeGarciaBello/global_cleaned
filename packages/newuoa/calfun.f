      SUBROUTINE CALFUN (N,X,F)
      use types      
      implicit none
      integer :: N            ! Dimension of the pull array
      real(dp) :: X(N)        ! Vector of pull's
      real(dp) :: F
      real(dp) :: reno_chi_from_near_constant_flux      
      
      F = reno_chi_from_near_constant_flux(X)
      RETURN
      END

