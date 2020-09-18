subroutine db_generate_fission_fraction()
    use db_data, only: FNF, rand_Nfissionfraction, num_experiments
    implicit none
    real(8) :: sigma=(0.6d0)/100.0d0 ! (0.6%)
    real(8) :: min_1, max_1, min_2, max_2, min_3, max_3, min_4, max_4
    real(8) :: r
    integer :: i,n    

    min_1=FNF(1)-FNF(1)*sigma
    max_1=FNF(1)+FNF(1)*sigma

    min_2=FNF(2)-FNF(2)*sigma
    max_2=FNF(2)+FNF(2)*sigma

    min_3=FNF(3)-FNF(3)*sigma
    max_3=FNF(3)+FNF(3)*sigma

    min_4=FNF(4)-FNF(4)*sigma
    max_4=FNF(4)+FNF(4)*sigma
    

    do i=1,156
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)            
            rand_Nfissionfraction(i,1,n) = min_1*(1.0d0-r) + max_1*r
            CALL RANDOM_NUMBER(r)            
            rand_Nfissionfraction(i,2,n) = min_2*(1.0d0-r) + max_2*r
            CALL RANDOM_NUMBER(r)
            rand_Nfissionfraction(i,3,n) = min_3*(1.0d0-r) + max_3*r
            CALL RANDOM_NUMBER(r)
            rand_Nfissionfraction(i,4,n) = min_4*(1.0d0-r) + max_4*r            
        enddo
    enddo
    !do i=1, num_experiments
    !    print*, rand_Nfissionfraction(1,1,i),rand_Nfissionfraction(1,2,i), rand_Nfissionfraction(1,3,i), &
    !            rand_Nfissionfraction(1,4,i)
    !enddo
    return
end subroutine db_generate_fission_fraction