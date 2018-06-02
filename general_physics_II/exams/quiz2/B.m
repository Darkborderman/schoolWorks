function  ans = B ( n,x )
ans=0;
x=x*(-1);
for k= 1 : n
    K=1;
    for i = 1 : k
        K=K*i;
    end
    ans=ans+x^k/K;
end
end

