      !PROGRAM prueba        
      !  INTEGER,PARAMETER ::N=2
      !  EXTERNAL            FCN
      !  INTEGER             NSIG        
      !  INTEGER             ITMAX
      !  REAL*8              PAR(1),X(N),FNORM,WK(N*(3*N+15)/2)

      !  NSIG=8
      !  ITMAX=300
      !  PAR(1)=0.0d0
      !  X=(/0.001D0,-2.0D0/)

      !  print*,'HOLA'

      !  CALL ZSPOW(FCN,NSIG,N,ITMAX,PAR,X,FNORM,WK)

      !  print*,'X',X
      !  print*,'FNORM',FNORM

      !  RETURN
      !END PROGRAM prueba

   !   SUBROUTINE FCN(X,F,N,PAR)
   !     use db_data, only: RCTS, ADS
   !      IMPLICIT REAL*8 (A-H,O-Z)
   !      REAL*8 X(N),F(N),PAR(1)
   !      REAL*8 db_partial_chi2_eps
   !      REAL*8 db_partial_chi2_alpha_r
   !      REAL*8 db_partial_chi2_epsilon_d
   !      REAL*8 db_partial_chi2_eta_d

  !       real(8) :: eps
  !       real(8) :: alpha_r(RCTS)
  !       real(8) :: eps_d(ADS)
  !       real(8) :: eta_d(ADS)

 !        eps=X(1)
 !        alpha_r=(/X(2),X(3),X(4),X(5),X(6),X(7)/)
 !        eps_d=(/X(8),X(9),X(10),X(11),X(12),X(13),X(14),X(15)/)
 !        eta_d=(/X(16),X(17),X(18),X(19),X(20),X(21),X(22),X(23)/)



!         F(1)=db_partial_chi2_eps(eps,alpha_r,eps_d,eta_d)

!         F(2)=db_partial_chi2_alpha_r(1,eps,alpha_r,eps_d,eta_d)
!         F(3)=db_partial_chi2_alpha_r(2,eps,alpha_r,eps_d,eta_d)
!         F(4)=db_partial_chi2_alpha_r(3,eps,alpha_r,eps_d,eta_d)
!         F(5)=db_partial_chi2_alpha_r(4,eps,alpha_r,eps_d,eta_d)
!         F(6)=db_partial_chi2_alpha_r(5,eps,alpha_r,eps_d,eta_d)
!         F(7)=db_partial_chi2_alpha_r(6,eps,alpha_r,eps_d,eta_d)

 !        F(8)=db_partial_chi2_epsilon_d(1,eps,alpha_r,eps_d,eta_d)
 !        F(9)=db_partial_chi2_epsilon_d(2,eps,alpha_r,eps_d,eta_d)
 !        F(10)=db_partial_chi2_epsilon_d(3,eps,alpha_r,eps_d,eta_d)
!         F(11)=db_partial_chi2_epsilon_d(4,eps,alpha_r,eps_d,eta_d)
!         F(12)=db_partial_chi2_epsilon_d(5,eps,alpha_r,eps_d,eta_d)
!         F(13)=db_partial_chi2_epsilon_d(6,eps,alpha_r,eps_d,eta_d)
!         F(14)=db_partial_chi2_epsilon_d(7,eps,alpha_r,eps_d,eta_d)
!         F(15)=db_partial_chi2_epsilon_d(8,eps,alpha_r,eps_d,eta_d)

!         F(16)=db_partial_chi2_eta_d(1,eps,alpha_r,eps_d,eta_d)
!         F(17)=db_partial_chi2_eta_d(2,eps,alpha_r,eps_d,eta_d)
!         F(18)=db_partial_chi2_eta_d(3,eps,alpha_r,eps_d,eta_d)
!         F(19)=db_partial_chi2_eta_d(4,eps,alpha_r,eps_d,eta_d)
!         F(20)=db_partial_chi2_eta_d(5,eps,alpha_r,eps_d,eta_d)
!         F(21)=db_partial_chi2_eta_d(6,eps,alpha_r,eps_d,eta_d)
!         F(22)=db_partial_chi2_eta_d(7,eps,alpha_r,eps_d,eta_d)
!         F(23)=db_partial_chi2_eta_d(8,eps,alpha_r,eps_d,eta_d)

!         RETURN
!      END
      
      SUBROUTINE ZSPOW (FCN,NSIG,N,ITMAX,PAR,X,FNORM,WK)
C-----------------------------------------------------------------------
C
C   USAGE               - CALL ZSPOW (FCN,NSIG,N,ITMAX,PAR,X,FNORM,
C                           WK)
C
C   ARGUMENTS    FCN    - THE NAME OF A USER-SUPPLIED SUBROUTINE WHICH
C                           EVALUATES THE SYSTEM OF EQUATIONS TO BE
C                           SOLVED. FCN MUST BE DECLARED EXTERNAL IN
C                           THE CALLING PROGRAM AND MUST HAVE THE
C                           FOLLOWING FORM,
C                             SUBROUTINE FCN(X,F,N,PAR)
C                             IMPLICIT REAL*8 (A-H,O-Z)
C                             REAL*8 X(N),F(N),PAR(1)
C                             F(1)=
C                              .
C                             F(N)=
C                             RETURN
C                             END
C                           GIVEN X(1)...X(N), FCN MUST EVALUATE THE
C                           FUNCTIONS F(1)...F(N) WHICH ARE TO BE MADE
C                           ZERO. X SHOULD NOT BE ALTERED BY FCN. THE
C                           PARAMETERS IN VECTOR PAR (SEE ARGUMENT
C                           PAR BELOW) MAY ALSO BE USED IN THE
C                           CALCULATION OF F(1)...F(N).
C                NSIG   - THE NUMBER OF DIGITS OF ACCURACY DESIRED
C                           IN THE COMPUTED ROOT. (INPUT)
C                N      - THE NUMBER OF EQUATIONS TO BE SOLVED AND
C                           THE NUMBER OF UNKNOWNS. (INPUT)
C                ITMAX  - THE MAXIMUM ALLOWABLE NUMBER OF ITERATIONS.
C                           (INPUT) THE MAXIMUM NUMBER OF CALLS TO FCN
C                           IS ITMAX*(N+1). SUGGESTED VALUE = 200.
C                PAR    - PAR CONTAINS A PARAMETER SET WHICH IS
C                           PASSED TO THE USER-SUPPLIED FUNCTION FCN.
C                           PAR MAY BE USED TO PASS ANY AUXILIARY
C                           PARAMETERS NECESSARY FOR COMPUTATION OF
C                           THE FUNCTION FCN. (INPUT)
C                X      - A VECTOR OF LENGTH N. (INPUT/OUTPUT) ON INPUT,
C                           X IS THE INITIAL APPROXIMATION TO THE ROOT.
C                           ON OUTPUT, X IS THE BEST APPROXIMATION TO
C                           THE ROOT FOUND BY ZSPOW.
C                FNORM  - ON OUTPUT, FNORM IS EQUAL TO
C                           F(1)**2+...F(N)**2 AT THE POINT X.
C                WK     - WORK VECTOR OF LENGTH N*(3*N+15)/2
C-----------------------------------------------------------------------
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            NSIG,N,ITMAX,IER
      DOUBLE PRECISION   PAR(1),X(N),FNORM,WK(1)
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            INDEX2,INDEX,INFO,I,J,LR,MAXFEV,ML,MODE,MU,
     1                   NFEV,NPRINT
      DOUBLE PRECISION   EPSFCN,FACTOR,ONE,XTOL,ZERO
      EXTERNAL           FCN
      DATA               FACTOR,ONE,ZERO /1.0D2,1.0D0,0.0D0/
