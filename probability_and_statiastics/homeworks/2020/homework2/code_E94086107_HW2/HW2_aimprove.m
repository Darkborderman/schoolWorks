function [defective]=HW2_aimprove(m,n)
B=rand(1,m);
defective=0;
for i=1:1
    for j=1:m
        if (B(i,j)<n)
            defective=defective+1;
        end   
    end
end
end
%基本上和A差不多，m,n代表意思也相同，不過當產生的亂數小於defective rate時是直接在defective加一，並沒有轉換成1或0