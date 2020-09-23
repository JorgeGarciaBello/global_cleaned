! 	program tes 			
! 	implicit  none 
! 	
!  	real*8 Y(13),P(3),Pbar(3)
! 	real*8 costheta,Eneutri
! 
! 	Y(1)=8.0d-5 ! dm2_12   
! 	Y(2)=2.5d-3 !dm2_23
! 	Y(3)=0.0d0 !dm2_34
! 	Y(4)=0.5d0 !theta_12
! 	Y(5)=0.1  !theta_13
! 	Y(6)=0.78  !theta_23
! 	Y(7)=0.0d0 !theta_14
! 	Y(8)=0.0d0 !theta_24
! 	Y(9)=0.0d0 !theta_34
! 	Y(10)=0.0
! 
! 	call prob_cp(Y,-0.0d0,1.0d0,P,Pbar)
! 
! 	print*,P(1),P(2),P(3)
! 	print*,Pbar(1),Pbar(2),Pbar(3)
! 
! 	end








	subroutine prob_cp(Y,c_L,Eneutri,P,Pbar)
	implicit  none
	
 	real*8 Y(13),P(3),Pbar(3)
	
	complex*8  u(4,4),ei_delta,ei_negdelta,ei_w(4,4)
	complex*8  expiw,pee,peebar,pemu,pemubar
	complex*8  pmumu,pmumubar

	real*8  s12,c12,c13,s23,c23,s14,c14,s24,c24,s34,c34,s13
	real*8  th12,th13,th23,th14,th24,th34,delta

	real*8  dm2(4,4),w(4,4)
	real*8 w12,w13,w14,w23,w24,w34
	real*8  R,c_L,h,c_LoE,Eneutri,costheta
	real*8  dm221,dm232,dm243

	integer a,b,i,j,k
	


	call umat4_cp(Y,u)


	dm221=Y(1)
	dm232=Y(2)
	dm243=Y(3)
	th12=Y(4)
	th13=Y(5)
	th23=Y(6)
	th14=Y(7)
	th24=Y(8)	
	th34=Y(9)
	delta=Y(10)

 
!  	write(*,*)(Y(k),k=1,10)

! 	write(*,*) costheta,Eneutri


	c_LoE=c_L/Eneutri


	dm2(2,1)=dm221
	dm2(3,2)=dm232
	dm2(4,3)=dm243


	w(2,1)=2.48*dm2(2,1)*c_L/Eneutri
	w(3,2)=2.48*dm2(3,2)*c_L/Eneutri
	w(4,3)=2.48*dm2(4,3)*c_L/Eneutri
	w(3,1)=w(3,2)+w(2,1)
	w(4,1)=w(4,3)+w(3,1)
	w(4,2)=w(4,3)+w(3,2)


 	 w(1,2)  = -1.0d0* w(2,1)
 	 w(2,3)  = -1.0d0* w(3,2)
 	 w(3,4)  = -1.0d0* w(4,3)
 	 w(1,3)  = -1.0d0* w(3,1)
 	 w(1,4)  = -1.0d0* w(4,1)
 	 w(2,4)  = -1.0d0* w(4,2)



 	 w(1,1)  = 0.0d0
 	 w(2,2)  = 0.0d0
 	 w(3,3)  = 0.0d0 
 	 w(4,4)  = 0.0d0 
 	 

	

	pee=cmplx(0.0d0,0.0d0)
	peebar=cmplx(0.0d0,0.0d0)
	pemu=cmplx(0.0d0,0.0d0)
	pemubar=cmplx(0.0d0,0.0d0)	
	pmumu=cmplx(0.0d0,0.0d0)
	pmumubar=cmplx(0.0d0,0.0d0)	

	do k=1,4
	do j=1,4

	a=1
	b=1
	expiw=cmplx(cos(w(k,j)),-1.0d0*sin(w(k,j)) )
	pee=pee+CONJG(u(a,k))*u(b,k)*u(a,j)*CONJG(u(b,j))* expiw
	peebar=peebar+u(a,k)*CONJG(u(b,k))*CONJG(u(a,j))*u(b,j)* expiw
	a=1
	b=2
	expiw=cmplx(cos(w(k,j)),-1.0d0*sin(w(k,j)) )
	pemu=pemu+CONJG(u(a,k))*u(b,k)*u(a,j)*CONJG(u(b,j))* expiw
	pemubar=pemubar+u(a,k)*CONJG(u(b,k))*CONJG(u(a,j))*u(b,j)* expiw
	a=2
	b=2
	expiw=cmplx(cos(w(k,j)),-1.0d0*sin(w(k,j)) )
	pmumu=pmumu+CONJG(u(a,k))*u(b,k)*u(a,j)*CONJG(u(b,j))* expiw
	pmumubar=pmumubar+u(a,k)*CONJG(u(b,k))*CONJG(u(a,j))*u(b,j)* expiw

	enddo 
	enddo

	P(1)=real(pee)
	Pbar(1)=real(peebar)

	P(2)=real(pemu)
	Pbar(2)=real(pemubar)

	P(3)=real(pmumu)
	Pbar(3)=real(pmumubar)



