program main_grid

    implicit none
    integer  i,j,points,k
    parameter (points=6 )
    
    real*8 chi_reno,db_chi_min    
    real*8 Y(13)                                          !Y=( t12 , t13 , t14 , t23 , t24 , t34 , d13 , d24 , d34 , dm21 , dm31 , dm41 )            
    real*8 var_dm23max, var_the13max, var_the23max
    real*8 var_the23min, var_the13min, var_dm23min
    real*8 sumth13, sumth23, sumdm23, delta_th13, delta_th23, delta_dm23
     
    real*8 var_th13(points), var_th23(points),var_dm23(points)
    real*8 chi2_grid(points,points,points)
    integer :: u     
    CHARACTER(30)  names

    names='prueba3D'        
    call db_read_data()      ! Lee datos de Dayabay
    call readRENOData()    ! Lee datos de RENO    
    
 
    !var_the23min=0.5
    !var_the23max=1.0

    var_the23min=0.775
    var_the23max=0.785

    !var_the13min= -0.45
    !var_the13max=  0.45

    !var_dm23max=9.0d-3
    !var_dm23min=0.90d-3


    var_the13min= asin(sqrt(0.067))/(2.0d0)
    !var_the13min= -asin(sqrt(0.0105))/(2.0d0)
    var_the13max= asin(sqrt(0.105))/(2.0d0)

    !print*,'var_the13max',var_the13max
    !stop

    var_dm23max=2.80d-3
    var_dm23min=2.25d-3
       
    delta_th13=abs( var_the13max - var_the13min) /float(points-1)
    delta_th23=abs(var_the23max - var_the23min)/float(points-1)
    delta_dm23=abs( var_dm23max - var_dm23min) /float(points-1)      
       
    sumth13=var_the13min!initial parameters
    sumth23=var_the23min
    sumdm23=var_dm23min
    !print*, 'sumth13,sumdm23',sin(2.0d0*sumth13)**2,sumdm23
    !stop

    do i=1,points
      var_th13(i) = sumth13
      var_th23(i) = sumth23
      var_dm23(i) = sumdm23      
      print*,i,'var_th13,var_th23,var_dm23', var_th13(i),var_th23(i),var_dm23(i)
      print*,i,'var_th13,var_dm23', sin(2.0d0*var_th13(i))**2,var_dm23(i)
      sumth13=sumth13 + delta_th13
      sumth23=sumth23 + delta_th23
      sumdm23=sumdm23 + delta_dm23
    enddo
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
    do i=1,points
      do j=1,points
        do k=1,points
          Y(2)=var_dm23(i)
          Y(5)=var_th13(j)
          Y(6)=var_th23(k)
          call daya_bay_cov(Y,db_chi_min)
          chi2_grid(i,j,k) = db_chi_min
          !     call renoChi2(Y,chi_reno)
          !     chi2_grid(i,j,k) =chi_reno         
          !write(*, '(4F16.8)') Y(2),Y(5),Y(6),chi2_grid(i,j,k) 
        enddo
      enddo
    enddo
    open(newunit=u,file='g.th23th13dm.'//trim(names)//'.dat')
    do k=1,points
      do i=1,points
        do j=1,points
          write(u, '(4F16.8)') var_dm23(i),sin(2.0d0*var_th13(j))**2,var_th23(k),chi2_grid(i,j,k)
          !write(u, '(4F16.8)') sin(2.0d0*var_th13(j))**2,var_dm23(i),chi2_grid(i,j,1)       
        enddo        
        write(u,*)
      enddo
      write(u,*)
      write(u,*)
      write(u,*)
    enddo
    close(u)
end program 
