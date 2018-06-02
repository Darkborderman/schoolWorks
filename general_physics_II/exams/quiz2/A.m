function  ans = A ( n,x )
ans=0;
for k= 1 : n
    K=1;
    for i = 1 : k
        K=K*i;
    end
    ans=ans+x^k/K;
end
end

