#!/bin/bash
gfortran	-O3 -w  -fopenmp settings/*.f90 tools/*.f* packages/*.f* probability_of_transition_in_matter/*.f* daya_for_global_analysis/db_subroutines/*.f* reno_for_global_analysis/reno_subroutines/*.f*  main_global.f90 -L /usr/local/lib -llapack -lblas