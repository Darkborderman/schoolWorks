first = 3.4;
array = NumToSngBin(first);%將數字轉成Binary
fprintf('The binary representation of %.10f is ', first);
for i=1 : 32
fprintf('%.0f',array(i));
end
fprintf(1,'\n');
f = SngBinToNum(array);%換回來
fprintf('The decimal representation of ');
for i=1:32
    fprintf('%.0f',array(i));
end
fprintf(' is %.10f\n',f);

first = 1.125;
array = NumToSngBin(first);
fprintf('The binary representation of %.10f is ', first);
for i=1 : 32
fprintf('%.0f',array(i));
end
fprintf(1,'\n');
f = SngBinToNum(array);
fprintf('The decimal representation of ');
for i=1:32
    fprintf('%.0f',array(i));
end
fprintf(' is %.10f\n',f);

first = -2.77;
array = NumToSngBin(first);
fprintf('The binary representation of %.10f is ', first);
for i=1 : 32
fprintf('%.0f',array(i));
end
fprintf(1,'\n');
f = SngBinToNum(array);
fprintf('The decimal representation of ');
for i=1:32
    fprintf('%.0f',array(i));
end
fprintf(' is %.10f\n',f);
clear;