function [B,defective]=HW2_afunction(m,n)
B=rand(1,m);
defective=0;
for i=1:1
    for j=1:m
        if (B(i,j)<n)
            B(i,j)=1;
            defective=defective+1;
        else
            B(i,j)=0;
        end    
    end
end
end
%m:總共要生產的個數
%n:defective rate
%B:生產出來的矩陣，是隨機產生0-1之間的數，並直接把n以下的數當成defective，記做1，其他記做0
%紀錄defective並輸出只是為了方便觀看(雖然在(a)小題裡面並不需要，但使用的話很快就能發現defective的產品數會變動)