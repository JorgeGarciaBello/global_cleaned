subroutine db_read_data()
    use types, only: dp
    use db_data
    implicit none    
    integer :: i,j,reason   
    integer :: u
    print*, 'Reading data . . . '
    open(16,file="daya_for_global_analysis/db_data/DB_weightsPerNearHall.dat", status="old")
    open(17,file="daya_for_global_analysis/db_data/DB_weightsPerHs.dat", status="old")
    open(18,file="daya_for_global_analysis/db_data/DB_weithsPerAd.dat", status="old")    
    open(19,file="daya_for_global_analysis/db_data/DB_blue_spectrum_by_hall.dat", status="old")
    open(20,file="daya_for_global_analysis/db_data/DB_black_spectrum_by_hall.dat", status="old")
    !open(21,file="daya_for_global_analysis/db_data/DB_background_detector.dat", status="old")
    open(21,file="daya_for_global_analysis/db_data/DB_background_detector_1809.dat", status="old")    
    open(22,file="daya_for_global_analysis/db_data/DB_detector_sigma_background.dat", status="old")
    open(23,file="daya_for_global_analysis/db_data/DB_fraction_nuclear_fission.dat", status="old")
    open(24,file="daya_for_global_analysis/db_data/DB_IBD_fractions_dr.dat", status="old")
    open(25,file="daya_for_global_analysis/db_data/DB_live_time_days_per_ad_1809.dat", status="old")
    open(26,file="daya_for_global_analysis/db_data/DB_efficiency_weighted_target_proton.dat", status="old") ! Efficiency-weighted target protons from Supplemental material
    !open(26,file="daya_for_global_analysis/db_data/DB_target_proton_from_arXiv_1603_03549.dat", status="old") ! Target proton, obtenidos de daots porpocionados por DIonisio Tun
    open(27,file="daya_for_global_analysis/db_data/DB_lengths_detector_reactor.dat", status="old")
    open(28,file="daya_for_global_analysis/db_data/DB_thermal_power_by_reactor.dat", status="old")
    open(29,file="daya_for_global_analysis/db_data/DB_bines.dat", status="old")
    open(30,file="daya_for_global_analysis/db_data/DB_v_ij_1.dat", status="old")
    open(31,file='daya_for_global_analysis/db_data/DB_n_nom_array.dat', status='old')
    open(32,file='daya_for_global_analysis/db_data/DB_n_obs.dat', status='old')
    !open(33, file='daya_for_global_analysis/db_data/DB_Md_1607.dat', status='old')
    open(33,file='daya_for_global_analysis/db_data/DB_Md_1809.dat', status='old')
    open(34,file='daya_for_global_analysis/db_data/DB_dayabay_efficiency_weighted_target_protons.dat',status='old')
    open(36,file='daya_for_global_analysis/db_data/DB_geometric_factor.dat',status='old')
    open(37,file='daya_for_global_analysis/db_data/dayabay_1809_far_obs_background_subtracted_spectrum_IBD.dat',status='old')
    open(38,file='daya_for_global_analysis/db_data/dayabay_1809_far_exp_background_subtracted_spectrum_IBD.dat',status='old')
    open(39,file='daya_for_global_analysis/db_data/dayabay_1809_total_period_uncertainty_of_background_H3_hall.dat',status='old')
    open(40,file='daya_for_global_analysis/db_data/dayabay_1809total_far_bkg_in_three_period_of_data_taking.dat',status='old')
    open(newunit=u,file="daya_for_global_analysis/db_data/db_simplex.dat", status="old")
    
        read(16,*,IOSTAT=reason) ((wNH(i,j), j=1,2), i=1,NBIN)
        read(17,*,IOSTAT=reason) ((wH(i,j), j=1,8), i=1,NBIN)
        read(18,*,IOSTAT=reason) ((wD(i,j), j=1,6), i=1,272)
        read(19,*,IOSTAT=reason) ((blueH(i,j),j=1,3),i=1,NBIN)
        read(20,*,IOSTAT=reason) ((blackH(i,j),j=1,3),i=1,NBIN)        
        read(21,*,IOSTAT=reason) Bd
        read(22,*,IOSTAT=reason) Sb
        read(23,*,IOSTAT=reason) FNF
        read(24,*,IOSTAT=reason) ((IBD_fdr(i,j), j=1,RCTS), i=1,ADS)
        read(25,*,IOSTAT=reason) ((LT_d(i,j), j=1,ADS), i=1,3)   ! [days]
        read(26,*,IOSTAT=reason) TP_d
        read(27,*,IOSTAT=reason) ((length_d_r(i,j), j=1,RCTS), i=1,ADS) ! [m]
        read(28,*,IOSTAT=reason) TP_r
        read(29,*,IOSTAT=reason) ((bines(i,j), j=1,2), i=1,NBIN)
        read(30,*,IOSTAT=reason) ((v_ij_1(i,j), j=1,NBIN), i=1,NBIN)
        read(31,*,IOSTAT=reason) N_nom
        read(32,*,IOSTAT=reason) N_obs
        read(33,*,IOSTAT=reason) Md_1607
        read(34,*,IOSTAT=reason) N_e
        read(36,*,IOSTAT=reason) ((gFactor(i,j), j=1,RCTS), i=1,4)
        read(37,*,IOSTAT=reason) farObs
        read(38,*,IOSTAT=reason) farExp
        read(39,*,IOSTAT=reason) sigmaFarBkg
        read(40,*,IOSTAT=reason) farBkg
        read(u,*,IOSTAT=reason) ( (P(i,j), j=1,NDIM), i=1,NDIM+1)
    close(16)
    close(17)
    close(18)
    close(19)
    close(20)
    close(21)
    close(22)
    close(23)
    close(24)
    close(25)
    close(26)
    close(27)
    close(28)
    close(29)
    close(30)
    close(31)
    close(32)
    close(33)
    close(34)
    close(36)
    close(37)
    close(38)
    close(39)
    close(40)
    close(u)

    open(newunit=u,file='daya_for_global_analysis/db_data/db_solutions_to_system_of_pull_equations.dat')
        write(u,*) , ' '
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_FNORM_of_the_solutions_system_of_pull_equations.dat')
            write(u,*) ' '
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_sigma_thermal_power.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_thermal_power
    close(u)

    open(newunit=u, file='daya_for_global_analysis/db_data/db_sigma_spectra_model_near_per_bin.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_spectra_model_near_per_bin
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_sigma_spectra_model_far_per_bin.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_spectra_model_far_per_bin
    close(u)

    open(newunit=u, file='daya_for_global_analysis/db_data/DayaBay_DetectorModel_Etrue_to_Erec.dat', status='old')
        read(u,*,IOSTAT=reason) (( P_Etrue_Erec(i,j), j=1,240), i=1,240)
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/DayaBay_DetectorModel_Edep_to_avgErec.dat', status='old')
        read(u,*,IOSTAT=reason) (( P_Edep_avgErec(i,j), j=1,2), i=1,1099)
    close(u)
    

    open(newunit=u, file='daya_for_global_analysis/db_data/db_bines_variations.dat', status='old')
        read(u,*,IOSTAT=reason) bin_var
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_sigma_energy_per_bin.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_energy_bin
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_sigma_efficiency.dat', status='old')
        read(u,*,IOSTAT=reason) sigma_efficiency
    close(u)


    open(newunit=u, file='daya_for_global_analysis/db_data/db_total_reactor_flux_variations_per_bin.dat', status='old')
        read(u,*,IOSTAT=reason) reactor_flux_bin_var
    close(u)
    
    open(newunit=u, file='daya_for_global_analysis/db_data/db_prompt_energy.dat', status='old')
        read(u,*,IOSTAT=reason) ((p_bines(i,j), j=1,2), i=1,NBIN)
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_energy_released_per_fission.dat',status='old')
        read(u,*,IOSTAT=reason) e_iso
    close(u)



    open(newunit=u, file='daya_for_global_analysis/db_data/db_delta_chi.dat',status='old')
        read(u,*,IOSTAT=reason) ((delta_chi_db(i,j), j=1,3),i=1,10201)
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_statistical_far_error_1809.dat')
        read(u,*,IOSTAT=reason) statFarError
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/dayabay_1809_total_period_background_by_bin.dat',status='old')
        read(u,*,IOSTAT=reason) tBkgBin
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/table_of_pulls.dat')
        write(u,*) ' '
    close(u)    
    open(newunit=u,file='daya_for_global_analysis/db_data/db_N_obs_near_1809.dat')
        read(u,*) N_obs_near
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_N_obs_far_1809.dat')
        read(u,*) N_obs_far
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_N_obs_near1_1809.dat')
        read(u,*) N_obs_near1
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_N_obs_near2_1809.dat')
        read(u,*) N_obs_near2
    close(u)



    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H1_6AD_1809.dat')
        read(u,*) N_obs_H1_6AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H2_6AD_1809.dat')
        read(u,*) N_obs_H2_6AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H3_6AD_1809.dat')
        read(u,*) N_obs_H3_6AD
    close(u)

    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H1_8AD_1809.dat')
        read(u,*) N_obs_H1_8AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H2_8AD_1809.dat')
        read(u,*) N_obs_H2_8AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H3_8AD_1809.dat')
        read(u,*) N_obs_H3_8AD
    close(u)

    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H1_7AD_1809.dat')
        read(u,*) N_obs_H1_7AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H2_7AD_1809.dat')
        read(u,*) N_obs_H2_7AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_H3_7AD_1809.dat')
        read(u,*) N_obs_H3_7AD
    close(u)

    
    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_n.dat')
        read(u,*) N_obs_n
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/N_obs_f.dat')
        read(u,*) N_obs_f
    close(u)


    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H1_6AD_1809.dat')
        read(u,*) Bkg_H1_6AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H2_6AD_1809.dat')
        read(u,*) Bkg_H2_6AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H3_6AD_1809.dat')
        read(u,*) Bkg_H3_6AD
    close(u)


    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H1_8AD_1809.dat')
        read(u,*) Bkg_H1_8AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H2_8AD_1809.dat')
        read(u,*) Bkg_H2_8AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H3_8AD_1809.dat')
        read(u,*) Bkg_H3_8AD
    close(u)


    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H1_7AD_1809.dat')
        read(u,*) Bkg_H1_7AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H2_7AD_1809.dat')
        read(u,*) Bkg_H2_7AD
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/Bkg_H3_7AD_1809.dat')
        read(u,*) Bkg_H3_7AD
    close(u)


    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_6AD_H1.dat')
        read(u,*) ((Bkg_sigma2_6AD_H1(i,j), j=1,5), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_6AD_H2.dat')
        read(u,*) ((Bkg_sigma2_6AD_H2(i,j), j=1,5), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_6AD_H3.dat')
        read(u,*) ((Bkg_sigma2_6AD_H3(i,j), j=1,5), i=1,NBIN)
    close(u)


    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_8AD_H1.dat')
        read(u,*) ((Bkg_sigma2_8AD_H1(i,j), j=1,5), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_8AD_H2.dat')
        read(u,*) ((Bkg_sigma2_8AD_H2(i,j), j=1,5), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_8AD_H3.dat')
        read(u,*) ((Bkg_sigma2_8AD_H3(i,j), j=1,5), i=1,NBIN)
    close(u)


    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_7AD_H1.dat')
        read(u,*) ((Bkg_sigma2_7AD_H1(i,j), j=1,5), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_7AD_H2.dat')
        read(u,*) ((Bkg_sigma2_7AD_H2(i,j), j=1,5), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_Bkg_sigma2_7AD_H3.dat')
        read(u,*) ((Bkg_sigma2_7AD_H3(i,j), j=1,5), i=1,NBIN)
    close(u)

    open(newunit=u, file='daya_for_global_analysis/db_data/db_Bkg_sigma2_N_n.dat')
        read(u,*) ((Bkg_sigma2_N_n(i,j), j=1,5), i=1,NDIM*2*PD)
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_Bkg_sigma2_N_f.dat')
        read(u,*) ((Bkg_sigma2_N_f(i,j), j=1,5), i=1,NDIM*2*PD)
    close(u)

    open(newunit=u, file='daya_for_global_analysis/db_data/db_bkg_all_N_f.dat')
        read(u,*) ((bkg_all_N_f(i,j), j=1,5), i=1,156)
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_bkg_all_N_n.dat')
        read(u,*) ((bkg_all_N_n(i,j), j=1,5), i=1,156)
    close(u)

    open(newunit=u, file='daya_for_global_analysis/db_data/bkg_t_N_n.dat')
        read(u,*) bkg_t_N_n
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/bkg_t_N_f.dat')
        read(u,*) bkg_t_N_f
    close(u)

    
    open(newunit=u, file='daya_for_global_analysis/db_data/db_calibration_period_hall.dat')
        read(u,*) ((calibration_period_hall(i,j), j=1,3), i=1,3)
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_ADS_calibration.dat')
        read(u,*) ADS_calibration
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_first_bin_calibration_3P.dat')
        read(u,*) ((first_bin_calibration(i,j), j=1,3), i=1,3)
    close(u)
    open(newunit=u, file='daya_for_global_analysis/db_data/db_second_bin_calibration_3P.dat')
        read(u,*) ((second_bin_calibration(i,j), j=1,3), i=1,3)
    close(u)


    open(newunit=u,file='daya_for_global_analysis/db_data/db_correction_6AD_per_hall.dat')
        read(u,*) ((correction6ADhalls(i,j), j=1,3), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_correction_8AD_per_hall.dat')
        read(u,*) ((correction8ADhalls(i,j), j=1,3), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_correction_7AD_per_hall.dat')
        read(u,*) ((correction7ADhalls(i,j), j=1,3), i=1,NBIN)
    close(u)


    open(newunit=u,file='daya_for_global_analysis/db_data/db_second_correction_6AD_per_hall.dat')
        read(u,*) ((second_correction6ADhalls(i,j), j=1,3), i=1,NBIN)
    close(u)
    open(newunit=u,file='daya_for_global_analysis/db_data/db_second_correction_8AD_per_hall.dat')
        read(u,*) ((second_correction8ADhalls(i,j), j=1,3), i=1,NBIN)
    close(u)
    !######################################
    !
    !     Pull Approach Calibration
    !
    !######################################    
    !TP_d(8)=TP_d(8)*1.007_dp
    !######################################
    !
    !     Covariance Matrix Calibration
    !
    !######################################
    bin_var=0.97_dp
    TP_d(8)=TP_d(8)*0.991_dp
    !######################################    

    call db_generate_MC_data()   
    print*, 'reading end ...'
    return
end subroutine db_read_data