C                                  FIRST EXECUTABLE STATEMENT
      INFO = 0
C                                  CALL ZSPWA
      MAXFEV = ITMAX*(N + 1)
      XTOL = 0.1D0**NSIG
      ML = N - 1
      MU = N - 1
      EPSFCN = ZERO
      MODE = 2
      DO 5 J = 1, N
         WK(J) = ONE
    5 CONTINUE
      NPRINT = 0
      LR = (N*(N + 1))/2
      INDEX = 7*N + LR
      CALL ZSPWA(FCN,N,X,WK(6*N+1),XTOL,MAXFEV,ML,MU,EPSFCN,WK(1),
     * MODE,FACTOR,NPRINT,INFO,NFEV,WK(INDEX+1),N,WK(7*N+1),LR,
     * WK(N+1),WK(2*N+1),WK(3*N+1),WK(4*N+1),WK(5*N+1),PAR)
      IF (INFO .EQ. 5) INFO = 4
      FNORM = 0.0D0
      DO 10 I=1,N
         INDEX2 = 6*N+I
         FNORM = FNORM+WK(INDEX2)*WK(INDEX2)
   10 CONTINUE
      IF (INFO .EQ. 2) WRITE(6,*) ' ZSPOW: NUMBER OF CALLS > ITMAX*(N+1)
     X TRY A NEW INITIAL GUESS'
      IF (INFO .EQ. 3) WRITE(6,*) ' ZSPOW: NSIG IS TOO LARGE'
      IF (INFO .EQ. 4) WRITE(6,*) ' ZSPOW: ITERATION HAS NOT MADE GOOD P
     XROGRESS (TRY A NEW GUESS)'
      RETURN
      END
      SUBROUTINE ZSPWA (FCN,N,X,FVEC,XTOL,MAXFEV,ML,MU,EPSFCN,DIAG,MODE,
     *                   FACTOR,NPRINT,INFO,NFEV,FJAC,LDFJAC,R,LR,QTF,
     *                   WA1,WA2,WA3,WA4,PAR)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            N,MAXFEV,ML,MU,MODE,NPRINT,INFO,NFEV,LDFJAC,LR
      DOUBLE PRECISION   X(N),FVEC(N),XTOL,EPSFCN,DIAG(N),FACTOR,
     *                   FJAC(LDFJAC,N),R(LR),QTF(N),WA1(N),WA2(N),
     *                   WA3(N),WA4(N),PAR(1)
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            IFLAG,ITER,IWA(1),I,JM1,J,L,MSUM,NCFAIL,NCSUC,
     *                   NSLOW1,NSLOW2
      DOUBLE PRECISION   ACTRED,DELTA,EPSMCH,FNORM1,FNORM,ONE,P0001,
     *                   P001,P1,P5,PNORM,PRERED,RATIO,SPMPAR,SUM,TEMP,
     *                   XNORM,ZERO
      DOUBLE PRECISION   DNRM2
      LOGICAL            JEVAL,SING
      EXTERNAL           FCN
      DATA               SPMPAR /0.222045D-15/
      DATA               ONE,P1,P5,P001,P0001,ZERO /1.0D0,1.0D-1,5.0D-1,
     *                   1.0D-3,1.0D-4,0.0D0/
C                                  EPSMCH IS THE MACHINE PRECISION.
C                                  FIRST EXECUTABLE STATEMENT
      EPSMCH = SPMPAR
      INFO = 0
      IFLAG = 0
      NFEV = 0
C                                  CHECK THE INPUT PARAMETERS FOR
C                                  ERRORS.
      IF (N.LE.0 .OR. XTOL.LT.ZERO .OR. MAXFEV.LE.0 .OR. ML.LT.0 .OR.
     *MU.LT.0 .OR. FACTOR.LE.ZERO .OR. LDFJAC.LT.N .OR.
     *LR.LT.(N*(N+1))/2) GO TO 150
      IF (MODE.NE.2) GO TO 10
      DO 5 J=1,N
         IF (DIAG(J).LE.ZERO) GO TO 150
    5 CONTINUE
   10 CONTINUE
C                                  EVALUATE THE FUNCTION AT THE STARTING
C                                  POINT AND CALCULATE ITS NORM.
      IFLAG = 1
      CALL FCN(X,FVEC,N,PAR)
      NFEV = 1
      IF (IFLAG.LT.0) GO TO 150
      FNORM = DNRM2(N,FVEC,1)
C                                  DETERMINE THE NUMBER OF CALLS TO FCN
C                                  NEEDED TO COMPUTE THE JACOBIAN
C                                  MATRIX.
C
      MSUM = MIN0(ML+MU+1,N)
C
C                                  INITIALIZE ITERATION COUNTER AND
C                                  MONITORS.
      ITER = 1
      NCSUC = 0
      NCFAIL = 0
      NSLOW1 = 0
      NSLOW2 = 0
C                                  BEGINNING OF THE OUTER LOOP.
   15 CONTINUE
      JEVAL = .TRUE.
C                                  CALCULATE THE JACOBIAN MATRIX.
      IFLAG = 2
      CALL ZSPWB(FCN,N,X,FVEC,FJAC,LDFJAC,IFLAG,ML,MU,EPSFCN,WA1,WA2,
     *PAR)
      NFEV = NFEV+MSUM
      IF (IFLAG.LT.0) GO TO 150
