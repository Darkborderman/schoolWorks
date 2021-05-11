function[probability]=HW5_1_b(x,t)
up=exp(-t)*power(t,x);
if x==0;
    down=1;
else
    down=prod(1:x);
end
probability=up/down;
end