%第a小題
figure(1);
hold on;
k=0.9;
title('Electrical Field');
ylabel('y(10^5 meter)');
xlabel('x(10^5 meter)');
for x=-5:5
    for y=-4:4
        if(x<0) & (y<0) %判斷方向
            quiver(x,y,-1*k/(x^2),-1*k/(y^2),0);
        end
        if(x<0) & (y>0)
            quiver(x,y,-1*k/(x^2),1*k/(y^2),0);
        end
        if(x>0) & (y<0)
            quiver(x,y,1*k/(x^2),-1*k/(y^2),0);
        end
        if(x>0) & (y>0)
            quiver(x,y,1*k/(x^2),1*k/(y^2),0);
        end
        if(x==0) & (y<0)
            quiver(x,y,0,-1*k/(y^2),0);
        end
        if(x==0) & (y>0)
            quiver(x,y,0,1*k/(y^2),0);
        end
        if(x<0) & (y==0)
            quiver(x,y,-1*k/(x^2),0,0);
        end
        if(x>0) & (y==0)
            quiver(x,y,1*k/(x^2),0,0);
        end
    end
end
clear
%第b小題
figure(2);
hold on;
k=9*(10^9);
x=-5:0.001:5;
  y1=k*(1)./abs(x+1);%取絕對值算距離
  y2=k*(-1)./abs(x-1);
  y=y1+y2;
  plot(x,y); hold on;
clear;
%第c小題
figure(3);
hold on;
k=9*(10^9);
h=10^(-6);
x=-5:0.001:5;
%Forward Difference
  y1=((k*(1)./abs(x+h+1))-(k*(1)./abs(x+1)))./h;
  y2=((k*(-1)./abs(x+h-1))-(k*(-1)./abs(x-1)))./h;
  y=y1+y2;
  plot(x,y); hold on;
clear