real(8) function db_M_energy_relation_anu_prompt(i,k,E_prompt)
    use db_data, only: rand_Nenergy
    implicit none
    real(8) :: db_detector_response_model_function
    real(8) :: E_prompt    ! E_prompt
    integer :: i,k
    db_M_energy_relation_anu_prompt=0.0d0
    !db_M_energy_relation_anu_prompt = rand_Nenergy(i,k)*db_detector_response_model_function(E_prompt)*E_prompt + 0.78d0 ! [MeV]
    db_M_energy_relation_anu_prompt = rand_Nenergy(i,k)*E_prompt + 0.78d0 ! [MeV]

    if (db_M_energy_relation_anu_prompt<=1.8010001) db_M_energy_relation_anu_prompt=1.8010001
    return
end function db_M_energy_relation_anu_prompt