C                                  COMPUTE THE QR FACTORIZATION OF THE
C                                  JACOBIAN.
      CALL ZSPWG(N,N,FJAC,LDFJAC,.FALSE.,IWA,1,WA1,WA2,WA3)
C                                  ON THE FIRST ITERATION AND IF MODE IS
C                                  1, SCALE ACCORDING TO THE NORMS OF
C                                  THE COLUMNS OF THE INITIAL JACOBIAN.
      IF (ITER.NE.1) GO TO 35
      IF (MODE.EQ.2) GO TO 25
      DO 20 J=1,N
         DIAG(J) = WA2(J)
         IF (WA2(J).EQ.ZERO) DIAG(J) = ONE
   20 CONTINUE
   25 CONTINUE
C                                  ON THE FIRST ITERATION, CALCULATE THE
C                                  NORM OF THE SCALED X AND INITIALIZE
C                                  THE STEP BOUND DELTA.
      DO 30 J=1,N
         WA3(J) = DIAG(J)*X(J)
   30 CONTINUE
      XNORM = DNRM2(N,WA3,1)
      DELTA = FACTOR*XNORM
      IF (DELTA.EQ.ZERO) DELTA = FACTOR
   35 CONTINUE
C                                  FORM (Q TRANSPOSE)*FVEC AND STORE IN
C                                  QTF.
      DO 40 I=1,N
         QTF(I) = FVEC(I)
   40 CONTINUE
      DO 60 J=1,N
         IF (FJAC(J,J).EQ.ZERO) GO TO 55
         SUM = ZERO
         DO 45 I=J,N
            SUM = SUM+FJAC(I,J)*QTF(I)
   45    CONTINUE
         TEMP = -SUM/FJAC(J,J)
         DO 50 I=J,N
            QTF(I) = QTF(I)+FJAC(I,J)*TEMP
   50    CONTINUE
   55    CONTINUE
   60 CONTINUE
C                                  COPY THE TRIANGULAR FACTOR OF THE QR
C                                  FACTORIZATION INTO R.
      SING = .FALSE.
      DO 75 J=1,N
         L = J
         JM1 = J-1
         IF (JM1.LT.1) GO TO 70
         DO 65 I=1,JM1
            R(L) = FJAC(I,J)
            L = L+N-I
   65    CONTINUE
   70    CONTINUE
         R(L) = WA1(J)
         IF (WA1(J).EQ.ZERO) SING = .TRUE.
   75 CONTINUE
C                                  ACCUMULATE THE ORTHOGONAL FACTOR IN
C                                  FJAC.
      CALL ZSPWF(N,N,FJAC,LDFJAC,WA1)
C                                  RESCALE IF NECESSARY.
      IF (MODE.EQ.2) GO TO 85
      DO 80 J=1,N
         DIAG(J) = DMAX1(DIAG(J),WA2(J))
   80 CONTINUE
   85 CONTINUE
C                                  BEGINNING OF THE INNER LOOP.
   90 CONTINUE
C                                  IF REQUESTED, CALL FCN TO ENABLE
C                                  PRINTING OF ITERATES.
      IF (NPRINT.LE.0) GO TO 95
      IFLAG = 0
      IF (IFLAG.LT.0) GO TO 150
   95 CONTINUE
C                                  DETERMINE THE DIRECTION P.
      CALL ZSPWC(N,R,LR,DIAG,QTF,DELTA,WA1,WA2,WA3)
C                                  STORE THE DIRECTION P AND X + P.
C                                  CALCULATE THE NORM OF P.
      DO 100 J=1,N
         WA1(J) = -WA1(J)
         WA2(J) = X(J)+WA1(J)
         WA3(J) = DIAG(J)*WA1(J)
  100 CONTINUE
      PNORM = DNRM2(N,WA3,1)
C                                  ON THE FIRST ITERATION, ADJUST THE
C                                  INITIAL STEP BOUND.
      IF (ITER.EQ.1) DELTA = DMIN1(DELTA,PNORM)
C                                  EVALUATE THE FUNCTION AT X + P AND
C                                  CALCULATE ITS NORM.
      IFLAG = 1
      CALL FCN(WA2,WA4,N,PAR)
      NFEV = NFEV+1
      IF (IFLAG.LT.0) GO TO 150
      FNORM1 = DNRM2(N,WA4,1)
C                                  COMPUTE THE SCALED ACTUAL REDUCTION.
      ACTRED = -ONE
      IF (FNORM1.LT.FNORM) ACTRED = ONE-(FNORM1/FNORM)**2
C                                  COMPUTE THE SCALED PREDICTED
C                                  REDUCTION.
      L = 1
      DO 110 I=1,N
         SUM = ZERO
         DO 105 J=I,N
            SUM = SUM+R(L)*WA1(J)
            L = L+1
  105    CONTINUE
         WA3(I) = QTF(I)+SUM
  110 CONTINUE
      TEMP = DNRM2(N,WA3,1)
      PRERED = ONE
      IF (TEMP.LT.FNORM) PRERED = ONE-(TEMP/FNORM)**2
C                                  COMPUTE THE RATIO OF THE ACTUAL TO
C                                  THE PREDICTED REDUCTION.
      RATIO = ZERO
      IF (PRERED.GT.ZERO) RATIO = ACTRED/PRERED
C                                  UPDATE THE STEP BOUND.
      IF (RATIO.GE.P1) GO TO 115
      NCSUC = 0
      NCFAIL = NCFAIL+1
      DELTA = P5*DELTA
      GO TO 120
  115 CONTINUE
      NCFAIL = 0
      NCSUC = NCSUC+1
      IF (RATIO.GE.P5 .OR. NCSUC.GT.1) DELTA = DMAX1(DELTA,PNORM/P5)
      IF (DABS(RATIO-ONE).LE.P1) DELTA = PNORM/P5
  120 CONTINUE
C                                  TEST FOR SUCCESSFUL ITERATION.
      IF (RATIO.LT.P0001) GO TO 130
C                                  SUCCESSFUL ITERATION. UPDATE X, FVEC,
C                                  AND THEIR NORMS.
      DO 125 J=1,N
         X(J) = WA2(J)
         WA2(J) = DIAG(J)*X(J)
         FVEC(J) = WA4(J)
  125 CONTINUE
      XNORM = DNRM2(N,WA2,1)
      FNORM = FNORM1
      ITER = ITER+1
  130 CONTINUE
