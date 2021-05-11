function[probability]=HW5_1_a(k,n,p)
c=nchoosek(n,k);
probability=c*power(p,k)*power(1-p,n-k);
end