real(8) function db_energy_relation_anu_prompt(i,E_prompt)
    use db_data, only: bin_var
    implicit none
    real(8) :: db_detector_response_model_function
    real(8) :: E_prompt    ! E_prompt
    integer :: i
    db_energy_relation_anu_prompt=0.0d0
    !db_energy_relation_anu_prompt = bin_var(i)*db_detector_response_model_function(E_prompt)*E_prompt + 0.78d0 ! [MeV]
    db_energy_relation_anu_prompt = bin_var(i)*E_prompt + 0.78d0 ! [MeV]

    if (db_energy_relation_anu_prompt<=1.8010001) db_energy_relation_anu_prompt=1.8010001
    return
end function db_energy_relation_anu_prompt