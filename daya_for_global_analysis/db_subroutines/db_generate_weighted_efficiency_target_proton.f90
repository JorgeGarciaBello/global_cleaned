subroutine db_generate_weighted_efficiency_target_proton()
    use db_data, only: TP_d, rand_Nweightedefficiencytp, num_experiments,sigma_efficiency
    implicit none
    real(8) :: sigma!=(1.93d0)/100.0d0!+ (0.13d0)/100
    real(8) :: min_1, max_1, min_2, max_2, min_3, max_3, min_4, max_4
    real(8) :: min_5, max_5, min_6, max_6, min_7, max_7, min_8, max_8
    real(8) :: r
    integer :: i,n
    
    sigma =sigma_efficiency/100.0d0    
    min_1=TP_d(1)-TP_d(1)*sigma
    max_1=TP_d(1)+TP_d(1)*sigma

    min_2=TP_d(2)-TP_d(2)*sigma
    max_2=TP_d(2)+TP_d(2)*sigma

    min_3=TP_d(3)-TP_d(3)*sigma
    max_3=TP_d(3)+TP_d(3)*sigma

    min_4=TP_d(4)-TP_d(4)*sigma
    max_4=TP_d(4)+TP_d(4)*sigma

    min_5=TP_d(5)-TP_d(5)*sigma
    max_5=TP_d(5)+TP_d(5)*sigma

    min_6=TP_d(6)-TP_d(6)*sigma
    max_6=TP_d(6)+TP_d(6)*sigma

    min_7=TP_d(7)-TP_d(7)*sigma
    max_7=TP_d(7)+TP_d(7)*sigma

    min_8=TP_d(8)-TP_d(8)*sigma
    max_8=TP_d(8)+TP_d(8)*sigma
    
    do i=1,156
        if(i<=52) then
            sigma =(sigma_efficiency-0.03d0+0.2d0)/100.0d0    
            min_1=TP_d(1)-TP_d(1)*sigma
            max_1=TP_d(1)+TP_d(1)*sigma

            min_2=TP_d(2)-TP_d(2)*sigma
            max_2=TP_d(2)+TP_d(2)*sigma

            min_3=TP_d(3)-TP_d(3)*sigma
            max_3=TP_d(3)+TP_d(3)*sigma

            min_4=TP_d(4)-TP_d(4)*sigma
            max_4=TP_d(4)+TP_d(4)*sigma

            min_5=TP_d(5)-TP_d(5)*sigma
            max_5=TP_d(5)+TP_d(5)*sigma

            min_6=TP_d(6)-TP_d(6)*sigma
            max_6=TP_d(6)+TP_d(6)*sigma

            min_7=TP_d(7)-TP_d(7)*sigma
            max_7=TP_d(7)+TP_d(7)*sigma

            min_8=TP_d(8)-TP_d(8)*sigma
            max_8=TP_d(8)+TP_d(8)*sigma
        else
            sigma =(sigma_efficiency+0.13d0)/100.0d0    
            min_1=TP_d(1)-TP_d(1)*sigma
            max_1=TP_d(1)+TP_d(1)*sigma

            min_2=TP_d(2)-TP_d(2)*sigma
            max_2=TP_d(2)+TP_d(2)*sigma

            min_3=TP_d(3)-TP_d(3)*sigma
            max_3=TP_d(3)+TP_d(3)*sigma

            min_4=TP_d(4)-TP_d(4)*sigma
            max_4=TP_d(4)+TP_d(4)*sigma

            min_5=TP_d(5)-TP_d(5)*sigma
            max_5=TP_d(5)+TP_d(5)*sigma

            min_6=TP_d(6)-TP_d(6)*sigma
            max_6=TP_d(6)+TP_d(6)*sigma

            min_7=TP_d(7)-TP_d(7)*sigma
            max_7=TP_d(7)+TP_d(7)*sigma

            min_8=TP_d(8)-TP_d(8)*sigma
            max_8=TP_d(8)+TP_d(8)*sigma
        endif
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Nweightedefficiencytp(i,1,n) = min_1*(1.0d0-r) + max_1*r
            CALL RANDOM_NUMBER(r)
            rand_Nweightedefficiencytp(i,2,n) = min_2*(1.0d0-r) + max_2*r
            CALL RANDOM_NUMBER(r)
            rand_Nweightedefficiencytp(i,3,n) = min_3*(1.0d0-r) + max_3*r
            CALL RANDOM_NUMBER(r)
            rand_Nweightedefficiencytp(i,4,n) = min_4*(1.0d0-r) + max_4*r
            CALL RANDOM_NUMBER(r)
            rand_Nweightedefficiencytp(i,5,n) = min_5*(1.0d0-r) + max_5*r
            CALL RANDOM_NUMBER(r)
            rand_Nweightedefficiencytp(i,6,n) = min_6*(1.0d0-r) + max_6*r
            CALL RANDOM_NUMBER(r)
            rand_Nweightedefficiencytp(i,7,n) = min_7*(1.0d0-r) + max_7*r
            CALL RANDOM_NUMBER(r)
            rand_Nweightedefficiencytp(i,8,n) = min_8*(1.0d0-r) + max_8*r
        enddo
    enddo
    !do i=1, num_experiments
    !    print*, rand_Nweightedefficiencytp(1,1,i), rand_Nweightedefficiencytp(1,2,i), &
    !            rand_Nweightedefficiencytp(1,3,i), rand_Nweightedefficiencytp(1,4,i), &
    !            rand_Nweightedefficiencytp(1,5,i), rand_Nweightedefficiencytp(1,6,i), &
    !            rand_Nweightedefficiencytp(1,7,i), rand_Nweightedefficiencytp(1,8,i)
    !enddo
    return
end subroutine db_generate_weighted_efficiency_target_proton