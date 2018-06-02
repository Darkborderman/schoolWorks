int=0;
for i=1:10000000
    w=rand(1)*4;
    h=rand(1)*2;
    y = (4-(w^2)/4)^(1/2);
    if (h<y)
        int = int +1;
    end
end
a=8*(int/10000000);
fprintf('Area = %.4f',a);