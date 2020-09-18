module db_data
    use types
    implicit none
    integer,parameter :: PD=3            ! PD is the number of period of data taking
    integer,parameter :: NDIM=23         ! NDIM is the number of pull parameters
    integer,parameter :: ADS=8           ! ADS is the number of detectors
    integer,parameter :: RCTS=6          ! RCTS is the number of reactors
    integer,parameter :: RIR=4           ! RIR is the number of radioactive isotopes in the reactors     
    integer,parameter :: NBIN=26         ! NBIN is the number of energy's bin    
    integer,parameter :: osc=1           ! osc = 1 para oscilaciones,  2 para no oscilaciones 
    integer,parameter :: n=20             ! size of the grid
    integer,parameter :: num_experiments=1000

    real(dp) :: neuN(ADS)    
    real(dp)  :: t13_M_data(n,n)
    real(dp)  :: dm_M_data(n,n)
    character(len=150) :: name_test

    real(dp) :: TP_SIGMA    

    integer :: i_bin,k_rand, i_name, j_name, bin_name
    real(dp) :: V(NBIN*PD*2,NBIN*PD*2)=0.0d0
    real(dp) :: V_my(NBIN*PD*2,NBIN*PD*2)=0.0d0
    real(dp) :: Vstat(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: VNacc(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: VNalpha(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: VNamc(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: VNLiHe(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: VNfastn(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: Veff(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: Veffu(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: Vrctr(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: Vrctru(NBIN*2*PD,NBIN*2*PD)=0.0d0
    real(dp) :: Vsignal(NBIN*2*PD,NBIN*2*PD)=0.0d0
    
    real(dp) :: rand_Nacc_n(156,num_experiments)
    real(dp) :: rand_Nacc_f(156,num_experiments)
    real(dp) :: rand_Nalpha_n(156,num_experiments)
    real(dp) :: rand_Nalpha_f(156,num_experiments)
    real(dp) :: rand_Namc_n(156,num_experiments)
    real(dp) :: rand_Namc_f(156,num_experiments)
    real(dp) :: rand_NLiHe_n(156,num_experiments)
    real(dp) :: rand_NLiHe_f(156,num_experiments)
    real(dp) :: rand_Nfastn_n(156,num_experiments)
    real(dp) :: rand_Nfastn_f(156,num_experiments)

    real(dp) :: rand_Nthermalpower(156,6,num_experiments)
    real(dp) :: rand_Nfissionfraction(156,4,num_experiments)
    real(dp) :: rand_Navrgenergyperfission(156,1,num_experiments)
    real(dp) :: rand_Nenergyperfission(156,4,num_experiments)
    real(dp) :: rand_Nhubermuellermodel(156,num_experiments)
    real(dp) :: rand_Nweightedefficiencytp(156,8,num_experiments)
    real(dp) :: rand_Ncrosssection(156,1,num_experiments)
    real(dp) :: rand_Nenergy(26,num_experiments)
    real(dp) :: rand_Nspectramodel_n(156,num_experiments)
    real(dp) :: rand_Nspectramodel_f(156,num_experiments)

    real(dp) :: rand_w_i(156,num_experiments)
    real(dp) :: rand_W_k(156)
           
    real(dp) :: P_Etrue_Erec(240,240)
    real(dp) :: P_Edep_avgErec(1099,2)
    real(dp) :: data_near(NBIN,num_experiments), data_far(NBIN,num_experiments)
    real(dp) :: results_w(n**2,NBIN)
    real(dp) :: far_bin_events(n*n,28)
    real(dp) :: delta_chi_db(10201,3)
    real(dp) :: grid_data_points(n*n,2)
    real(dp) :: grid_events_data_points(n*n,10)
    real(dp),dimension(NDIM+1,NDIM) :: P  ! P is the set of MP points with NP coordenates that generate the polygon of AMOEBA
    real(dp) :: pull_min(NDIM)
    real(dp) :: Bd(ADS)
    real(dp) :: Sb(ADS)
    real(dp) :: FNF(RIR)
    real(dp) :: e_iso(RIR)              ! Energy released per fission
    real(dp) :: IBD_fdr(ADS,RCTS)       ! Set of data of the Daya Bay experimento
    real(dp) :: LT_d(3,ADS)                ! Is the life time in day by detector
    real(dp) :: TP_d(ADS)               ! Efficiency-weighted target proton
    real(dp) :: length_d_r(ADS,RCTS)
    real(dp) :: TP_r(RCTS)              ! Set of data of the Daya Bay experimento    
    real(dp) :: bines(NBIN,2)             ! bines es una matriz con los valores que determinan los bines de energía usados    
    real(dp) :: p_bines(NBIN,2)             ! bines es una matriz con los valores que determinan los bines de energía usados
    real(dp) :: v_ij_1(NBIN,NBIN)           ! Matriz de covarianza invertida
    real(dp) :: N_obs(ADS)              ! Is the number of neutrino events per detector
    real(dp) :: N_nom(NBIN)               ! N_nom es la densidad de neutirnos en el i-ésimo bin promedio
    real(dp) :: blueH(NBIN,3)             ! blueH is the blue spectrum without oscillations per Hall (i,j); i bin, j= hall
    real(dp) :: blackH(NBIN,3)            ! blackH is the observed black-ṕoint spectrum per Hall (i,j); i bin, j= hall
    real(dp) :: wH(NBIN,8)
    real(dp) :: wD(272,6)               ! wH, wD  ate the contribution ratios per detector to a Hall and per reacto to detectors    
    real(dp) :: wNH(NBIN,2)               ! wNH is the contribution ratios per near hall to the total per bin    
    real(dp) :: Md_1607(ADS)            ! Is the number of neutrino events per detector taken from  1607_05378 paper
    real(dp) :: N_e(ADS)
    real(dp) :: gFactor(4,RCTS)         ! Are the geometric factor that gives the cnotribution of neutrino events per reactor to far-detectors by bin 
    real(dp) :: farObs(NBIN)            ! far observed background subtracted spectrum 
    real(dp) :: farExp(NBIN)            ! far expected background subtracted spectrum
    real(dp) :: sigmaFarBkg(NBIN)       ! sigmaFarBkg is the total uncertainty for the far spectrum by bin 
    real(dp) :: farBkg(NBIN)            ! farBkg is the total background in the far detector for the three period of data taking
    real(dp) :: tBkgBin(NBIN)           ! background total per energy bin
    real(dp) :: statFarError(NBIN)
    real(dp) :: N_obs_near(NBIN)
    real(dp) :: N_obs_far(NBIN)
    real(dp) :: N_obs_near1(NBIN)
    real(dp) :: N_obs_near2(NBIN)

    real(dp) :: sigma_thermal_power(RCTS)
    real(dp) :: sigma_energy_bin(NBIN)
    real(dp) :: sigma_efficiency
    real(dp) :: sigma_spectra_model_near_per_bin(156)
    real(dp) :: sigma_spectra_model_far_per_bin(156)

    real(dp) :: bin_var(NBIN)
    real(dp) :: reactor_flux_bin_var(156)

    
    real(dp) :: N_obs_H1_6AD(NBIN)      ! neutinro events in the experimental hall H1 in the period of six detectors (6AD)
    real(dp) :: N_obs_H1_8AD(NBIN)      ! neutinro events in the experimental hall H1 in the period of eigth detectors (8AD)
    real(dp) :: N_obs_H1_7AD(NBIN)      ! neutinro events in the experimental hall H1 in the period of seven detectors (7AD)

    real(dp) :: N_obs_H2_6AD(NBIN)      ! neutinro events in the experimental hall H2 in the period of six detectors (6AD)
    real(dp) :: N_obs_H2_8AD(NBIN)      ! neutinro events in the experimental hall H2 in the period of eigth detectors (8AD)
    real(dp) :: N_obs_H2_7AD(NBIN)      ! neutinro events in the experimental hall H2 in the period of seven detectors (7AD)

    real(dp) :: N_obs_H3_6AD(NBIN)      ! neutinro events in the experimental hall H3 in the period of six detectors (6AD)
    real(dp) :: N_obs_H3_8AD(NBIN)      ! neutinro events in the experimental hall H3 in the period of eigth detectors (8AD)
    real(dp) :: N_obs_H3_7AD(NBIN)      ! neutinro events in the experimental hall H3 in the period of seven detectors (7AD)

    real(dp) :: N_obs_n(156)      ! N_obs_n is the vector of the observed near neutrino events in the near halls
    real(dp) :: N_obs_f(156)      ! N_obs_f is the vector of the observed far neutrino events in the far halls
 
    real(dp) :: Bkg_H1_6AD(NBIN)      ! background events in the experimental hall H1 in the period of six detectors (6AD)
    real(dp) :: Bkg_H2_6AD(NBIN)      ! background events in the experimental hall H2 in the period of six detectors (6AD)
    real(dp) :: Bkg_H3_6AD(NBIN)      ! background events in the experimental hall H3 in the period of six detectors (6AD)

    real(dp) :: Bkg_H1_8AD(NBIN)      ! background events in the experimental hall H1 in the period of eigth detectors (8AD)
    real(dp) :: Bkg_H2_8AD(NBIN)      ! background events in the experimental hall H2in the period of eigth detectors (8AD)
    real(dp) :: Bkg_H3_8AD(NBIN)      ! background events in the experimental hall H3 in the period of eigth detectors (8AD)
    
    real(dp) :: Bkg_H1_7AD(NBIN)      ! background events in the experimental hall H1 in the period of seven detectors (7AD)
    real(dp) :: Bkg_H2_7AD(NBIN)      ! background events in the experimental hall H2 in the period of seven detectors (7AD)
    real(dp) :: Bkg_H3_7AD(NBIN)      ! background events in the experimental hall H in the period of seven detectors (7AD)

    real(dp) :: Bkg_sigma2_6AD_H1(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)
    real(dp) :: Bkg_sigma2_6AD_H2(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)
    real(dp) :: Bkg_sigma2_6AD_H3(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)

    real(dp) :: Bkg_sigma2_8AD_H1(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)
    real(dp) :: Bkg_sigma2_8AD_H2(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)
    real(dp) :: Bkg_sigma2_8AD_H3(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)

    real(dp) :: Bkg_sigma2_7AD_H1(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)
    real(dp) :: Bkg_sigma2_7AD_H2(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)
    real(dp) :: Bkg_sigma2_7AD_H3(NDIM,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron)

    real(dp) :: Bkg_sigma2_N_n(NDIM*2*PD,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron) and period in the near halls
    real(dp) :: Bkg_sigma2_N_f(NDIM*2*PD,5) ! sigama square of the background uncertainties per source (Accidental Alpha-N AmC 8Li/9He fast Neutron) and period in the far halls

    real(dp) :: bkg_all_N_n(156,5)
    real(dp) :: bkg_all_N_f(156,5)

    real(dp) :: bkg_t_N_n(156)
    real(dp) :: bkg_t_N_f(156)
    
    real(dp) :: calibration_period_hall(3,3)
    real(dp) :: first_bin_calibration(3,3)
    real(dp) :: second_bin_calibration(3,3)

    real(dp) :: ADS_calibration(ADS)

    real(dp) :: correction6ADhalls(NBIN,3) ! corrections factor by six period and per experimental hall
    real(dp) :: correction8ADhalls(NBIN,3) ! corrections factor by eigth period and per experimental hall
    real(dp) :: correction7ADhalls(NBIN,3) ! corrections factor by seven period and per experimental hall

    real(dp) :: second_correction6ADhalls(NBIN,3) ! corrections factor by six period and per experimental hall
    real(dp) :: second_correction8ADhalls(NBIN,3) ! corrections factor by eigth period and per experimental hall
    real(dp) :: second_correction7ADhalls(NBIN,3) ! corrections factor by seven period and per experimental hall    

    real(dp) :: w_6AD_H3_H1(n**2,NBIN)
    real(dp) :: w_6AD_H2_H1(n**2,NBIN)
    real(dp) :: w_6AD_H3_H2(n**2,NBIN)
    real(dp) :: w_6AD_H1_H2(n**2,NBIN)

    real(dp) :: w_8AD_H3_H1(n**2,NBIN)
    real(dp) :: w_8AD_H2_H1(n**2,NBIN)
    real(dp) :: w_8AD_H3_H2(n**2,NBIN)
    real(dp) :: w_8AD_H1_H2(n**2,NBIN)

    real(dp) :: w_7AD_H3_H1(n**2,NBIN)
    real(dp) :: w_7AD_H2_H1(n**2,NBIN)
    real(dp) :: w_7AD_H3_H2(n**2,NBIN)
    real(dp) :: w_7AD_H1_H2(n**2,NBIN)

    real(dp) :: N_n(156)
    real(dp) :: N_f(156)

    real(dp) :: N_i(156)
    real(dp) :: N_j(156)

    real(dp) :: pullEngy
    integer :: k

end module db_data