program main_grid

    implicit none
    integer  i,j,points,k
    parameter (points=6)
    
    real*8 chi_reno,db_chi_min    
    real*8 Y(13)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )            
    real*8 var_dm23max, var_the13max, var_the23max
    real*8 var_the23min, var_the13min, var_dm23min
    real*8 sumth13, sumth23, sumdm23, delta_th13, delta_th23, delta_dm23
     
    real*8 var_th13(points), var_th23(points),var_dm23(points)
    real*8 chi2_grid(points,points,points)
    real*8 grid(44800,3)
    integer :: u     
    CHARACTER(30)  names

    names='prueba3D.continuacion'        
    call db_read_data()      ! Lee datos de Dayabay
    call readRENOData()    ! Lee datos de RENO    


    open(newunit=u, file='data/sk-nh.dat')
      do i=1,44800
        read(u,*) grid(i,:)
      enddo
    close(u)

    !grid =>  Delta m^2_{32}    sin^2 theta_{13}  sin^2 theta_{23}

    
    Y(1)=7.650d-5 ! dm2_12   
    !Y(2)=2.5d-3 !dm2_23
    Y(3)=0.0d0 !dm2_34
    Y(4)=0.584d0 !theta_12
    !Y(5)=0.1  !theta_13
    !Y(6)=0.78d0  !theta_23
    Y(7)=0.0d0 !theta_14
    Y(8)=0.0d0 !theta_24
    Y(9)=0.0d0 !theta_34
    Y(10)=0.0
    Y(11)=0.0       
    Y(12)=0.0       
    Y(13)=0.0

    open(newunit=u,file='db.dm32.s2t13.s2t23.'//trim(names)//'.dat')
      do i=1,15761!44800
        Y(2) = grid(i,1)             !dm32
        Y(5) = asin(sqrt(grid(i,2))) !t13
        Y(6) = asin(sqrt(grid(i,3))) !t23
        call daya_bay_cov(Y,db_chi_min)
        write(u,*) grid(i,1), grid(i,2), grid(i,3), db_chi_min
        print*, newuniti
      enddo
    close(u)
end program 
