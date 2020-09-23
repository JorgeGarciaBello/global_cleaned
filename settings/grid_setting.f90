subroutine grid_setting()
    implicit none
    real(8) :: dm_min,dm_max
    real(8) :: t13_min,t13_max
    print*, 'Making data-grid  . . .'
    !##############################################
    !
    !   Inicialización de los limites del grid 
    !
    !##############################################

    !##############################################
    !
    !       Setting for Daya Bay Cov only
    !
    !#############################################
    dm_min=2.20d-3
    dm_max=2.80d-3
    t13_min=asin(sqrt(0.072d0))/2.0d0
    t13_max=asin(sqrt(0.098d0))/2.0d0
    !##############################################
    !
    !       Setting for Daya Bay RATE Only
    !
    !#############################################
    !dm_min=2.00d-3
    !dm_max=2.90d-3
    !t13_min=asin(sqrt(0.07d0))/2.0d0
    !t13_max=asin(sqrt(0.10d0))/2.0d0


    

    !##############################################
    !
    !       Setting for RENO rate pull
    !
    !#############################################
    !dm_min=2.00d-3
    !dm_max=3.25d-3
    !t13_min=asin(sqrt(0.058d0))/2.0d0
    !t13_max=asin(sqrt(0.12d0))/2.0d0    

    !##############################################
    !
    !       Setting for RENO covariace Matrix
    !
    !#############################################
    !dm_min=2.0d-3
    !dm_max=3.4d-3
    !t13_min=asin(sqrt(0.058d0))/2.0d0
    !t13_max=asin(sqrt(0.12d0))/2.0d0

    !##############################################
    !
    !       Setting for RENO Far Data Only
    !
    !#############################################
    !dm_min=1.0d-3
    !dm_max=4.5d-3
    !t13_min=asin(sqrt(0.04d0))/2.0d0
    !t13_max=asin(sqrt(0.15d0))/2.0d0





    !##############################################
    !
    !       Setting for DOUBLE CHOOZ only
    !
    !#############################################
    
    !dm_min=0.0017d0
    !dm_max=0.0031d0
    !t13_min=asin(sqrt(0.07d0))/2.0d0
    !t13_max=asin(sqrt(0.12d0))/2.0d0

    call create_grid(t13_min,t13_max,dm_min,dm_max)
    call read_grid()    
    return
end subroutine grid_setting