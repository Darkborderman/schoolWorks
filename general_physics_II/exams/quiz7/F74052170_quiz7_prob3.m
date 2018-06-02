%prob3a
figure(3);
a=0.5;
b=0.001;
c=0.4;
A=0.02;
R=0.004;
h=10^(-2);
rabbit=100;
for t=0:h:20
    plot(t,rabbit);
    hold on;
    rabbit_rate = (a*rabbit-b*(rabbit^2));
    rabbit = rabbit + rabbit_rate*h;
end
title('prob3-a');
fprintf(1,'prob3-a : 兔子的死亡和出生數量平衡，所以不再增加和減少\n');
clear all;

%prob3b
figure(4);
a=0.5;
b=0.001;
c=0.4;
A=0.02;
R=0.004;
h=10^(-2);
w=100;
for t=0:h:20
    plot(t,w);
    hold on;
    w_rate = -c*w;
    w=w+w_rate*h;
end
title('prob3-b');
fprintf(1,'prob3-b : 狼沒有食物所以死光了\n');
clear all;

%prob3c
figure(5);
a=0.5;
b=0.001;
c=0.4;
A=0.02;
R=0.004;
h=10^(-2);
rb=100;
w=6;
for t=0:h:70
    plot(t,rb,t,w);
    hold on;
    rb_rate = (a*rb-b*(rb^2))-A*rb*w;
    w_rate=(-c*w)+(R*rb*w);
    rb = rb + rb_rate*h;
    w = w + w_rate*h;
end
title('prob3-c');
fprintf(1,'prob3-c : 狼吃兔子，兔子變少，狼變多，當狼過多食物不足時，又變少，兔子因為狼變少而多，依這個循環最後兩邊都趨近平衡\n');
fprintf(1,'prob3-c :　stable\n');
clear all;

%prob3d
figure(6);
a=0.5;
b=0.001;
c=0.4;
A=0.02;
R=0.004;
h=10^(-2);
rb=100;
w=600;
for t=0:h:200
    plot(t,rb,t,w);
    hold on;
    rb_rate = (a*rb-b*(rb^2))-A*rb*w;
    w_rate=(-c*w)+(R*rb*w);
    rb = rb + rb_rate*h;
    w = w + w_rate*h;
end
title('prob3-d');
fprintf(1,'prob3-d :　一開始因為狼過多，食物不夠，所以急速變少，而兔子因為狼變極少，而迅速增多，依這個循環，最後數量都趨近平衡\n');
clear all;
