function x=func(p,n)
figure;
q=1-p;
average=n*p;
std_dev=sqrt(n*p*q);
r=0:10;
binomial = binopdf(r,n,p);
normal = normpdf(r,average,std_dev);
plot(r,binomial,'r',r,normal,'b');
title(['p=',num2str(p),',n=',num2str(n)]);
legend('Binomial Probabilities','Normal Approximation');
xlabel('r');
ylabel('Probability');
end
