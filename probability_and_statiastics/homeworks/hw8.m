%% Problem 1
freedom=30;
bin_width=0.1;
sample_size=10^6;
xdata=0:bin_width:100;
ydata=RandSample(xdata,chi2pdf(xdata,freedom),bin_width,sample_size);
figure(1);
hold on;
subplot(2,1,1);
histogram(ydata,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,1,2);
plot(xdata,chi2pdf(xdata,freedom));
hold off;
clear all;

%% Problem 2
% case 1
xdata=0:0.1:100;
sample_size=1;
bin_width=0.1;
for i=1:!0^6
    temp1=RandSample(xdata,exppdf(xdata,10),bin_width,1);
    ydata1(i)=mean(temp1);
end
for i=1:!0^6
    temp2=RandSample(xdata,exppdf(xdata,10),bin_width,10);
    ydata2(i)=mean(temp2);
end
for i=1:!0^6
    temp3=RandSample(xdata,exppdf(xdata,10),bin_width,100);
    ydata3(i)=mean(temp3);
end

figure(2);
hold on;
subplot(2,2,1);
histogram(ydata1,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,2,2);
histogram(ydata2,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,2,3);
histogram(ydata3,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,2,4);
plot(xdata,normpdf(xdata,10,10/100^0.5));
hold off;
clear all;
% case 2
bin_width=0.1;
xdata=0:0.1:100;
for i=1:!0^6
    temp1=RandSample(xdata,normpdf(xdata,50,15),bin_width,1);
    ydata1(i)=mean(temp1);
end
for i=1:!0^6
    temp2=RandSample(xdata,normpdf(xdata,50,15),bin_width,10);
    ydata2(i)=mean(temp2);
end
for i=1:!0^6
    temp3=RandSample(xdata,normpdf(xdata,50,15),bin_width,100);
    ydata3(i)=mean(temp3);
end

figure(3);
hold on;
subplot(2,2,1);
histogram(ydata1,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,2,2);
histogram(ydata2,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,2,3);
histogram(ydata3,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,2,4);
plot(xdata,normpdf(xdata,50,15/100^0.5));
hold off;
clear;

%% 3

figure(4);
bin_width=0.1;
xdata=0:0.1:200;
ydata=normpdf(xdata,50,15);

for i=1:!0^6
    ydata1(i)=var(RandSample(xdata,ydata,0.1,5))*(5/225);
    ydata2(i)=var(RandSample(xdata,ydata,0.1,10))*(10/225);
    ydata3(i)=var(RandSample(xdata,ydata,0.1,100)*(100/225));
end

subplot(2,3,1);
histogram(ydata1,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,3,2);
histogram(ydata2,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');
subplot(2,3,3);
histogram(ydata3,'BinEdges',0-bin_width/2:bin_width:100-bin_width/2,'Normalization','pdf');

subplot(2,3,4);
ydata4=chi2pdf(xdata,4);
plot(xdata,ydata4);
subplot(2,3,5);
ydata5=chi2pdf(xdata,9);
plot(xdata,ydata5);
subplot(2,3,6);
ydata6=chi2pdf(xdata,99);
plot(xdata,ydata6);
hold off;
clear;