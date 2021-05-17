function[X]=HW7_1_a(n)
X=zeros(1,1000000);
for i=1:n;
U=rand(1,1000000);%隨機產生的變數
for i=1:1000000;
    X(1,i)=X(1,i)+U(1,i);%因為Xi=U1+U2+...+Un，所以把它累加起來
end
end
