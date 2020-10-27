real(8) function probability(t13,dmee,l,x)
 use neu_osc_parameters, only: Y
 implicit none
 real(8) :: t13
 real(8) :: dmee
 real(8) :: l,x
 real(8) :: db_probability_1
 real(8) :: db_probability_2
 real(8) :: P(3),Pbar(3)
 
 select case(2)
     case(1)
        probability=db_probability_1(t13,dmee,l,x)
     case(2)
        probability=db_probability_2(dmee,l,x)
     case(3)
      call prob_cp(Y,l,x,P,Pbar)
      probability=P(1)
      !probability=Pbar(1)
 end select
return
end function probability