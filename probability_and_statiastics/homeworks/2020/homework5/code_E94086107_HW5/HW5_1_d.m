r=eye(25,1);
c=1;
for i=0:24;
    r(c,1)=i;
    c=c+1;
end
B1=HW5_produce_b(5.5);%HW5_produce_b:以HW5_1_b為基礎做的function，可以產生r從0~24的poisson probability sums
B2=HW5_produce_b(6.0);
B3=HW5_produce_b(6.5);
B4=HW5_produce_b(7.0);
B5=HW5_produce_b(7.5);
B6=HW5_produce_b(8.0);
B7=HW5_produce_b(8.5);
B8=HW5_produce_b(9.0);
B9=HW5_produce_b(9.5);
%進行格式調整並使用for迴圈印出每一列的單一值
fprintf('                                        μ                                  \n');
fprintf('   -------------------------------------------------------------------------\n');
fprintf('r   0.55    0.60    0.65    0.70    0.75    0.80    0.85    0.90    0.95    \n');
fprintf('----------------------------------------------------------------------------\n');
for i=1:25;
    fprintf('%d\t%.4f  %.4f  %.4f  %.4f  %.4f  %.4f  %.4f  %.4f  %.4f  \n',r(i,1),B1(i,1),B2(i,1),B3(i,1),B4(i,1),B5(i,1),B6(i,1),B7(i,1),B8(i,1),B9(i,1));
    if(i==6||i==11||i==16||i==21)%換行判斷
        fprintf('\n');
    end
end