!##################################################################################################################
!
!       iterativeProbabilityAmplitude: is the amplitud of probability for a neutrino that
!           was born is the zone 'zone' of the Sun with density a_density and energy P
!
!##################################################################################################################


double complex function iterativeProbabilityAmplitude(flvr1,flvr2,L,t12,t23,t13,delta,sm,aM,zone,P,nu,a_density)
    implicit none
    integer :: flvr1              ! flvr1 is the flavour with which the neutrino is generated
    integer :: flvr2              ! flvr2 is the flavour that is transited 
    real(8) :: L                  ! L is the length between the source of neutrinos an the position
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM                ! sm,aM are the squared mass difference m=m_21 y M=m_32
    integer :: zone               ! is the index of the solar layer zone
    real(8) :: P                  ! P es el momento del neutrino
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino    
    real(8) :: a_density(1219)    ! a_density is an array with the corresponding electron densities

    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities
    real(8) :: fState1(3)         ! is the initial flavour eigenstate 
    real(8) :: fState2(3)         ! ! is the final flavour eigenstate

    iterativeProbabilityAmplitude=0.0d0

    select case (flvr1)
        case(1)
            fState1=(/1.0d0,0.0d0,0.0d0/)
        case(2)
            fState1=(/0.0d0,1.0d0,0.0d0/)
        case(3)
            fState1=(/0.0d0,0.0d0,1.0d0/)
        case DEFAULT
            fState1=(/0.0d0,0.0d0,0.0d0/)
            print*, 'No seleccionaste un eigenestado de sabor inicila definido'
    end select

    select case (flvr2)
        case(1)
            fState2=(/1.0d0,0.0d0,0.0d0/)
        case(2)
            fState2=(/0.0d0,1.0d0,0.0d0/)
        case(3)
            fState2=(/0.0d0,0.0d0,1.0d0/)
        case DEFAULT            
            print*, 'No seleccionaste un eigenestado de sabor final definido'
    end select

    call iterativeTimeEvolutionOperator(iterUfL,zone,P,L,t12,t23,t13,delta,sm,aM,nu,a_density)
    
    iterativeProbabilityAmplitude = dot_product(fState1,matmul(iterUfL,fState2))

    return
end function iterativeProbabilityAmplitude