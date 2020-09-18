x=load("db_s22t13_grid_data.dat");
y=load("db_dm_grid_data.dat");
z1=load("db_chi_matrix_db_sigma_Tpower_test_percentage_1_all_bin.dat");
z2=load("db_chi_matrix_db_sigma_Tpower_test_percentage_2_all_bin.dat");
z3=load("db_chi_matrix_db_sigma_Tpower_test_percentage_3_all_bin.dat");
z4=load("db_chi_matrix_db_sigma_Tpower_test_percentage_4_all_bin.dat");
z5=load("db_chi_matrix_db_sigma_Tpower_test_percentage_5_all_bin.dat");
z6=load("db_chi_matrix_db_sigma_Tpower_test_percentage_6_all_bin.dat");
z7=load("db_chi_matrix_db_sigma_Tpower_test_percentage_7_all_bin.dat");
z8=load("db_chi_matrix_db_sigma_Tpower_test_percentage_8_all_bin.dat");

xi=linspace(x(1),x(20),100);
yi=linspace(y(1),y(20),100);

# surf(x,y,z);
# minimo=min(min(z)) perito bonito
# [i,j]=find(z==minimo);

for i=1:100
  for j=1:100
     z1i(i,j) = interp2 (x, y, z1, xi(i), yi(j));
     z2i(i,j) = interp2 (x, y, z2, xi(i), yi(j));
     z3i(i,j) = interp2 (x, y, z3, xi(i), yi(j));
     z4i(i,j) = interp2 (x, y, z4, xi(i), yi(j));
     z5i(i,j) = interp2 (x, y, z5, xi(i), yi(j));
     z6i(i,j) = interp2 (x, y, z6, xi(i), yi(j));
     z7i(i,j) = interp2 (x, y, z7, xi(i), yi(j));
     z8i(i,j) = interp2 (x, y, z8, xi(i), yi(j));
  end
end

surf(xi,yi,zi);
k=1;
for i=1:100
  for j=1:100
    data1(k,:)=[xi(i), yi(j), z1i(i,j)];
    data2(k,:)=[xi(i), yi(j), z2i(i,j)];
    data3(k,:)=[xi(i), yi(j), z3i(i,j)];
    data4(k,:)=[xi(i), yi(j), z4i(i,j)];
    data5(k,:)=[xi(i), yi(j), z5i(i,j)];
    data6(k,:)=[xi(i), yi(j), z6i(i,j)];
    data7(k,:)=[xi(i), yi(j), z7i(i,j)];
    data8(k,:)=[xi(i), yi(j), z8i(i,j)];
    k=k+1;
  end
end

save xmgrace_data_Wtp_perc_1.dat data1
save xmgrace_data_Wtp_perc_2.dat data2
save xmgrace_data_Wtp_perc_3.dat data3
save xmgrace_data_Wtp_perc_4.dat data4
save xmgrace_data_Wtp_perc_5.dat data5
save xmgrace_data_Wtp_perc_6.dat data6
save xmgrace_data_Wtp_perc_7.dat data7
save xmgrace_data_Wtp_perc_8.dat data8

