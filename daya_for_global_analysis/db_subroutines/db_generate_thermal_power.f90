subroutine db_generate_thermal_power()
    use db_data, only: RCTS,TP_r, rand_Nthermalpower, num_experiments, sigma_thermal_power
    implicit none    
    !real(8) :: sigma=(0.5d0)/100.0d0
    real(8) :: sigma(RCTS)
    real(8) :: min_1, max_1, min_2, max_2, min_3, max_3, min_4, max_4, min_5, max_5, min_6, max_6
    real(8) :: r,re
    integer :: i,n

    sigma=(sigma_thermal_power)/100.0d0    

    min_1=TP_r(1)-TP_r(1)*sigma(1)
    max_1=TP_r(1)+TP_r(1)*sigma(1)

    min_2=TP_r(2)-TP_r(2)*sigma(2)
    max_2=TP_r(2)+TP_r(2)*sigma(2)

    min_3=TP_r(3)-TP_r(3)*sigma(3)
    max_3=TP_r(3)+TP_r(3)*sigma(3)

    min_4=TP_r(4)-TP_r(4)*sigma(4)
    max_4=TP_r(4)+TP_r(4)*sigma(4)

    min_5=TP_r(5)-TP_r(5)*sigma(5)
    max_5=TP_r(5)+TP_r(5)*sigma(5)

    min_6=TP_r(6)-TP_r(6)*sigma(6)
    max_6=TP_r(6)+TP_r(6)*sigma(6) 

    do i=1,156
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)            
            rand_Nthermalpower(i,1,n) = min_1*(1.0d0-r) + max_1*r
            CALL RANDOM_NUMBER(r)            
            rand_Nthermalpower(i,2,n) = min_2*(1.0d0-r) + max_2*r
            CALL RANDOM_NUMBER(r)
            rand_Nthermalpower(i,3,n) = min_3*(1.0d0-r) + max_3*r
            CALL RANDOM_NUMBER(r)
            rand_Nthermalpower(i,4,n) = min_4*(1.0d0-r) + max_4*r
            CALL RANDOM_NUMBER(r)
            rand_Nthermalpower(i,5,n) = min_5*(1.0d0-r) + max_5*r
            CALL RANDOM_NUMBER(r)
            rand_Nthermalpower(i,6,n) = min_6*(1.0d0-r) + max_6*r
        enddo
    enddo
    !do i=1, num_experiments
    !    print*, rand_Nthermalpower(1,1,i),rand_Nthermalpower(1,2,i), rand_Nthermalpower(1,3,i), &
    !            rand_Nthermalpower(1,4,i), rand_Nthermalpower(1,5,i), rand_Nthermalpower(1,6,i)
    !enddo
    return
end subroutine db_generate_thermal_power