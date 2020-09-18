#!/bin/bash
gfortran	-O3 -w  -fopenmp settings/*.f90 tools/*.f* daya_for_global_analysis/db_subroutines/*.f*  main_global.f90 -L /usr/local/lib -llapack -lblas