subroutine db_generate_spectra_model()
    use db_data, only: sigma_spectra_model_far_per_bin,sigma_spectra_model_near_per_bin, &
                       rand_Nspectramodel_n, rand_Nspectramodel_f,num_experiments    
    implicit none    
    real(8) :: min_1_n(156), max_1_n(156)
    real(8) :: min_1_f(156), max_1_f(156)
    real(8) :: r
    integer :: i,j,n
    
    do i=1,156
        min_1_n(i)=1.0d0-sigma_spectra_model_near_per_bin(i)
        max_1_n(i)=1.0d0+sigma_spectra_model_near_per_bin(i)

        min_1_f(i)=1.0d0-sigma_spectra_model_far_per_bin(i)
        max_1_f(i)=1.0d0+sigma_spectra_model_far_per_bin(i)
    enddo
    do i=1,156
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Nspectramodel_n(i,n) = min_1_n(i)*(1.0d0-r) + max_1_n(i)*r
            rand_Nspectramodel_f(i,n) = min_1_f(i)*(1.0d0-r) + max_1_f(i)*r
        enddo
    enddo
    !do i=1, num_experiments
        !print*, rand_Nspectramodel_n(4,1:5)
        !print*, rand_Nspectramodel_n(156,1:5)
        !print*, rand_Nspectramodel_f(4,1:5)
        !print*, rand_Nspectramodel_f(156,1:5)
    !enddo
    return
end subroutine db_generate_spectra_model