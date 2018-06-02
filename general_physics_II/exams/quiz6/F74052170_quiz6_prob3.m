E = zeros(4,5);
E(1,:) = [3,-3,0,0,3];
E(2,:) = [-3,5,-1,-1,0];
E(3,:) = [0,-1,8,-1,0];
E(4,:) = [0,-1,-1,11,0];

%Gauss Elimination
for i = 1:1:3
    for j = i+1:1:4
        temp = zeros(1,5);
        temp = E(j,:)-(E(j,i)/E(i,i).*E(i,:));
        E(j,:) = temp;
    end
end
%Backward substitution
x = zeros(4,1);
n = 4;
x(4,1) = E(4,5)/E(4,4);
x(3,1) = (E(3,5) - E(3,4)*x(4,1))/E(3,3);
x(2,1) = (E(2,5) - E(2,4)*x(4,1) - E(2,3)*x(3,1))/E(2,2);
x(1,1) = (E(1,5) - E(1,4)*x(4,1) - E(1,3)*x(3,1) - E(1,2)*x(2,1))/E(1,1);
fprintf(1,'prob3:');
fprintf(1,'current:%.4f\n',x(1,1));
fprintf(1,'resistance:%.4f\n',30/x(1,1));

