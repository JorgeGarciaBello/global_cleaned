subroutine iterativeTimeEvolutionOperator(iterUfL,zone,P,ld,t12,t23,t13,delta,sm,aM,nu,a_density)
    implicit none
    real(8), parameter :: N_A=6.0221415D23  ! N_A is the Avogadro's number [1/mol]
    double complex :: iterUfL(3,3)! iterUfL is the time evolution operator matrix in the flavour base iterative for diferents lengths and electron densities
    integer :: zone               ! is the index of the solar layer zone
    real(8) :: P                  ! P es el momento del neutrino, total energy
    real(8) :: ld                 ! ls is the lengths of the solar ratios and the corresponding electron densities
    real(8) :: a_density(1219)    ! a_density is an array with the corresponding electron densities [1/cm^3 N_A]
    real(8) :: electronDensity    ! Is the electron density in unitis of [N_A/cm^3]
    real(8) :: t12,t23,t13,delta  ! Are the three mixing angles and the CP-violation phase of the mixing matrix
    real(8) :: sm,aM              ! sm,aM are the squared mass difference m=m_21 y M=m_32    
    integer :: nu                 ! nu is 1 for neutrinos an 2 for antineutrino
    
    integer :: k
    double complex :: UfL(3,3)    ! UfL is the time evolution operator matrix in the flavour base
    double complex :: I(3,3)      ! I is the identity matrix

    !print*, 'Estás en iterativeTimeEvolutionOperator'
    call identityMatrix(I)      
    iterUfL=I
    do k=zone,1219
        !print*,'k',k
        electronDensity=(10.d00**a_density(k))!*(N_A**2)  ![N_A/cm^3]=[1/cm^3 N_A]*[N_A**2]
        !print*,'electronDensity',electronDensity
        call timeEvolutionOperatorFlavourBase(UfL,ld,t12,t23,t13,delta,sm,aM,P,nu,electronDensity)
        iterUfL=matmul(UfL,iterUfL)
        !print*,'zone: ',k
    enddo
    !print*, 'finalizo exitosamente iterativeTimeEvolutionOperator'
    return
end subroutine iterativeTimeEvolutionOperator