subroutine db_generate_huber_mueller_model()
    use db_data, only: rand_Nhubermuellermodel, num_experiments, reactor_flux_bin_var
    implicit none
    real(8) :: sigma=(2.7d0)/100.0d0    
    !real(8) :: sigma=(20.0d0)/100.0d0
    real(8) :: min_array(156), max_array(156)
    real(8) :: r
    integer :: i,n

    do i=1,156
        min_array(i)= reactor_flux_bin_var(i)-reactor_flux_bin_var(i)*sigma
        max_array(i)= reactor_flux_bin_var(i)+reactor_flux_bin_var(i)*sigma
    enddo

    do i=1,156
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Nhubermuellermodel(i,n) = min_array(i)*(1.0d0-r) + max_array(i)*r            
        enddo
    enddo
    !print*, '********'
    !do i=1, num_experiments        
    !    print*, rand_Nhubermuellermodel(1,i), rand_Nhubermuellermodel(1,i), &
    !            rand_Nhubermuellermodel(1,i), rand_Nhubermuellermodel(1,i)        
    !enddo
    !print*, '********'
    return
end subroutine db_generate_huber_mueller_model