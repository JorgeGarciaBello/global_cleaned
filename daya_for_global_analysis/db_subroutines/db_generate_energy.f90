subroutine db_generate_energy()
    use db_data, only: bin_var,sigma_energy_bin,rand_Nenergy,num_experiments,NBIN
    implicit none  
    !real(8) :: sigma=(0.5d0)/100.0d0    
    real(8) :: min_1(NBIN), max_1(NBIN)
    real(8) :: r
    integer :: i,j,n    
    print*, num_experiments    
    do i=1,NBIN
        min_1(i)=bin_var(i)-bin_var(i)*(sigma_energy_bin(i)/100.0d0)
        max_1(i)=bin_var(i)+bin_var(i)*(sigma_energy_bin(i)/100.0d0)
    enddo
    do i=1,NBIN
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Nenergy(i,n) = min_1(i)*(1.0d0-r) + max_1(i)*r
        enddo
    enddo
    !do i=1, num_experiments
    !    print*, rand_Nenergy(1,i)
    !    print*, rand_Nenergy(26,i)
    !enddo
    return
end subroutine db_generate_energy