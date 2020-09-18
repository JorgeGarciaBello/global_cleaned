real(8) function db_create_w_i(t13,dmee,i)
    use db_data, only: NBIN,PD,bkg_t_N_n,bkg_t_N_f
    implicit none
    real(8) :: t13, dmee
    integer :: i
    real(8) :: db_expected_antineutrino_number_all_bin_n
    real(8) :: db_expected_antineutrino_number_all_bin_f
    
    db_create_w_i=0.0d0    
    db_create_w_i=(db_expected_antineutrino_number_all_bin_f(i,t13,dmee))/     &
                  (db_expected_antineutrino_number_all_bin_n(i,t13,dmee))
    return
end function db_create_w_i