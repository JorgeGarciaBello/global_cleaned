subroutine db_generate_energy_released_per_fission()
    use db_data, only: e_iso, rand_Nenergyperfission, num_experiments
    implicit none
    real(8) :: sigmaU235=0.26d0
    real(8) :: sigmaU238=0.52d0
    real(8) :: sigmaPu239=0.34d0
    real(8) :: sigmaPu241=0.33d0
    real(8) :: min_1, max_1, min_2, max_2, min_3, max_3, min_4, max_4
    real(8) :: r
    integer :: i,n

    min_1=e_iso(1)-sigmaU235
    max_1=e_iso(1)+sigmaU235

    min_2=e_iso(2)-sigmaU238
    max_2=e_iso(2)+sigmaU238

    min_3=e_iso(3)-sigmaPu239
    max_3=e_iso(3)+sigmaPu239

    min_4=e_iso(4)-sigmaPu241
    max_4=e_iso(4)+sigmaPu241

    do i=1,156
        do n=1,num_experiments
            CALL RANDOM_NUMBER(r)
            rand_Nenergyperfission(i,1,n) = min_1*(1.0d0-r) + max_1*r
            CALL RANDOM_NUMBER(r)
            rand_Nenergyperfission(i,2,n) = min_2*(1.0d0-r) + max_2*r
            CALL RANDOM_NUMBER(r)
            rand_Nenergyperfission(i,3,n) = min_3*(1.0d0-r) + max_3*r
            CALL RANDOM_NUMBER(r)
            rand_Nenergyperfission(i,4,n) = min_4*(1.0d0-r) + max_4*r
        enddo
    enddo
    !do i=1, num_experiments
    !    print*, rand_Nenergyperfission(1,1,i), rand_Nenergyperfission(1,2,i), &
    !            rand_Nenergyperfission(1,3,i), rand_Nenergyperfission(1,4,i)
    !enddo
    return
end subroutine db_generate_energy_released_per_fission