Ms = 1.98892*(10^30);
Me = 5.97219*(10^24);
a= Me/(Ms+Me);

L1_ratio = 1-(a/3)^(1/3);
L2_ratio = 1+(a/3)^(1/3);
L3_ratio = -(1+5*a/12);
%使用絕對值取正值
fprintf(1,'The distance ratio of L1: %.6f\n', abs(L1_ratio));
fprintf(1,'The distance ratio of L2: %.5f\n', abs(L2_ratio));
fprintf(1,'The distance ratio of L3: %.5f\n', abs(L3_ratio));