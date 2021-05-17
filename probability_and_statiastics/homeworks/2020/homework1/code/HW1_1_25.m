A=[72.2,31.9,26.5,29.1,27.3,8.6,22.3,26.5,20.4,12.8,25.1,19.2,24.1,58.2,68.1,89.2,55.1,9.4,14.5,13.9,20.7,17.9,8.5,55.4,38.1,54.2,21.5,26.2,59.1,43.3];
% A:存放數據之矩陣
fprintf("sample mean=%.5g\n",mean(A));
fprintf("sample median=%.5g\n",median(A));
numIntervals = 9;
% numInterval:預計將區間分成9等分，0-10,10-20...80-90
intervalWidth = 90/numIntervals;
% intervalWidth:因為想從0-90去區分成9分，所以寬度應為90/9
x = 5:intervalWidth:95;
% x:表示要標記的x軸的數字
ncount = histc(A,x);
% ncount:數了每個區間的數目，後用做raletive frequency計算
relativefreq = ncount/length(A);
bar(x+intervalWidth/2, relativefreq,1)
xlim([min(x) max(x)])
%histogram顯示的起點與終點是x的最小值和最大值
set(gca, 'xtick', x)
xlabel('Percentage of families')
ylabel('Relative Frequency')
fprintf("trimmed mean=%.5g\n", trimmean(A,20));
%課本裡的trim 10%是前後都剪掉10%，等同於減掉該函式的20%

