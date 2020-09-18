module reno_data
    use types
    implicit none
    integer,parameter :: NDIM=10                    ! NDIM is the number of pull parameters
    integer,parameter :: ADS=2                      ! ADS is the number of detectors
    integer,parameter :: RCTS=6                     ! RCTS is the number of reactors
    integer,parameter :: RIR=4                      ! RIR is the number of radioactive isotopes in the reactors     
    integer,parameter :: NBIN=26                    ! NBIN is the number of energy-bin
    integer,parameter :: osc=1
    integer,parameter :: randDis=2                  ! randDis => 1 normal, randDis => 2 uniforme
    integer,parameter :: num_experiments=500
    
    real(dp),save :: nearObs(NBIN)              ! nearObs is the observed black-data-ṕoint spectrum in the Near detector by i-bin
    real(dp),save :: farObs(NBIN)               ! farObs is the observed black-data-ṕoint spectrum in the Far detector by i-bin    

    real(dp), save :: detector_efficiency(ADS)  ! Detector efficiency per antineutirno detector
    real(dp), save :: neutrino_energy(NBIN)
    real(dp), save :: average_energy_released_per_fission
    real(dp), save :: reactor_flux_model(NBIN)=1.0_dp
    real(dp), save :: cross_section_v(NBIN)=1.0_dp

    real(dp),save :: sigma_background_d(ADS)
    real(dp),save :: sigma_reactor_flux(RCTS)
    real(dp),save :: sigma_detection_efficiency
    real(dp),save :: sigma_efficiency_corr(ADS)
    real(dp),save :: sigma_energy_scale


    real(dp),save :: data(NBIN,ADS,RCTS)

    real(dp),save :: sigma_thermal_power(RCTS)
    real(dp),save :: sigma_fission_fraction(RIR)
    real(dp),save :: sigma_average_energy_released_per_fission
    real(dp),save :: sigma_reactor_flux_model(NBIN)
    real(dp),save :: sigma_cross_section(NBIN)

    real(dp),save :: rand_Nthermalpower(NBIN,RCTS,num_experiments)=1.0_dp    
    real(dp),save :: rand_Nfissionfraction(NBIN,RIR,num_experiments)=1.0_dp
    real(dp),save :: rand_Navrgenergyperfission(NBIN,1,num_experiments)=1.0_dp    
    real(dp),save :: rand_Nreactorfluxmodel(NBIN,num_experiments)=1.0_dp
    real(dp),save :: rand_Ncrosssection(NBIN,1,num_experiments)=1.0_dp
    real(dp),save :: rand_Nefficiency(NBIN,ADS,num_experiments)=1.0_dp
    real(dp),save :: rand_Nenergy(NBIN,num_experiments)=1.0_dp

    real(dp),save :: rand_Nbkgtotal(NBIN,ADS,num_experiments)=1.0_dp

    integer,save :: i_name,j_name

    real(dp),save :: pulls(NDIM)                ! array de pulls que minimizan a chi2
    real(dp),save :: LT_d(ADS)                  ! LT_d is the live time of the near and far detectors in days    
    real(dp),save :: TP_d(ADS)                  ! TP_d is the target proton by detector
    real(dp),save :: TBR_n_f(ADS)               ! TBR_n_f is the Total Backgroond Rate (#IBD/ day)
    real(dp),save :: BSU_n_f_P_T(ADS,2)         ! BSU_n_f_P_T is the Background systematic uncertainties for near andd far detector in percentage and total IBD (%,#IBD)
    real(dp),save :: length_d_r(ADS,RCTS)       ! length_d_r is the length between detector-reactor (Tesis Tiago)        
    real(dp),save :: bines(NBIN,2)              ! bines es una matriz con los valores que determinan los bines de energía usados    
    
    real(dp),save :: nearExp(NBIN)              ! nearExp is the expected blue-data-ṕoint spectrum in the Near detector by i-bin
    real(dp),save :: farExp(NBIN)               ! farExp is the expected blue-data-ṕoint spectrum in the Far detector by i-bin
    real(dp),save :: sigmaNear(NBIN)            ! is the uncertainty of Near black data point
    real(dp),save :: sigmaFar(NBIN)             ! is the uncertainty of Far black data point
    real(dp),save :: wDR(ADS,RCTS)              ! wDR  is the contribution ratios per detector from reactor    
    real(dp),save :: uS(5)                      ! uS US contains the systematic uncertainties employed in a pulls chi
    real(dp),save :: bkg(NBIN,ADS)              ! bkg is the number of background events per bin in each detectore (Near,Far)
    real(dp),save :: TP_r(RCTS)                 ! TP_r is the thermal power by reactor
    real(dp),save :: FNF(RIR)                   ! FNF is the nuclear fission fraction
    real(dp),save :: bkgFarAcc(NBIN)            ! bkgFarAcc is the accidental background for far detector by bin
    real(dp),save :: bkgFarCf(NBIN)             ! bkgFarCf is the Californio background  for far detector by bin
    real(dp),save :: bkgFarFN(NBIN)             ! bkgFarFN is the fast neutron background  for far detector by bin
    real(dp),save :: bkgFarLH(NBIN)             ! bkgFarLH is the Helium and  background  for far detector by bin
    
    real(dp),save :: rFluxC(NBIN)               ! rFluxC is the correlated systematic uncertainty
    real(dp),save :: rFluxU(NBIN)               ! rFluxU is the uncorrelated systematic uncertainty
    real(dp),save :: bkgTotal(NBIN)             ! bkgTotal is the 
    real(dp),save :: engyScale(NBIN)            ! engyScale is the -
    real(dp),save :: DeffU(NBIN)                ! DeffU is the detection efficienty of the detector -
    real(dp),save :: DeffCS(NBIN)               ! DeffCS is the systematic uncorrelated uncertainty -
    real(dp),save :: systUncor(NBIN)             ! systCorr is the systematic correlated uncertainty -
    

    real(dp),save :: engyPull                   ! engyPull is the pull associated with the energy scale

    real(dp),save :: fr(RCTS)                   ! fr are the pulls associated to sigma_r_flux
    real(dp),save :: eps                        ! eps is the pull associated to sigma_eff
    real(dp),save :: eta                        ! e is the pull associated to sigma_scale
    real(dp),save :: c_i(NBIN)                  ! c_i is the pull associated to the uncorrelated bin-to-bin spectrum shape uncertainty 
    real(dp),save :: detector_calibration(ADS)
    
end module reno_data