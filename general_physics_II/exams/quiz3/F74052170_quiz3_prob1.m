 figure(1);
 hold on;
 ylim([-1 1]);
for x=-1:0.001:1
y=sin(2*pi*x);
plot(x,y);
end
