subroutine db_generate_cross_section()
    use db_data, only: rand_Ncrosssection, num_experiments
    implicit none  
    real(8) :: val  
    real(8) :: sigma=(0.12d0)/100.0d0
    !real(8) :: sigma=(0.2d0)/100.0d0
    real(8) :: min_1, max_1
    real(8) :: r,re
    integer :: i,n    

    val=1.0d0
    min_1=val-sigma
    max_1=val+sigma    

    do i=1,156
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)            
            rand_Ncrosssection(i,1,n) = min_1*(1.0d0-r) + max_1*r            
        enddo
    enddo
    !do i=1, num_experiments
    !    print*, rand_Ncrosssection(1,1,i)
    !enddo
    return
end subroutine db_generate_cross_section