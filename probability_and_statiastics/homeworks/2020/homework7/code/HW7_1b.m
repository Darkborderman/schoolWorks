%先產生X1,X2,X20
X1=HW7_1a(1);
X2=HW7_1a(2);
X20=HW7_1a(20);
%把X1 normalization化然後同時畫上相同mu和standard diviation的normal distribution
figure
histogram(X1,'Normalization', 'pdf');
hold on
x1 = [0:.01:1];
y1 = normpdf(x1,0.5,(1/12)^0.5);
plot(x1,y1)
hold off
xlabel('Random variable X1')
ylabel('Probability distribution')
title('n=1')
%對X1做的事情重複對X2做
figure
histogram(X2,'Normalization', 'pdf');
hold on
x2 = [0:.01:2];
y2 = normpdf(x2,1,(2/12)^0.5);
plot(x2,y2)
hold off
xlabel('Random variable X2')
ylabel('Probability distribution')
title('n=2')
%對X1做的事情重複對X20做
figure
histogram(X20,'Normalization', 'pdf');
hold on
x20 = [0:.01:20];
y20 = normpdf(x20,10,(20/12)^0.5);
plot(x20,y20)
hold off
xlabel('Random variable X20')
ylabel('Probability distribution')
title('n=20')
