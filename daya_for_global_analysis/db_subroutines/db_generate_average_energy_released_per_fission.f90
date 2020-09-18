subroutine db_generate_average_energy_released_per_fission()
    use db_data, only: rand_Navrgenergyperfission, num_experiments
    implicit none
    real(8) :: sigma=(0.2d0)/100.0d0
    real(8) :: min_1, max_1
    real(8) :: r
    integer :: i,n
    real(8) :: val

    val=205.95586d0
    !val=185.360274d0
    !val=195.658067d0
    !val=199.7771842d0
    !val=203.8963014d0
    !val=208.0154186d0
    !val=212.1345358d0
    !val=216.253653d0
    !val=226.551446d0
    !val=267.742618d0
    !print*, 'val', val

    min_1=val-val*sigma
    max_1=val+val*sigma  

    do i=1,156
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Navrgenergyperfission(i,1,n) = min_1*(1.0d0-r) + max_1*r            
        enddo
    enddo
    !do i=1, num_experiments
    !    print*, rand_Navrgenergyperfission(1,1,i)
    !enddo
    return
end subroutine db_generate_average_energy_released_per_fission