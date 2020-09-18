!################################################
!
!   spectrum239Pu is the spectrum of 
!                 Plutonium-239
!
!################################################
real(8) function spectrum239Pu(x) ![#/(MeV fission)]
    implicit none
    real(8) :: x      ! Energía de neutinros

    !Espectros de Mueller
    spectrum239Pu = EXP(6.41300D0 -7.43200D0*x + 3.53500D0*x**2 - 0.882000D0*x**3 + 0.102500D0*x**4 -0.00455000D0*x**5)
end function spectrum239Pu