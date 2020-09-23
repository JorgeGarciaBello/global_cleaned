!##############################################################################################
!
!   Instituto Politécnico Nacional. 
!   Escuela Superior de Física y Matemáticas
!   
!   Autor: M. en C. Jorge Garcia Bello
!
!   renoChi2. Subroutina del experimento de oscilaciones de neutrinos RENO.
!       Tiene la estructura ( Vector Y: son los parámetros de oscilación en un modelo de 4 neutrinos,
!                             chi2_min: es el valor minimo de la estadśitica chi-square para
!                                       valores definidos en el vector Y )
!
!   Descripción =>
!
!        Vector Y(12): t12 es el ángulo de mezcla theta_12
!                    t13 es el ángulo de mezcla theta_13
!                    t14 es el ángulo de mezcla theta_14
!                    t23 es el ángulo de mezcla theta_23
!                    t24 es el ángulo de mezcla theta_24
!                    t34 es el ángulo de mezcla theta_34
!                    delta1 es el factor de fase la violación de CP_13
!                    delta2 es el factor de fase la violación de CP_24
!                    delta3 es el factor de fase la violación de CP_34
!                    dm21 es la direfencia del cuadrado de las masas Solar (m^2_2 - m^2_1)
!                    dm31 es la direfencia del cuadrado de las masas       (m^2_3 - m^2_1)
!                    dm41 es la direfencia del cuadrado de las masas       (m^2_4 - m^2_1)
!
!       chi2_min:    Es el valor minimo develto de la estadística chi utilizada en daya bay  
!                    para valores definidos en Y (parámetros de osciulación)
!
!##############################################################################################

subroutine renoChi2(Y_,chi2_min)
    use types
    use neu_osc_parameters, only: Y, t13
    use reno_data, only: NDIM,NBIN,ADS,RCTS
    implicit none
    real(dp) :: Y_(13)              ! Arreglo con los parámetros de oscilación    
    real(dp) :: chi2_min           ! is the min value of the chi-square
    real(dp) :: dmee
    real(dp) :: Z(NDIM+1)
    real(dp) :: P(NDIM+1,NDIM)
    real(dp) :: data(NBIN,ADS,RCTS)
    real(dp) :: reno_get_chi_square_from_a_set_of_pulls
    REAL*8     X(NDIM),XX(NDIM-1)
    integer :: u

    Y=Y_
    !t12=Y(1)
    !t13=Y(2)
    !t14=Y(3)
    !t23=Y(4)
    !t24=Y(5)
    !t34=Y(6)
    !delta1=Y(7)
    !delta2=Y(8)
    !delta3=Y(9)
    !dm21=Y(10)
    !dm31=Y(11)
    !dm41=Y(12)

    dmee=Y_(2)
    t13=Y_(5)
    call reno_create_antineutrino_number_detector_reactor_bin(dmee,t13)
    select case(1)
        case(1) ! RENO pull analysis
            call reno_minimization_by_solving_system_equation(X)
            chi2_min=reno_get_chi_square_from_a_set_of_pulls(X,XX)     
        case(2) ! RENO Far Data Only  analysis
            !call reno_minimization_by_solving_system_equation_far(XX)
            !chi2_min=reno_get_chi_square_from_a_set_of_pulls(X,XX)
        case(3) ! RENO pull analysis with AMOEBA
            !call reno_minimization(t13,dmee,P,Z)
            !open(newunit=u,file='data/reno_data_pulls.dat')
            !    write(u,*) sin(2.0d0*t13)**2, dmee, Z(1),P(1,:)
            !close(u)
            !chi2_min=Z(1)
    end select
    return
end subroutine renoChi2