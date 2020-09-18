!#################################################################
!
!       FUNC: es el nombre la función en la que se define 
!             la estadística CHI^{2} utilizada en RENO (2018)
!             (Tiene 2 parametros que se fijan t13-m_ee y pulls)
!
!##################################################################                 
function reno_FUNC_2(P)
    use  types
    use reno_data, only: NDIM,NBIN,ADS,RCTS,nearObs,farObs,bkg, &
                         sigma_background_d,sigma_reactor_flux,sigma_detection_efficiency,sigma_energy_scale, &
                         data
    implicit none    
    real(dp) :: reno_FUNC_2
    real(dp) :: P(NDIM)                    ! Parámetros de oscilacióna determinar
    
    real(dp) :: b_d(ADS)                   ! b_d are the pulls associated to sigma_background_d respectively    
    real(dp) :: fr(RCTS)                   ! fr are the pulls associated to sigma_background_d respectively    
    real(dp) :: eps                        ! eps are the pulls associated to sigma_detection efficiencys    
    real(dp) :: eta                        ! eps are the pulls associated to sigma energy scale   

    real(dp) :: chi_2
    integer  :: i,j
    real(dp) :: O_i,T_i,U2_i
    real(dp) :: nearExpC,farExpC
    integer  :: d,r
    real(dp) :: N_near
    real(dp) :: N_far
       
    reno_FUNC_2=0.0d0    
    
    b_d=(/P(1),P(2)/)
    fr=(/P(3),P(4),P(5),P(6),P(7),P(8)/)
    eps=P(9)
    eta=P(10)
    !#############################################################
    !
    !   Ji-cuadrada tomada el paper referenciado en el más reciente
    !
    !#############################################################
    chi_2=0.0_dp
    do i=1,NBIN
      N_near=0.0d0;
      N_far=0.0d0;
      do r=1,RCTS                
        N_near=N_near+(1.0d0 + fr(r))*data(i,1,r)
        N_far =N_far +(1.0d0 + fr(r))*data(i,2,r)                  
      enddo
      nearExpC = (1.0d0+eps+eta)*N_near+ bkg(i,1)*(b_d(1))
      farExpC  = (1.0d0+eps+eta)*N_far + bkg(i,2)*(b_d(2))
      O_i = (farObs(i))/(nearObs(i))
      T_i = farExpC/nearExpC
        
      U2_i=(O_i**2)*(  ( sqrt( farObs(i) ) / ( farObs(i)  ) )**2 + ( sqrt( nearObs(i)) / ( nearObs(i) ) )**2)              
      chi_2=chi_2 + (O_i - T_i)**2/U2_i
    enddo
    do r=1,RCTS
      chi_2=chi_2 + (fr(r)/(sigma_reactor_flux(r)/100.0d0))**2
    enddo    
    do d=1,ADS
      chi_2=chi_2 + (b_d(d)/(sigma_background_d(d)/100.0d0))**2
    enddo    
    chi_2=chi_2 + (eps/(sigma_detection_efficiency/100.0d0))**2 + (eta/(sigma_energy_scale/100.0d0))**2
    
    reno_FUNC_2=chi_2    
    return
end function reno_FUNC_2