C                                  DETERMINE THE PROGRESS OF THE
C                                  ITERATION.
      NSLOW1 = NSLOW1+1
      IF (ACTRED.GE.P001) NSLOW1 = 0
      IF (JEVAL) NSLOW2 = NSLOW2+1
      IF (ACTRED.GE.P1) NSLOW2 = 0
C                                  TEST FOR CONVERGENCE.
      IF (DELTA.LE.XTOL*XNORM .OR. FNORM.EQ.ZERO) INFO = 1
      IF (INFO.NE.0) GO TO 150
C                                  TESTS FOR TERMINATION AND STRINGENT
C                                  TOLERANCES.
      IF (NFEV.GE.MAXFEV) INFO = 2
      IF (P1*DMAX1(P1*DELTA,PNORM).LE.EPSMCH*XNORM) INFO = 3
      IF (NSLOW2.EQ.5) INFO = 4
      IF (NSLOW1.EQ.10) INFO = 5
      IF (INFO.NE.0) GO TO 150
C                                  CRITERION FOR RECALCULATING JACOBIAN
C                                  APPROXIMATION BY FORWARD DIFFERENCES.
      IF (NCFAIL.EQ.2) GO TO 145
C                                  CALCULATE THE RANK ONE MODIFICATION
C                                  TO THE JACOBIAN AND UPDATE QTF IF
C                                  NECESSARY.
      DO 140 J=1,N
         SUM = ZERO
         DO 135 I=1,N
            SUM = SUM+FJAC(I,J)*WA4(I)
  135    CONTINUE
         WA2(J) = (SUM-WA3(J))/PNORM
         WA1(J) = DIAG(J)*((DIAG(J)*WA1(J))/PNORM)
         IF (RATIO.GE.P0001) QTF(J) = SUM
  140 CONTINUE
C                                  COMPUTE THE QR FACTORIZATION OF THE
C                                  UPDATED JACOBIAN.
      CALL ZSPWE(N,N,R,LR,WA1,WA2,WA3,SING)
      CALL ZSPWD(N,N,FJAC,LDFJAC,WA2,WA3)
      CALL ZSPWD(1,N,QTF,1,WA2,WA3)
C                                  END OF THE INNER LOOP.
      JEVAL = .FALSE.
      GO TO 90
  145 CONTINUE
C                                  END OF THE OUTER LOOP.
      GO TO 15
  150 CONTINUE
C                                  TERMINATION, EITHER NORMAL OR USER
C                                  IMPOSED.
      IF (IFLAG.LT.0) INFO = IFLAG
      IFLAG = 0
      RETURN
      END
      SUBROUTINE ZSPWB (FCN,N,X,FVEC,FJAC,LDFJAC,IFLAG,ML,MU,EPSFCN,WA1,
     *                   WA2,PAR)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            N,LDFJAC,IFLAG,ML,MU
      DOUBLE PRECISION   X(N),FVEC(N),FJAC(LDFJAC,N),EPSFCN,WA1(N),
     *                   WA2(N),PAR(1)
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            I,J,K,MSUM
      DOUBLE PRECISION   EPSMCH,EPS,H,SPMPAR,TEMP,ZERO
      DATA               SPMPAR /0.222045D-15/
      DATA               ZERO /0.0D0/
C                                  EPSMCH IS THE MACHINE PRECISION.
C                                  FIRST EXECUTABLE STATEMENT
      EPSMCH = SPMPAR
      EPS = DSQRT(DMAX1(EPSFCN,EPSMCH))
      MSUM = ML+MU+1
      IF (MSUM.LT.N) GO TO 20
C                                  COMPUTATION OF DENSE APPROXIMATE
C                                  JACOBIAN.
      DO 10 J=1,N
         TEMP = X(J)
         H = EPS*DABS(TEMP)
         IF (H.EQ.ZERO) H = EPS
         X(J) = TEMP+H
         CALL FCN(X,WA1,N,PAR)
         IF (IFLAG.LT.0) GO TO 15
         X(J) = TEMP
         DO 5 I=1,N
            FJAC(I,J) = (WA1(I)-FVEC(I))/H
    5    CONTINUE
   10 CONTINUE
   15 CONTINUE
      GO TO 50
   20 CONTINUE
C                                  COMPUTATION OF BANDED APPROXIMATE
C                                  JACOBIAN.
      DO 40 K=1,MSUM
         DO 25 J=K,N,MSUM
            WA2(J) = X(J)
            H = EPS*DABS(WA2(J))
            IF (H.EQ.ZERO) H = EPS
            X(J) = WA2(J)+H
   25    CONTINUE
         CALL FCN(X,WA1,N,PAR)
         IF (IFLAG.LT.0) GO TO 45
         DO 35 J=K,N,MSUM
            X(J) = WA2(J)
            H = EPS*DABS(WA2(J))
            IF (H.EQ.ZERO) H = EPS
            DO 30 I=1,N
               FJAC(I,J) = ZERO
               IF (I.GE.J-MU .AND. I.LE.J+ML) FJAC(I,J) =
     *         (WA1(I)-FVEC(I))/H
   30       CONTINUE
   35    CONTINUE
   40 CONTINUE
   45 CONTINUE
   50 CONTINUE
      RETURN
      END
      SUBROUTINE ZSPWC (N,R,LR,DIAG,QTB,DELTA,X,WA1,WA2)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            N,LR
      DOUBLE PRECISION   R(LR),DIAG(N),QTB(N),DELTA,X(N),WA1(N),WA2(N)
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            I,JJ,JP1,J,K,L
      DOUBLE PRECISION   ALPHA,BNORM,EPSMCH,GNORM,ONE,QNORM,SGNORM,
     *                   SPMPAR,SUM,TEMP,ZERO
      DOUBLE PRECISION   DNRM2
      DATA               SPMPAR /0.222045D-15/
      DATA               ONE,ZERO /1.0D0,0.0D0/
C                                  EPSMCH IS THE MACHINE PRECISION.
C                                  FIRST EXECUTABLE STATEMENT
      EPSMCH = SPMPAR
