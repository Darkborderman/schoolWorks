function[X]=HW5_2_bfun
n=rand;%先隨機產生一個0-1之間的數，再依據其存在區間來分配X值
if n<0.04%因為X=1的機率為0.04，所以若是值小於0.04，X=1
    X=1;
end
if 0.04<=n&&n<0.1%因為X=2的機率為0.06，所以若是值介於於0.04到0.1，X=2，以下同理
    X=2;
end
if n>=0.1&&n<0.17
        X=3;
end
if n>=0.17&&n<0.25
        X=4;
end
if n>=0.25&&n<0.33
        X=5;
end
if n>=0.33&&n<0.4
        X=6;
end
if n>=0.4&&n<0.47
        X=7;
end
if n>=0.47&&n<0.53
        X=8;
end
 if n>=0.53&&n<0.58
        X=9;
 end
if n>=0.58&&n<0.61
        X=10;
end
if n>=0.61&&n<0.67
        X=11;
end
if n>=0.67&&n<0.79
        X=12;
end
if n>=0.79&&n<0.89
        X=13;
end
if n>0.89
        X=14;
end
end