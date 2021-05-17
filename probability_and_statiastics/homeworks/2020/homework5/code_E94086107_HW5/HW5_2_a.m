x=1:1:14;
y=[0.04,0.06,0.07,0.08,0.08,0.07,0.07,0.06,0.05,0.03,0.06,0.12,0.10,0.11];
bar(x,y,1)
xlim([0,15])
set(gca,'xtick',x)
title('probability distribution f(x) versus X')
xlabel('X')
ylabel('f(x)')

