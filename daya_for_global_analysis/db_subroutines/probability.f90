real(8) function probability(t13,dmee,l,x) 
 implicit none
 real(8) :: t13
 real(8) :: dmee
 real(8) :: l,x
 real(8) :: db_probability_1
 real(8) :: db_probability_2
 
 select case(1)
     case(1)
     probability=db_probability_1(t13,dmee,l,x)
     case(2)      
      ! db_probability_2    should be modificated for a global analysis
      probability=db_probability_2(dmee,l,x)
 end select
return
end function probability