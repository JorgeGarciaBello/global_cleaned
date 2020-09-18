function reno_partial_derivative_reactor_flux(idx,b_d,fr,eps,eta)
    use  types
    use reno_data, only: NBIN,ADS,RCTS,nearObs,farObs,bkg,sigma_reactor_flux,data
    implicit none
    real(dp) :: reno_partial_derivative_reactor_flux
    real(dp) :: b_d(ADS)                   ! b_d are the pulls associated to sigma_background_d respectively    
    real(dp) :: fr(RCTS)                   ! fr are the pulls associated to sigma_background_d respectively    
    real(dp) :: eps                        ! eps are the pulls associated to sigma_detection efficiencys    
    real(dp) :: eta                        ! eps are the pulls associated to sigma energy scale    
    real(dp) :: result
    integer  :: i,r,idx
    real(dp) :: O_i,T_i,U2_i
    real(dp) :: nearExpC,farExpC 
    real(dp) :: N_near
    real(dp) :: N_far


    reno_partial_derivative_reactor_flux= fr(idx)/(sigma_reactor_flux(idx)/100.0d0)**2
    result=0.0_dp
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
      result=result + ((T_i - O_i)/U2_i)*(1.0d0+eps+eta)*( data(i,2,idx)*nearExpC - farExpC*data(i,1,idx) )/(nearExpC)**2
    enddo
    reno_partial_derivative_reactor_flux=2.0_dp*(reno_partial_derivative_reactor_flux + result)
end function reno_partial_derivative_reactor_flux