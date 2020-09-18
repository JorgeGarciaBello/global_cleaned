# charts
cl_68=load("db2018_cl68.dat");
cl_95=load("db2018_cl95.dat");
cl_99=load("db2018_cl99.dat");

cf_68=load("octave_sigma_M_TP_5_E_8_68.dat");
cf_95=load("octave_sigma_M_TP_5_E_8_95.dat");
cf_99=load("octave_sigma_M_TP_5_E_8_99.dat");

plot(cl_68(:,1),cl_68(:,2),'h',"markersize", 10,"linewidth",10,
     cl_95(:,1),cl_95(:,2),'h',"markersize", 10,"linewidth",10,
     cl_99(:,1),cl_99(:,2),'h',"markersize", 10,"linewidth",10,
     cf_68(:,1),cf_68(:,2),'h',"markersize", 10,"linewidth",10,
     cf_95(:,1),cf_95(:,2),'h',"markersize", 10,"linewidth",10,
     cf_99(:,1),cf_99(:,2),'h',"markersize", 10,"linewidth",10)
axis ([0.065, 0.105, 0.0022, 0.002801]); ylabel('\Deltam^{2}_{ee}');xlabel('sin^2 2\theta_{13}');
