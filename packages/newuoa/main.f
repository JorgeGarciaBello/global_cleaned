cC
cC     The Chebyquad test problem (Fletcher, 1965) for N = 2,4,6 and 8,
cC     with NPT = 2N+1.
cC
c      IMPLICIT REAL*8 (A-H,O-Z)
c      DIMENSION X(10),W(10000)
c      IPRINT=2
c      MAXFUN=5000
c      RHOEND=1.0D-6
c      DO 30 N=2,8,2
c      NPT=2*N+1
c      DO 10 I=1,N
c   10 X(I)=DFLOAT(I)/DFLOAT(N+1)
c      RHOBEG=0.2D0*X(1)
cc      PRINT 20, N,NPT
cc   20 FORMAT (//4X,'Results with N =',I2,' and NPT =',I3)
c      CALL NEWUOA (N,NPT,X,RHOBEG,RHOEND,IPRINT,MAXFUN,W)
c   30 CONTINUE
c      STOP
c      END
c