! 	Pee= 1.0d0 - ( (sin(2.0d0*th13) )**2)* 		
!      c     	   ((sin(1.27d0*dm232*c_LoE))**2)
! 	Pemu= (sin(th23)**2) *(sin(2.0d0*th13)**2) *	     
!      c         	   (sin(1.27d0*dm232*c_LoE)**2)
! 	 Pmumu= 1.0d0 - 4.0d0* ( ( (cos(th13)) **2)*	        
!      c             ( (sin(th23)) **2)*				
!      c             (1.0d0 - (cos(th13)*sin(th23))**2 )*	     
!      c              ((sin(1.27d0*dm232*c_LoE))**2)   )
! 	P(1)=Pee
! 	Pbar(1)=Pee
! 	P(2)=Pemu
! 	Pbar(2)=Pemu
! 	P(3)=Pmumu
! 	Pbar(3)=Pmumu





	end 






	subroutine umat4_cp(Y,u)
	implicit none


	complex*8  u(4,4),ei_delta,ei_negdelta,ei_w(4,4)
	complex*8  expiw,pee,peebar,pemu,pemubar
	complex*8  pmumu,pmumubar

	real*8  s12,c12,c13,s23,c23,s14,c14,s24,c24,s34,c34,s13
	real*8  th12,th13,th23,th14,th24,th34,delta,Y(13)


	th12=Y(4)
	th13=Y(5)
	th23=Y(6)
	th14=Y(7)
	th24=Y(8)	
	th34=Y(9)
	delta=Y(10)


!c calculate sin's and cos's
	s12=sin(th12)
      	c12=cos(th12)
      	s13=sin(th13)
      	c13=cos(th13)
      	s23=sin(th23)
      	c23=cos(th23)
      	s14=sin(th14)
      	c14=cos(th14)
      	s24=sin(th24)
      	c24=cos(th24)
      	s34=sin(th34)
      	c34=cos(th34)      
	ei_delta=  cmplx(cos(delta),sin(delta))
	ei_negdelta=cmplx(cos(delta),-sin(delta))        

!   calculate u's


      	u(1,1)=c12* c13 *c14
      	u(1,2)=c13* c14 *s12
      	u(1,3)=c14* (s13*ei_negdelta)


      	u(1,4)=s14
      	 
      	u(2,1)=c24*(-c23*s12 - c12*(s13*ei_delta)*s23) - c12*c13*s14*s24
      	u(2,2)=c24* (c12*c23 - s12*(s13*ei_delta)*s23) -    	
     c             c13*s12*s14*s24
      	u(2,3)=c13*c24*s23 - (s13*ei_delta)*s14*s24
      	u(2,4)= c14*s24    

      	u(3,1)=c34 *(-c12 *c23* (s13*ei_delta) + s12* s23) - 	
     c       (c12* c13* c24* s14* s34) - 			
     c        ((-c23* s12 - c12* (s13*ei_delta)* s23)* s24 *s34)
      	u(3,2)=c34* (-c23* s12* (s13*ei_delta) - c12* s23) - 	
     c       (c13* c24* s12* s14* s34) -  			
     c        ((c12* c23 - s12* (s13*ei_delta)* s23)* s24* s34)
     
      	u(3,3)=(c13* c23* c34) - (c24* (s13*ei_delta)* s14* s34) - 
     c            (c13* s23* s24* s34)
      	u(3,4)=c14* c24* s34
    
      	u(4,1)=(-c12* c13* c24* c34* s14) -  		
     c       (c34* (-c23*s12 - c12* (s13*ei_delta) *s23)* s24) -	
     c       ((-c12* c23* (s13*ei_delta) + s12* s23)* s34)
      
      	u(4,2)=(-c13 *c24* c34 *s12 *s14) - 		
     c       (c34 *(c12* c23 - s12 *(s13*ei_delta) *s23) *s24) - 	
     c       ((-c23 *s12 *(s13*ei_delta) - c12* s23) *s34)
   
      	u(4,3)=(-c24 *c34 *(s13*ei_delta) *s14) -			
     c      (c13 *c34 *s23* s24) - (c13* c23* s34)

	u(4,4)=c14* c24 *c34




	end






















