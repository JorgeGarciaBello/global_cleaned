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
    real(dp) :: t13, t12,t23, dmee, delta
    real(dp) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32
    integer  :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(dp) :: Ne                 ! Ne is the electron density
    real(dp) :: ro                 ! ro
    integer  :: Z                  ! Z
    integer  :: A                  ! A
    real(dp) :: reno_probability_1
    real(dp) :: reno_probability_2
    real(dp) :: probability_of_transition_in_matter_a_b
    real(dp) :: P(3),Pbar(3)
    select case(1)
        case(1)
        reno_probability_of_survival=reno_probability_1(t13,dmee,l,x)
        case(2)
        call prob_cp(Y,l,x,P,Pbar)
        reno_probability_of_survival=P(1)
        !reno_probability_of_survival=Pbar(1)
        case(3)
            nu=1
            ro=0.0_dp
            Z=0
            A=1
            sm=Y(1)     ! Y(1)  = dm2_12   
            aM=Y(2)     ! Y(2)  = dm2_32
                        ! Y(3)  = dm2_34
            t12=Y(4)    ! Y(4)  = t12
            t13=Y(5)    ! Y(5)  = t13
            t23=Y(6)    ! Y(6)  = t23
                        ! Y(7)  = t14
                        ! Y(8)  = t24
                        ! Y(9)  = t34
            delta=Y(10) ! Y(10) = delta1
                        ! Y(11) = delta2
                        ! Y(12) = delta3    
                        ! Y(13) = [?]
        reno_probability_of_survival=probability_of_transition_in_matter_a_b(1,1,l,t12,t23,t13,delta,sm,aM,x,nu,ro,Z,A)
    end select
    return
end function reno_probability_of_survival