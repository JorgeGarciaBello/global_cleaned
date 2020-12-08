subroutine readRENOData()
    use reno_data
    implicit none    
    integer :: i,j,u,reason
    
    open(newunit=u,file="reno_for_global_analysis/reno_data/reno_constant_reactor_flux_per_bin.dat", status="old")
        read(u,*,IOSTAT=reason) constant_flux_per_bin
    close(u)

    open(newunit=u,file="reno_for_global_analysis/reno_data/reno_near_obs.dat", status="old")
            read(u,*,IOSTAT=reason) nearObs
    close(u)
    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_far_obs.dat',status='old')
        read(u,*,IOSTAT=reason) farObs
    close(u)
    


    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_background_bin_near_far.dat', status='old')
        read(u,*,IOSTAT=reason) ((bkg(i,j),j=1,2), i=1,NBIN)
    close(u)
    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_detector_efficiency.dat', status='old')
        read(u,*,IOSTAT=reason) detector_efficiency
    close(u)
    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_neutrino_energy.dat', status='old')
        read(u,*,IOSTAT=reason) neutrino_energy
    close(u)    
    

    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_sigma_background_near_far.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_background_d
    close(u)
    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_sigma_reactor_flux.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_reactor_flux
    close(u)
    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_sigma_detection_efficiency.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_detection_efficiency
    close(u)
    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_sigma_efficiency_corr.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_efficiency_corr
    close(u)
    open(newunit=u,file='reno_for_global_analysis/reno_data/reno_sigma_energy_scale.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_energy_scale
    close(u)    


    open(12,file="reno_for_global_analysis/reno_data/reno_contribution_reactor_flux.dat", status="old")    
    
    open(14,file="reno_for_global_analysis/reno_data/reno_near_exp.dat", status="old")
    open(15,file="reno_for_global_analysis/reno_data/reno_total_backgroud_rate_n_f.dat", status="old")
    open(16,file="reno_for_global_analysis/reno_data/reno_background_systematic_uncertainties_n_f_percentage_total.dat", &
                  status="old")
    open(17,file="reno_for_global_analysis/reno_data/reno_error_sigmas.dat", status="old")
    !open(18,file="reno_for_global_analysis/reno_data/reno_detector_fraction_IBD_per_ads.dat", status="old")
    open(19,file="reno_for_global_analysis/reno_data/reno_live_time_days_n_f.dat", status="old")
    open(20,file="reno_for_global_analysis/reno_data/reno_target_proton.dat", status="old")
    open(21,file="reno_for_global_analysis/reno_data/reno_lengths.dat", status="old")
    open(22,file="reno_for_global_analysis/reno_data/reno_thermal_power_by_reactor.dat", status="old")
    open(23,file="reno_for_global_analysis/reno_data/reno_bines.dat", status="old")
    !open(24,file="reno_for_global_analysis/reno_data/reno_v_ij_1.dat", status="old")
    !open(25, file='reno_for_global_analysis/reno_data/reno_n_nom_array.dat', status='old')
    
    open(27,file='reno_for_global_analysis/reno_data/reno_fraction_nuclear_fission.dat',status='old')
    !open(28,file='reno_for_global_analysis/reno_data/reno_far_obs.dat',status='old')
    open(29,file='reno_for_global_analysis/reno_data/reno_far_exp.dat',status='old')
    open(30,file='reno_for_global_analysis/reno_data/reno_uncertainty_per_bin_of_near_data.dat',status='old')
    open(31,file='reno_for_global_analysis/reno_data/reno_uncertainty_per_bin_of_far_data.dat',status='old')
    open(32,file='reno_for_global_analysis/reno_data/reno_far_background_accidental.dat',status='old')
    open(33,file='reno_for_global_analysis/reno_data/reno_far_background_Cf.dat',status='old')
    open(34,file='reno_for_global_analysis/reno_data/reno_far_background_fast_neutron.dat',status='old')
    open(35,file='reno_for_global_analysis/reno_data/reno_far_background_Li_He.dat',status='old')    
    
    
    open(37,file='reno_for_global_analysis/reno_data/RENO_reactor_flux_corr.dat',status='old')
    open(38,file='reno_for_global_analysis/reno_data/RENO_bg_total.dat',status='old')
    open(39,file='reno_for_global_analysis/reno_data/RENO_energy_scale.dat',status='old')
    open(40,file='reno_for_global_analysis/reno_data/RENO_Deff_uncorr.dat',status='old')
    open(41,file='reno_for_global_analysis/reno_data/RENO_syst_uncor.dat',status='old')
    open(42,file='reno_for_global_analysis/reno_data/RENO_Deff_corr_stat.dat',status='old')
    open(43,file='reno_for_global_analysis/reno_data/RENO_reactor_flux_uncorr.dat',status='old')
    
        !read(10,*,IOSTAT=reason) ((wNH(i,j), j=1,2), i=1,34)
        !read(11,*,IOSTAT=reason) ((wH(i,j), j=1,8), i=1,34)
        read(12,*,IOSTAT=reason) ((wDR(i,j), j=1,6), i=1,2)
    
        read(14,*,IOSTAT=reason) nearExp
        read(15,*,IOSTAT=reason) TBR_n_f
        read(16,*,IOSTAT=reason) ((BSU_n_f_P_T(i,j), j=1,2), i=1,2)
        read(17,*,IOSTAT=reason) uS
        !read(18,*,IOSTAT=reason) ((IBD_d_r(i,j), j=1,RCTS), i=1,ADS)
        read(19,*,IOSTAT=reason) LT_d   ! Life time of the detectors [days]
        read(20,*,IOSTAT=reason) TP_d   ! TP_d is the target proton by detector
        read(21,*,IOSTAT=reason) ((length_d_r(i,j), j=1,RCTS), i=1,ADS) ! [m]
        read(22,*,IOSTAT=reason) TP_r
        read(23,*,IOSTAT=reason) ((bines(i,j), j=1,2), i=1,NBIN)
        !read(24,*,IOSTAT=reason) ((v_ij_1(i,j), j=1,34), i=1,34)
        !read(25,*,IOSTAT=reason) N_nom
        
        read(27,*,IOSTAT=reason) FNF
        !read(28,*,IOSTAT=reason) farObs
        read(29,*,IOSTAT=reason) farExp
        read(30,*,IOSTAT=reason) sigmaNear
        read(31,*,IOSTAT=reason) sigmaFar
        read(32,*,IOSTAT=reason) bkgFarAcc
        read(33,*,IOSTAT=reason) bkgFarCf
        read(34,*,IOSTAT=reason) bkgFarFN
        read(35,*,IOSTAT=reason) bkgFarLH
        
        
        read(37,*,IOSTAT=reason) rFluxC
        read(38,*,IOSTAT=reason) bkgTotal
        read(39,*,IOSTAT=reason) engyScale
        read(40,*,IOSTAT=reason) DeffU
        read(41,*,IOSTAT=reason) systUncor
        read(42,*,IOSTAT=reason) DeffCS
        read(43,*,IOSTAT=reason) rFluxU
    !close(10)
    !close(11)
    close(12)
    
    close(14)
    close(15)
    close(16)
    close(17)
    !close(18)
    close(19)
    close(20)
    close(21)
    close(22)
    close(23)
    !close(24)
    !close(25)    
    close(27)
    !close(28)
    close(29)
    close(30)
    close(31)
    close(32)
    close(33)
    close(34)
    close(35)
    
    
    close(37)    
    close(38)
    close(39)
    close(40)
    close(41)
    close(42)
    close(43)

    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_detector_calibration.dat',status='old')
        read(u,*,IOSTAT=reason) detector_calibration
    close(u)

    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_average_energy_released_per_fission.dat')
        read(u,*) average_energy_released_per_fission
    close(u)
    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_reactor_flux_model.dat',status='old')
        read(u,*,IOSTAT=reason) reactor_flux_model
    close(u)
    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_cross_section_v.dat',status='old')
        read(u,*,IOSTAT=reason) cross_section_v
    close(u)

        

    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_sigma_thermal_power.dat',status='old')
        read(u,*) sigma_thermal_power
    close(u)
    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_sigma_fission_fraction.dat',status='old')
        read(u,*) sigma_fission_fraction
    close(u)    
    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_sigma_average_energy_released_per_fission.dat')
        read(u,*) sigma_average_energy_released_per_fission
    close(u)
    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_sigma_reactor_flux_model.dat',status='old')
        read(u,*,IOSTAT=reason) sigma_reactor_flux_model
    close(u)
    open(newunit=u, file='reno_for_global_analysis/reno_data/reno_sigma_cross_section.dat',status='old')
        read(u,*,IOSTAT=reason) sigma_cross_section
    close(u)

    !#####################################################
    !
    !       RENO pull => U_i = Ui + bkg
    !
    !#####################################################    
    !neutrino_energy=neutrino_energy*1.0046
    !detector_efficiency(2)=1.00613*detector_efficiency(2)    
    !sigma_background_d         = sigma_background_d*0.9d0
    !sigma_reactor_flux         = sigma_reactor_flux*2.5d0

    !#####################################################
    !
    !       RENO pull => U_i only
    !
    !#####################################################    
    neutrino_energy=neutrino_energy*0.965
    detector_efficiency(2)=1.0078*detector_efficiency(2)
    sigma_background_d         = sigma_background_d*3.5d0
    sigma_reactor_flux         = sigma_reactor_flux*2.3d0




    !#####################################################
    !
    !       Valores para el análisis de covarianza
    !
    !#####################################################    
    !                neutrino_energy=neutrino_energy*0.989
    !                detector_efficiency(2)=1.00233*detector_efficiency(2)
                        
    !                 sigma_background_d         = sigma_background_d*1.2_dp
    !                 sigma_detection_efficiency=1.8_dp
    !#####################################################
    
    !#####################################################
    !
    !       Valores para el análisis de Far Data Only
    !
    !#####################################################    
    !neutrino_energy=neutrino_energy*1.0115d0 
    !detector_efficiency(2)=1.0245*detector_efficiency(2)
    
    !sigma_background_d         = sigma_background_d*1.0d0
    !sigma_reactor_flux         = sigma_reactor_flux*1.0d0
    
    return
end subroutine readRENOData