C                                  FIRST, CALCULATE THE GAUSS-NEWTON
C                                  DIRECTION.
      JJ = (N*(N+1))/2+1
      DO 25 K=1,N
         J = N-K+1
         JP1 = J+1
         JJ = JJ-K
         L = JJ+1
         SUM = ZERO
         IF (N.LT.JP1) GO TO 10
         DO 5 I=JP1,N
            SUM = SUM+R(L)*X(I)
            L = L+1
    5    CONTINUE
   10    CONTINUE
         TEMP = R(JJ)
         IF (TEMP.NE.ZERO) GO TO 20
         L = J
         DO 15 I=1,J
            TEMP = DMAX1(TEMP,DABS(R(L)))
            L = L+N-I
   15    CONTINUE
         TEMP = EPSMCH*TEMP
         IF (TEMP.EQ.ZERO) TEMP = EPSMCH
   20    CONTINUE
         X(J) = (QTB(J)-SUM)/TEMP
   25 CONTINUE
C                                  TEST WHETHER THE GAUSS-NEWTON
C                                  DIRECTION IS ACCEPTABLE.
      DO 30 J=1,N
         WA1(J) = ZERO
         WA2(J) = DIAG(J)*X(J)
   30 CONTINUE
      QNORM = DNRM2(N,WA2,1)
      IF (QNORM.LE.DELTA) GO TO 70
C                                  THE GAUSS-NEWTON DIRECTION IS NOT
C                                  ACCEPTABLE. NEXT, CALCULATE THE
C                                  SCALED GRADIENT DIRECTION.
      L = 1
      DO 40 J=1,N
         TEMP = QTB(J)
         DO 35 I=J,N
            WA1(I) = WA1(I)+R(L)*TEMP
            L = L+1
   35    CONTINUE
         WA1(J) = WA1(J)/DIAG(J)
   40 CONTINUE
C                                  CALCULATE THE NORM OF THE SCALED
C                                  GRADIENT AND TEST FOR THE SPECIAL
C                                  CASE IN WHICH THE SCALED GRADIENT IS
C                                  ZERO.
      GNORM = DNRM2(N,WA1,1)
      SGNORM = ZERO
      ALPHA = DELTA/QNORM
      IF (GNORM.EQ.ZERO) GO TO 60
C                                  CALCULATE THE POINT ALONG THE SCALED
C                                  GRADIENT AT WHICH THE QUADRATIC IS
C                                  MINIMIZED.
      DO 45 J=1,N
         WA1(J) = (WA1(J)/GNORM)/DIAG(J)
   45 CONTINUE
      L = 1
      DO 55 J=1,N
         SUM = ZERO
         DO 50 I=J,N
            SUM = SUM+R(L)*WA1(I)
            L = L+1
   50    CONTINUE
         WA2(J) = SUM
   55 CONTINUE
      TEMP = DNRM2(N,WA2,1)
      SGNORM = (GNORM/TEMP)/TEMP
C                                  TEST WHETHER THE SCALED GRADIENT
C                                  DIRECTION IS ACCEPTABLE.
      ALPHA = ZERO
      IF (SGNORM.GE.DELTA) GO TO 60
C                                  THE SCALED GRADIENT DIRECTION IS NOT
C                                  ACCEPTABLE. FINALLY, CALCULATE THE
C                                  POINT ALONG THE DOGLEG AT WHICH THE
C                                  QUADRATIC IS MINIMIZED.
      BNORM = DNRM2(N,QTB,1)
      TEMP = (BNORM/GNORM)*(BNORM/QNORM)*(SGNORM/DELTA)
      TEMP = TEMP-(DELTA/QNORM)*(SGNORM/DELTA)**2+DSQRT((TEMP-(DELTA
     */QNORM))**2+(ONE-(DELTA/QNORM)**2)*(ONE-(SGNORM/DELTA)**2))
      ALPHA = ((DELTA/QNORM)*(ONE-(SGNORM/DELTA)**2))/TEMP
   60 CONTINUE
C                                  FORM APPROPRIATE CONVEX COMBINATION
C                                  OF THE GAUSS-NEWTON DIRECTION AND THE
C                                  SCALED GRADIENT DIRECTION.
      TEMP = (ONE-ALPHA)*DMIN1(SGNORM,DELTA)
      DO 65 J=1,N
         X(J) = TEMP*WA1(J)+ALPHA*X(J)
   65 CONTINUE
   70 CONTINUE
      RETURN
      END
      SUBROUTINE ZSPWD (M,N,A,LDA,V,W)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            M,N,LDA
      DOUBLE PRECISION   A(LDA,N),V(N),W(N)
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            I,J,NM1,NMJ
      DOUBLE PRECISION   TEMP1,ONE,TEMP2,TEMP
      DATA               ONE /1.0D0/
C                                  APPLY THE FIRST SET OF GIVENS
C                                  ROTATIONS TO A.
C                                  FIRST EXECUTABLE STATEMENT
      NM1 = N-1
      IF (NM1.LT.1) GO TO 25
      DO 10 NMJ=1,NM1
         J = N-NMJ
         IF (DABS(V(J)).GT.ONE) TEMP1 = ONE/V(J)
         IF (DABS(V(J)).GT.ONE) TEMP2 = DSQRT(ONE-TEMP1**2)
         IF (DABS(V(J)).LE.ONE) TEMP2 = V(J)
         IF (DABS(V(J)).LE.ONE) TEMP1 = DSQRT(ONE-TEMP2**2)
         DO 5 I=1,M
            TEMP = TEMP1*A(I,J)-TEMP2*A(I,N)
            A(I,N) = TEMP2*A(I,J)+TEMP1*A(I,N)
            A(I,J) = TEMP
    5    CONTINUE
   10 CONTINUE
C                                  APPLY THE SECOND SET OF GIVENS
C                                  ROTATIONS TO A.
      DO 20 J=1,NM1
         IF (DABS(W(J)).GT.ONE) TEMP1 = ONE/W(J)
         IF (DABS(W(J)).GT.ONE) TEMP2 = DSQRT(ONE-TEMP1**2)
         IF (DABS(W(J)).LE.ONE) TEMP2 = W(J)
         IF (DABS(W(J)).LE.ONE) TEMP1 = DSQRT(ONE-TEMP2**2)
         DO 15 I=1,M
            TEMP = TEMP1*A(I,J)+TEMP2*A(I,N)
            A(I,N) = -TEMP2*A(I,J)+TEMP1*A(I,N)
            A(I,J) = TEMP
   15    CONTINUE
   20 CONTINUE
   25 CONTINUE
      RETURN
      END
      SUBROUTINE ZSPWE (M,N,S,LS,U,V,W,SING)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            M,N,LS
      DOUBLE PRECISION   S(LS),U(M),V(N),W(M)
      LOGICAL            SING
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            I,JJ,J,L,NM1,NMJ
      DOUBLE PRECISION   TEMP1,TEMP2,GIANT,ONE,P25,P5,TEMP3,SPMPAR,
     *                   TEMP4,TAU,TEMP,ZERO
      DATA               GIANT /0.7237005577D+76/
      DATA               ONE,P5,P25,ZERO /1.0D0,5.0D-1,2.5D-1,0.0D0/
