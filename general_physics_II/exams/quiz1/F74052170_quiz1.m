A=zeros(4,20)
for j=1:20
A(1,j)=j*2.*pi/10
A(2,j)=cos(A(1,j))
A(3,j)=sin(A(1,j))
A(4,j)=1/2^(1/2)*(A(2,j)+A(3,j))
end

for i=1:4
disp(A(i,10))
end

figure(1)
j=1:20
plot(j*2.*pi/10,cos(j*2.*pi/10))
xlabel('Time (s)')
ylabel('Amplitude (m)')

figure(2)
j=1:20
plot(j*2.*pi/10,cos(j*2.*pi/10),j*2.*pi/10,sin(j*2.*pi/10),j*2.*pi/10,1/2^(1/2)*((cos(j*2.*pi/10))+sin(j*2.*pi/10)))