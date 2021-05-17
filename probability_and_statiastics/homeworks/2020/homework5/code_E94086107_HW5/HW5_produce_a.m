function[A]=HW5_produce_a(P)
A=eye(35,1);
c=1;
for i=1:7;
    for j=0:i;
        if j==0
            A(c,1)=HW5_1_a(j,i,P);
        else
            A(c,1)=A(c-1,1)+HW5_1_a(j,i,P);
        end
        c=c+1;
    end
end
end