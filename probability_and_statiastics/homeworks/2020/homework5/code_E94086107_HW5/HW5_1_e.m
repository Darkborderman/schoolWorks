n=10000;
p1=0.01;
p2=0.1;
p3=0.2;
p4=0.5;
x=0:n;

mu1=n*p1;
a=binopdf(x,n,p1);
b=poisspdf(x,mu1);
figure
bar(x,a)
hold on
bar(x,b)
hold off
xlabel('Observation')
ylabel('Probability')
title('n=10000,p=0.01')
legend('Binomial Distribution','Poisson Distribution','location','northeast')

mu2=n*p2;
c=binopdf(x,n,p2);
d=poisspdf(x,mu2);
figure
bar(x,c)
hold on
bar(x,d)
hold off
xlabel('Observation')
ylabel('Probability')
title('n=10000,p=0.1')
legend('Binomial Distribution','Poisson Distribution','location','northeast')


mu3=n*p3;
e=binopdf(x,n,p3);
f=poisspdf(x,mu3);
figure
bar(x,e)
hold on
bar(x,f)
hold off
xlabel('Observation')
ylabel('Probability')
title('n=10000,p=0.2')
legend('Binomial Distribution','Poisson Distribution','location','northeast')


mu4=n*p4;
g=binopdf(x,n,p4);
h=poisspdf(x,mu4);
figure
bar(x,g)
hold on
bar(x,h)
hold off
xlabel('Observation')
ylabel('Probability')
title('n=10000,p=0.5')
legend('Binomial Distribution','Poisson Distribution','location','northeast')

