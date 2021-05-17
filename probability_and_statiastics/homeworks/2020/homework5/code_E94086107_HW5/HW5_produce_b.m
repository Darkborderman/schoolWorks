function[B]=HW5_produce_b(U)
digits(5);
B=eye(25,1);
c=1;
for i=0:24;
        if c==1;
            B(c,1)=HW5_1_b(i,U);        
        else
            B(c,1)=B(c-1,1)+HW5_1_b(i,U);
        end
        c=c+1;
end