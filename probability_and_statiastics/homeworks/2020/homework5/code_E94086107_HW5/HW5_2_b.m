y=eye(1,10000);
for i=1:10000;
    y(1,i)=HW5_2_bfun;%把funtion做10000次在畫relative frequency
end
x=1:1:14;
ncount=histc(y,x);
relativefre=ncount/length(y);
bar(x,relativefre,1)
xlim([0,15])
set(gca,'xtick',x)
title('probability distribution f(x) versus X')
xlabel('X')
ylabel('f(x)')