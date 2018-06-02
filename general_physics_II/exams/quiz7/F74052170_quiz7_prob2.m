%t=0®É
figure(2);
y=1.5;
dy=20;
ddy=-9.8;
h=10^(-2);
for t=0:h:3
    if(t==3-h)
        fprintf(1,'prob2 : y(3)=%.6f\nprob2 : y¡¦(3)=%.6f\nprob2 : step size=%.6f\n ',y,dy,h);
    end
    plot(t,y);
    hold on;
    y_new = y+dy*h;
    dy_new = dy +ddy*h;
    y = y_new;
    dy = dy_new;
end
clear all;

