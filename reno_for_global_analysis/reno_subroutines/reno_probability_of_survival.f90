!##################################################################
!
!   reno_probability_of_survival: is the probability of survival
!       for a model of neutrino oscillations with a effective
!       mass difference delta_ee
!
!##################################################################
function reno_probability_of_survival(x, l, t13, dmee)
    use types
    implicit none    
    real(dp) :: reno_probability_of_survival
    real(dp) :: x,l ! l is the lth between reactor-detector                                               ! l es la distancia entre r_d en Metros 
    real(dp) :: t13, dmee    
    real(dp) :: reno_probability_1
    real(dp) :: reno_probability_2
    
    select case(1)
        case(1)
        reno_probability_of_survival=reno_probability_1(t13,dmee,l,x)
        case(2)
        reno_probability_of_survival=reno_probability_2(dmee,l,x)
    end select
    return
end function reno_probability_of_survival