program confidence_regions_from_octave
    implicit none
    integer :: m
    m=100
    
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_efficiency_test_percentage_1_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_efficiency_test_percentage_1_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_efficiency_test_percentage_2_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_efficiency_test_percentage_2_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_efficiency_test_percentage_3_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_efficiency_test_percentage_3_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_efficiency_test_percentage_4_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_efficiency_test_percentage_4_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_efficiency_test_percentage_5_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_efficiency_test_percentage_5_all_bin.dat')
    stop

    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_1_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_1_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_2_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_2_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_3_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_3_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_4_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_4_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_5_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_5_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_6_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_6_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_7_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_7_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_8_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_8_all_bin.dat')
    stop
    !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_1_all_bin.dat')
    !call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_1_all_bin.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_2_all_bin.dat')
    !call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_2_all_bin.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_3_all_bin.dat')
    !call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_3_all_bin.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_4_all_bin.dat')
    !call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_4_all_bin.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_5_all_bin.dat')
    !call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_5_all_bin.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_6_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_6_all_bin.dat')
   ! call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_7_all_bin.dat')
  !  call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_7_all_bin.dat')
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_8_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_8_all_bin.dat')
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_9_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_9_all_bin.dat')
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_10_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_10_all_bin.dat')    
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_11_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_11_all_bin.dat')    
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_12_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_12_all_bin.dat')    
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_13_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_13_all_bin.dat')    
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_14_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_14_all_bin.dat')    
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_15_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_15_all_bin.dat')    
   !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_percentage_16_all_bin.dat')
   ! call confidenceRegions(m,'xmgrace_sigma_energy_test_percentage_16_all_bin.dat')       
   !   stop

    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_1.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_1.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_2.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_2.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_3.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_3.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_4.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_4.dat')
    !stop

    !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_mod_percentage_5_all_bin.dat')
    !call confidenceRegions(m,'xmgrace_sigma_energy_test_mod_percentage_5_all_bin.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_sigma_energy_test_mod_percentage_6_all_bin.dat')
    !call confidenceRegions(m,'xmgrace_sigma_energy_test_mod_percentage_6_all_bin.dat')
    !stop

    call get_chi_min_from_data_grid(m,'xmgrace_data_origin.dat')
    call confidenceRegions(m,'xmgrace_data_origin.dat')
    stop 
    
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_1_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_1_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_2_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_2_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_3_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_3_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_4_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_4_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_5_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_5_all_bin.dat')
    call get_chi_min_from_data_grid(m,'xmgrace_sigma_Tpower_test_mod_percentage_6_all_bin.dat')
    call confidenceRegions(m,'xmgrace_sigma_Tpower_test_mod_percentage_6_all_bin.dat')
    stop

    

    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_1.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_1.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_2.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_2.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_3.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_3.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_4.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_4.dat')

    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_5.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_5.dat')
    !call get_chi_min_from_data_grid(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_6.dat')
    !call confidenceRegions(m,'xmgrace_data_sigma_energy_test_mod_bin_15_percentage_6.dat')    
    return
end program confidence_regions_from_octave

subroutine confidenceRegions(n,filename)
    implicit none
    integer :: n
    Character(len=*) :: filename
    Character(len=90) :: filenameA,filenameB,filenameC

    real(8) :: min_values(3)
    real(8) :: min_val    
    real(8) :: data(n**2,3)
    integer :: i,j,u
    real(8) :: s13,m_ee,chi_2
    
    print*, 'Making confidence regions . . . '
    ! Leyendo los valores minimios  ( chi_min, sen11t_!2_min, Dm2_ee_min )
    open(newunit=u, file='db_min_param_'//filename, status='old')
    !open(newunit=u, file='db_data_min_parameters.dat', status='old')    
        read(u,*) min_values
    close(u)    

    min_val=min_values(1)
    open(newunit=u,file=filename, status='old')
        read(u,*) ( (data(i,j), j=1,3), i=1,n**2 )
    close(u)    

    filenameA='db_cr_'//trim(filename)//'_99_73_2018.dat'
    filenameB='db_cr_'//trim(filename)//'_95_45_2018.dat'
    filenameC='db_cr_'//trim(filename)//'_68_27_2018.dat'    

    !Confidence region 1 - 68.27% - 2.30 - (1-sigma)
    open(41,file=trim(filenameA))
    do i=1,n**2
        s13=data(i,1); m_ee=data(i,2); chi_2=data(i,3)-min_val        
        !if((2.45d0.GE.chi_2).AND.(chi_2.GE.2.15d0)) then
        if(chi_2.LE.2.30d0) then
            write(41,*) s13, m_ee
        endif
    enddo
    close(41)

    !Confidence region 2 - 95.45% - 6.18 - (2-sigma)
    open(42,file=trim(filenameB))
    do i=1,n**2
        s13=data(i,1); m_ee=data(i,2); chi_2=data(i,3)-min_val
        !if((6.33d0.GE.chi_2).AND.(chi_2.GE.6.03d0)) then
            if(chi_2.LE.6.18d0) then
            write(42,*) s13, m_ee
        endif
    enddo
    close(42)

    !Confidence region 3 - 99.73% - 11.83 (3-sigma)
    open(43,file=trim(filenameC))
    do i=1,n**2
        s13=data(i,1); m_ee=data(i,2); chi_2=data(i,3)-min_val
        !if((11.98d0.GE.chi_2).AND.(chi_2.GE.11.68d0)) then
            if(chi_2.LE.11.83d0) then
            write(43,*) s13, m_ee
        endif
    enddo
    close(43)    
    return
end subroutine confidenceRegions

SUBROUTINE get_chi_min_from_data_grid(m,filename)
    implicit none
    integer :: m
    Character(len=*) :: filename
    integer :: n
    real(8) :: data(m**2,3)

    real(8) :: ARRAY(m**2),RESULT(3)
    integer :: i,j

    n=m**2
    !open(50,file='db_data.dat',status='old')

    open(50,file=filename,status='old')
        read(50,*) ((data(i,j),j=1,3),i=1,n)
    close(50)

    ARRAY=data(:,3)
    RESULT(1) = MINVAL(ARRAY)

    do i=1,n
        if (data(i,3).eq.RESULT(1)) then
            RESULT(2)=data(i,1)
            RESULT(3)=data(i,2)
        end if
    enddo
    open(51,file='db_min_param_'//filename)
        write(51,*) RESULT
    close(51)

    return
end SUBROUTINE get_chi_min_from_data_grid