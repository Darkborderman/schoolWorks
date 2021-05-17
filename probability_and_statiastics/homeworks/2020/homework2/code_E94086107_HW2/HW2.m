%a
fprintf("1.(a)\n")
[A,defect]=HW2_afunction(10000,0.02);
A

%b
fprintf("1.(b)\n")
B=eye(1,1000);
for i=1:1000
    B(1,i)=HW2_aimprove(10000,0.02);
end
B
Max=max(B);
Min=min(B);
x=130:10:270;
ncount=hist(B,x);
relativefreq=ncount/length(B);
bar(x+5, relativefreq,1)
xlim([Min Max])
set(gca, 'xtick', x)
xlabel('number of defective')
ylabel('relative frequency')
%B:用來儲存A機器生產10000個1000次時的number of defective
%為了方便觀察，以10為間隔來計算relative frequency
%基本上defective會在10000*(2±0.5%內)，故將起始和結束設在130和270，稍微預防defective太大或太少
%可以從變數Max和Min看到最大和最小的 number of defective，基本上落在150~250之間(若以題目(b)的情況來看)

%c
fprintf("1.(c)\n")
P=eye(1,10);
for i=1:10
    defactB1=HW2_aimprove(30000,0.02);
    defactB2=HW2_aimprove(45000,0.03);
    defactB3=HW2_aimprove(25000,0.02);
    A=defactB1+defactB2+defactB3;
    P(1,i)=defactB3/A;
    fprintf("%.4g\n",P(1,i));
end
fprintf("P(B3|A)=%.4g",mean(P));
    