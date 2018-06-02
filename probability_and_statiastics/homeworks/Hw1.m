clear all;
data = [6.72 6.77 6.82 6.70 6.78 6.70 6.62 6.75 6.66 6.66 6.64 6.76 6.73 6.80 6.72 6.76 6.76 6.68 6.66 6.62 6.72 6.76 6.70 6.78 6.76 6.67 6.70 6.72 6.74 6.81 6.79 6.78 6.66 6.76 6.76 6.72];
%(a)
mean = mean(data);
std = std(data);
fprintf('the sample mean is %f\n',mean);
fprintf('the sample standard deviation is %f\n',std);
%(b)
count1=0;
count2=0;
count3=0;
count4=0;
for i=1:36
    if(data(i)>=6.62&&data(i)<6.67)
        count1=count1+1;
    
    elseif(data(i)>=6.67&&data(i)<6.72)
            count2=count2+1;
       
    elseif(data(i)>=6.72&&data(i)<6.77)
            count3=count3+1;
         
    elseif(data(i)>=6.77&&data(i)<=6.82)
            count4=count4+1;
    end 
end

bar([6.645 6.695 6.745 6.795],[count1/36 count2/36 count3/36 count4/36]);