C                                  INITIALIZE THE DIAGONAL ELEMENT
C                                  POINTER.
C                                  FIRST EXECUTABLE STATEMENT
      JJ = (N*(2*M-N+1))/2-(M-N)
C                                  MOVE THE NONTRIVIAL PART OF THE LAST
C                                  COLUMN OF S INTO W.
      L = JJ
      DO 5 I=N,M
         W(I) = S(L)
         L = L+1
    5 CONTINUE
C                                  ROTATE THE VECTOR V INTO A MULTIPLE
C                                  OF THE N-TH UNIT VECTOR IN SUCH A WAY
C                                  THAT A SPIKE IS INTRODUCED INTO W.
      NM1 = N-1
      IF (NM1.LT.1) GO TO 35
      DO 30 NMJ=1,NM1
         J = N-NMJ
         JJ = JJ-(M-J+1)
         W(J) = ZERO
         IF (V(J).EQ.ZERO) GO TO 25
C                                  DETERMINE A GIVENS ROTATION WHICH
C                                  ELIMINATES THE J-TH ELEMENT OF V.
         IF (DABS(V(N)).GE.DABS(V(J))) GO TO 10
         TEMP2 = V(N)/V(J)
         TEMP3 = P5/DSQRT(P25+P25*TEMP2**2)
         TEMP1 = TEMP3*TEMP2
         TAU = ONE
         IF (DABS(TEMP1)*GIANT.GT.ONE) TAU = ONE/TEMP1
         GO TO 15
   10    CONTINUE
         TEMP4 = V(J)/V(N)
         TEMP1 = P5/DSQRT(P25+P25*TEMP4**2)
         TEMP3 = TEMP1*TEMP4
         TAU = TEMP3
   15    CONTINUE
C                                  APPLY THE TRANSFORMATION TO V AND
C                                  STORE THE INFORMATION NECESSARY TO
C                                  RECOVER THE GIVENS ROTATION.
         V(N) = TEMP3*V(J)+TEMP1*V(N)
         V(J) = TAU
C                                  APPLY THE TRANSFORMATION TO S AND
C                                  EXTEND THE SPIKE IN W.
         L = JJ
         DO 20 I=J,M
            TEMP = TEMP1*S(L)-TEMP3*W(I)
            W(I) = TEMP3*S(L)+TEMP1*W(I)
            S(L) = TEMP
            L = L+1
   20    CONTINUE
   25    CONTINUE
   30 CONTINUE
   35 CONTINUE
C                                  ADD THE SPIKE FROM THE RANK 1 UPDATE
C                                  TO W.
      DO 40 I=1,M
         W(I) = W(I)+V(N)*U(I)
   40 CONTINUE
C                                  ELIMINATE THE SPIKE.
      SING = .FALSE.
      IF (NM1.LT.1) GO TO 70
      DO 65 J=1,NM1
         IF (W(J).EQ.ZERO) GO TO 60
C                                  DETERMINE A GIVENS ROTATION WHICH
C                                  ELIMINATES THE J-TH ELEMENT OF THE
C                                  SPIKE.
         IF (DABS(S(JJ)).GE.DABS(W(J))) GO TO 45
         TEMP2 = S(JJ)/W(J)
         TEMP3 = P5/DSQRT(P25+P25*TEMP2**2)
         TEMP1 = TEMP3*TEMP2
         TAU = ONE
         IF (DABS(TEMP1)*GIANT.GT.ONE) TAU = ONE/TEMP1
         GO TO 50
   45    CONTINUE
         TEMP4 = W(J)/S(JJ)
         TEMP1 = P5/DSQRT(P25+P25*TEMP4**2)
         TEMP3 = TEMP1*TEMP4
         TAU = TEMP3
   50    CONTINUE
C                                  APPLY THE TRANSFORMATION TO S AND
C                                  REDUCE THE SPIKE IN W.
         L = JJ
         DO 55 I=J,M
            TEMP = TEMP1*S(L)+TEMP3*W(I)
            W(I) = -TEMP3*S(L)+TEMP1*W(I)
            S(L) = TEMP
            L = L+1
   55    CONTINUE
C                                  STORE THE INFORMATION NECESSARY TO
C                                  RECOVER THE GIVENS ROTATION.
         W(J) = TAU
   60    CONTINUE
C                                  TEST FOR ZERO DIAGONAL ELEMENTS IN
C                                  THE OUTPUT S.
         IF (S(JJ).EQ.ZERO) SING = .TRUE.
         JJ = JJ+(M-J+1)
   65 CONTINUE
   70 CONTINUE
C                                  MOVE W BACK INTO THE LAST COLUMN OF
C                                  THE OUTPUT S.
      L = JJ
      DO 75 I=N,M
         S(L) = W(I)
         L = L+1
   75 CONTINUE
      IF (S(JJ).EQ.ZERO) SING = .TRUE.
      RETURN
      END
      SUBROUTINE ZSPWF (M,N,Q,LDQ,WA)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            M,N,LDQ
      DOUBLE PRECISION   Q(LDQ,M),WA(M)
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            I,JM1,J,K,L,MINMN,NP1
      DOUBLE PRECISION   ONE,SUM,TEMP,ZERO
      DATA               ONE,ZERO /1.0D0,0.0D0/
C                                  ZERO OUT UPPER TRIANGLE OF Q IN THE
C                                  FIRST MIN(M,N) COLUMNS.
C                                  FIRST EXECUTABLE STATEMENT
      MINMN = MIN0(M,N)
      IF (MINMN.LT.2) GO TO 15
      DO 10 J=2,MINMN
         JM1 = J-1
         DO 5 I=1,JM1
            Q(I,J) = ZERO
    5    CONTINUE
   10 CONTINUE
   15 CONTINUE
C                                  INITIALIZE REMAINING COLUMNS TO THOSE
C                                  OF THE IDENTITY MATRIX.
      NP1 = N+1
      IF (M.LT.NP1) GO TO 30
      DO 25 J=NP1,M
         DO 20 I=1,M
            Q(I,J) = ZERO
   20    CONTINUE
         Q(J,J) = ONE
   25 CONTINUE
   30 CONTINUE
