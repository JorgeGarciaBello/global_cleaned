!##################################################################
!
!   reno_probability_of_survival: is the probability of survival
!       for a model of neutrino oscillations with a effective
!       mass difference delta_ee
!
!##################################################################
function reno_probability_of_survival(x, l, t13, dmee)
    use types
    use neu_osc_parameters, only: Y
    implicit none    
    real(dp) :: reno_probability_of_survival
    real(dp) :: x,l ! l is the lth between reactor-detector                                               ! l es la distancia entre r_d en Metros 
    real(dp) :: t13, dmee    
    real(dp) :: reno_probability_1
    real(dp) :: reno_probability_2
    real(dp) :: P(3),Pbar(3)
    select case(2)
        case(1)
        reno_probability_of_survival=reno_probability_1(t13,dmee,l,x)
        case(2)
        call prob_cp(Y,l,x,P,Pbar)
        reno_probability_of_survival=P(1)
        !reno_probability_of_survival=Pbar(1)
    end select
    return
end function reno_probability_of_survival