subroutine daya_bay_cov(Y_,db_chi_min)
    use types
    use neu_osc_parameters
    implicit none
    real(dp) :: Y_(13),db_chi_min
    real(dp) :: db_chi_square_spectral_analysis2_period
    real(dp) :: dmee

    Y=Y_

    !t12 = Y(1)
    !t13 = Y(2)
    !t14 = Y(3)
    !t23 = Y(4)
    !t24 = Y(5)
    !t34 = Y(6)

    !delta1=Y(7)
    !delta2=Y(8)
    !delta3=Y(9)

    !dm21=Y(10)
    !dm31=Y(11)
    !dm41=Y(12)
    !dm31=Y(2)
    dmee=Y(2)
    t13=Y(5)
    db_chi_min=db_chi_square_spectral_analysis2_period(t13,dmee)
    return
end subroutine daya_bay_cov