C                                  ACCUMULATE Q FROM ITS FACTORED FORM.
      DO 60 L=1,MINMN
         K = MINMN-L+1
         DO 35 I=K,M
            WA(I) = Q(I,K)
            Q(I,K) = ZERO
   35    CONTINUE
         Q(K,K) = ONE
         IF (WA(K).EQ.ZERO) GO TO 55
         DO 50 J=K,M
            SUM = ZERO
            DO 40 I=K,M
               SUM = SUM+Q(I,J)*WA(I)
   40       CONTINUE
            TEMP = SUM/WA(K)
            DO 45 I=K,M
               Q(I,J) = Q(I,J)-TEMP*WA(I)
   45       CONTINUE
   50    CONTINUE
   55    CONTINUE
   60 CONTINUE
      RETURN
      END
      SUBROUTINE ZSPWG (M,N,A,LDA,PIVOT,IPVT,LIPVT,RDIAG,ACNORM,WA)
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            M,N,LDA,LIPVT,IPVT(LIPVT)
      DOUBLE PRECISION   A(LDA,N),RDIAG(N),ACNORM(N),WA(N)
      LOGICAL            PIVOT
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            I,JP1,J,KMAX,K,MINMN
      DOUBLE PRECISION   AJNORM,EPSMCH,ONE,P05,SPMPAR,SUM,TEMP,ZERO
      DOUBLE PRECISION   DNRM2
      DATA               SPMPAR /0.222045D-15/
      DATA               ONE,P05,ZERO /1.0D0,5.0D-2,0.0D0/
C                                  EPSMCH IS THE MACHINE PRECISION.
C                                  FIRST EXECUTABLE STATEMENT
      EPSMCH = SPMPAR
C                                  COMPUTE THE INITIAL COLUMN NORMS AND
C                                  INITIALIZE SEVERAL ARRAYS.
      DO 5 J=1,N
         ACNORM(J) = DNRM2(M,A(1,J),1)
         RDIAG(J) = ACNORM(J)
         WA(J) = RDIAG(J)
         IF (PIVOT) IPVT(J) = J
    5 CONTINUE
C                                  REDUCE A TO R WITH HOUSEHOLDER
C                                  TRANSFORMATIONS.
      MINMN = MIN0(M,N)
      DO 55 J=1,MINMN
         IF (.NOT.PIVOT) GO TO 20
C                                  BRING THE COLUMN OF LARGEST NORM INTO
C                                  THE PIVOT POSITION.
         KMAX = J
         DO 10 K=J,N
            IF (RDIAG(K).GT.RDIAG(KMAX)) KMAX = K
   10    CONTINUE
         IF (KMAX.EQ.J) GO TO 20
         DO 15 I=1,M
            TEMP = A(I,J)
            A(I,J) = A(I,KMAX)
            A(I,KMAX) = TEMP
   15    CONTINUE
         RDIAG(KMAX) = RDIAG(J)
         WA(KMAX) = WA(J)
         K = IPVT(J)
         IPVT(J) = IPVT(KMAX)
         IPVT(KMAX) = K
   20    CONTINUE
C                                  COMPUTE THE HOUSEHOLDER
C                                  TRANSFORMATION TO REDUCE THE J-TH
C                                  COLUMN OF A TO A MULTIPLE OF THE J-TH
C                                  UNIT VECTOR.
         AJNORM = DNRM2(M-J+1,A(J,J),1)
         IF (AJNORM.EQ.ZERO) GO TO 50
         IF (A(J,J).LT.ZERO) AJNORM = -AJNORM
         DO 25 I=J,M
            A(I,J) = A(I,J)/AJNORM
   25    CONTINUE
         A(J,J) = A(J,J)+ONE
C                                  APPLY THE TRANSFORMATION TO THE
C                                  REMAINING COLUMNS AND UPDATE THE
C                                  NORMS.
         JP1 = J+1
         IF (N.LT.JP1) GO TO 50
         DO 45 K=JP1,N
            SUM = ZERO
            DO 30 I=J,M
               SUM = SUM+A(I,J)*A(I,K)
   30       CONTINUE
            TEMP = SUM/A(J,J)
            DO 35 I=J,M
               A(I,K) = A(I,K)-TEMP*A(I,J)
   35       CONTINUE
            IF (.NOT.PIVOT .OR. RDIAG(K).EQ.ZERO) GO TO 40
            TEMP = A(J,K)/RDIAG(K)
            RDIAG(K) = RDIAG(K)*DSQRT(DMAX1(ZERO,ONE-TEMP**2))
            IF (P05*(RDIAG(K)/WA(K))**2.GT.EPSMCH) GO TO 40
            RDIAG(K) = DNRM2(M-J,A(JP1,K),1)
            WA(K) = RDIAG(K)
   40       CONTINUE
   45    CONTINUE
   50    CONTINUE
         RDIAG(J) = -AJNORM
   55 CONTINUE
      RETURN
      END
      DOUBLE PRECISION FUNCTION DNRM2 (N,DX,INCX)
C
C-----------------------------------------------------------------------
C
C   PURPOSE             - COMPUTE THE EUCLIDEAN LENGTH OR L2 NORM
C                           OF A DOUBLE PRECISION VECTOR
C
C   USAGE               - FUNCTION DNRM2 (N,DX,INCX)
C
C   ARGUMENTS    DNRM2  - DOUBLE PRECISION SQUARE ROOT OF THE SUM FROM
C                           I=1 TO N OF X(I)**2. (OUTPUT)
C                           X(I) REFERS TO A SPECIFIC ELEMENT OF DX.
C                           SEE INCX ARGUMENT DESCRIPTION.
C                N      - LENGTH OF VECTOR X. (INPUT)
C                DX     - DOUBLE PRECISION VECTOR OF LENGTH N*INCX.
C                           (INPUT)
C                INCX   - DISPLACEMENT BETWEEN ELEMENTS OF DX. (INPUT)
C                           X(I) IS DEFINED TO BE DX(1+(I-1)*INCX).
C                           INCX MUST BE GREATER THAN ZERO.
C
C-----------------------------------------------------------------------
C                                  SPECIFICATIONS FOR ARGUMENTS
      INTEGER            N,INCX
      DOUBLE PRECISION   DX(1)
C                                  SPECIFICATIONS FOR LOCAL VARIABLES
      INTEGER            I,J,NEXT,NN
      DOUBLE PRECISION   CUTLO,CUTHI,SUM,XMAX,ZERO,ONE,HITEST
      DATA               ZERO, ONE /0.0D0, 1.0D0/
      DATA               CUTLO, CUTHI / 8.232D-11,  1.304D19 /
C                                  FIRST EXECUTABLE STATEMENT
      IF (N.GT.0) GO TO 5
      DNRM2 = ZERO
      GO TO 70
C
    5 ASSIGN 15 TO NEXT
      SUM = ZERO
      NN = N*INCX
C                                  BEGIN MAIN LOOP
      I = 1
   10 GO TO NEXT, (15,20,35,40)
   15 IF (DABS(DX(I)).GT.CUTLO) GO TO 55
      ASSIGN 20 TO NEXT
      XMAX = ZERO
C                                  PHASE 1. SUM IS ZERO
   20 IF (DX(I).EQ.ZERO) GO TO 65
      IF (DABS(DX(I)).GT.CUTLO) GO TO 55
C                                  PREPARE FOR PHASE 2.
      ASSIGN 35 TO NEXT
      GO TO 30
C                                  PREPARE FOR PHASE 4.
   25 I = J
      ASSIGN 40 TO NEXT
      SUM = (SUM/DX(I))/DX(I)
   30 XMAX = DABS(DX(I))
      GO TO 45
C                                  PHASE 2. SUM IS SMALL. SCALE TO
C                                    AVOID DESTRUCTIVE UNDERFLOW.
   35 IF (DABS(DX(I)).GT.CUTLO) GO TO 50
C                                  COMMON CODE FOR PHASES 2 AND 4. IN
C                                    PHASE 4 SUM IS LARGE. SCALE TO
C                                    AVOID OVERFLOW.
   40 IF (DABS(DX(I)).LE.XMAX) GO TO 45
      SUM = ONE+SUM*(XMAX/DX(I))**2
      XMAX = DABS(DX(I))
      GO TO 65
C
   45 SUM = SUM+(DX(I)/XMAX)**2
      GO TO 65
C                                  PREPARE FOR PHASE 3.
   50 SUM = (SUM*XMAX)*XMAX
C                                  FOR REAL OR D.P. SET HITEST =
C                                    CUTHI/N FOR COMPLEX SET HITEST =
C                                    CUTHI/(2*N)
   55 HITEST = CUTHI/FLOAT(N)
C                                  PHASE 3. SUM IS MID-RANGE. NO
C                                    SCALING.
      DO 60 J=I,NN,INCX
         IF (DABS(DX(J)).GE.HITEST) GO TO 25
   60 SUM = SUM+DX(J)**2
      DNRM2 = DSQRT(SUM)
      GO TO 70
C
   65 CONTINUE
      I = I+INCX
      IF (I.LE.NN) GO TO 10
C                                  END OF MAIN LOOP. COMPUTE SQUARE
C                                    ROOT AND ADJUST FOR SCALING.
      DNRM2 = XMAX*DSQRT(SUM)
   70 CONTINUE
      RETURN
      END

      SUBROUTINE MATINV (A,NDM,N)
         IMPLICIT REAL*8 (A-H,O-Z)
*
*
************************************************************************
*                                                                      *
*        SUBROUTINE FOR INVERSION OF A GENERAL-REAL MATRIX.            *
*        MODIFIED BY A.S. UMAR                                         *
*                                                                      *
*        A - ON OUTPUT CONTAINS THE INVERSE MATRIX                     *
*        NDM - THE MAXIMUM DIMENSION OF A IN THE CALLING ROUTINE       *
*        N - THE ACTUAL DIMENSION USED IN CALCULATIONS (N<=NDM)        *
*                                                                      *
************************************************************************
*
*
         DIMENSION A(NDM,NDM),PIVOT(1000),INDEX(1000)
*
*        INITIALIZE PIVOT ELEMENT ARRAY
*
         DO 20 I=1,N
         PIVOT(I)=0.0D0
   20    INDEX(I)=0
*
*        PERFORM SUCCESSIVE PIVOT OPERATIONS (GRAND LOOP)
*
         DO 550 I=1,N
*
*        SEARCH FOR PIVOT ELEMENT
*
         AMAX=0.0D0
         DO 105 J=1,N
         IF (PIVOT(J).NE.0.0) GO TO 105
         DO 100 K=1,N
         IF (PIVOT(K).NE.0.0) GO TO 100
         TEMP=DABS(A(J,K))
         IF (TEMP.LT.AMAX) GO TO 100
         IROW=J
         ICOLUM=K
         AMAX=TEMP
  100    CONTINUE
  105    CONTINUE
         INDEX(I)=4096*IROW+ICOLUM
         J=IROW
         AMAX=A(J,ICOLUM)
         PIVOT(ICOLUM)=AMAX
*
*        INTERCHANGE ROWS TO PUT PIVOT ELEMENT ON DIAGONAL
*
         IF (IROW.EQ.ICOLUM) GO TO 260
         DO 200 K=1,N
         SWAP=A(J,K)
         A(J,K)=A(ICOLUM,K)
         A(ICOLUM,K)=SWAP
  200    CONTINUE
*
*        DIVIDE PIVOT ROW BY PIVOT ELEMENT
*
  260    K=ICOLUM
         A(ICOLUM,K)=1.0D0
         DO 350 K=1,N
         A(ICOLUM,K)=A(ICOLUM,K)/AMAX
  350    CONTINUE
*
*        REDUCE NON-PIVOT ROWS
*
         DO 550 J=1,N
         IF (J.EQ.ICOLUM) GO TO 550
         T=A( J,ICOLUM)
         A( J,ICOLUM)=0.0D0
         DO 450 K=1,N
         A( J,K)=A( J,K)-A(ICOLUM,K)*T
  450    CONTINUE
  550    CONTINUE
*
*     INTERCHANGE COLUMNS AFTER ALL PIVOT OPERATIONS HAVE BEEN PERFORMED
*
         DO 710 I=1,N
         I1=N+1-I
         K=INDEX(I1)/4096
         ICOLUM=INDEX(I1)-4096*K
         IF (K.EQ.ICOLUM) GO TO 710
         DO 705 J=1,N
         SWAP=A(J,K)
         A(J,K)=A(J,ICOLUM)
         A(J,ICOLUM)=SWAP
  705    CONTINUE
  710    CONTINUE
         RETURN
         END