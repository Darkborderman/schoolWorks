clear 'all';
close 'all';

[y1,fs1] = audioread('註冊語者01.wav'); %read auio file
[coeffs1,delta1,deltaDelta1,loc1] = mfcc(y1,fs1); %calculate MFCC1(coeffs1)
%t1 = 1/fs1:1/fs1:(length(coeffs1)/fs1);
%figure(1),
%subplot(2,2,1);
%plot(t1,coeffs1);

[y2,fs2] = audioread('註冊語者02.wav'); %read auio file
[coeffs2,delta2,deltaDelta2,loc2] = mfcc(y2,fs2); %calculate MFCC2(coeffs2)
%t2 = 1/fs2:1/fs2:(length(coeffs2)/fs2);
%subplot(2,2,2);
%plot(t2,coeffs2);

[y3,fs3] = audioread('註冊語者03.wav'); %read auio file
[coeffs3,delta3,deltaDelta3,loc3] = mfcc(y3,fs3); %calculate MFCC3(coeffs3)
%t3 = 1/fs3:1/fs3:(length(coeffs3)/fs3);
%subplot(2,2,3);
%plot(t3,coeffs3);

[y4,fs4] = audioread('註冊語者04.wav'); %read auio file
[coeffs4,delta4,deltaDelta4,loc4] = mfcc(y4,fs4); %calculate MFCC4(coeffs4)
%t4 = 1/fs4:1/fs4:(length(coeffs4)/fs4);
%subplot(2,2,4);
%plot(t4,coeffs4);

[idx1, C1, sum1, D1] = kmeans(coeffs1,1) %VQ1 based on k-means use 1 cluster
[idx2, C2, sum2, D2] = kmeans(coeffs2,1) %VQ1 based on k-means use 1 cluster
[idx3, C3, sum3, D3] = kmeans(coeffs3,1) %VQ1 based on k-means use 1 cluster
[idx4, C4, sum4, D4] = kmeans(coeffs4,1) %VQ1 based on k-means use 1 cluster

[y,fs] = audioread('對話內容.wav'); %read auio file
[coeffs,delta,deltaDelta,loc] = mfcc(y,fs); %calculate MFCC(coeffs)
%t = 1/fs:1/fs:(length(coeffs)/fs);
%figure(2),
%plot(t,coeffs);
matrix = zeros(length(coeffs) - 150,1) %the matrix save result(speaker diarization)

for i = 1:length(coeffs) - 150
    [idx,C] = kmeans(coeffs(i:i + 149,:), 1) %pick 150 sample doing k-means
    diff1 = 0
    diff2 = 0
    diff3 = 0
    diff4 = 0

   for q = 3:14 %for only 12 MFCC
        diff1 = diff1 + abs(C(q) - C1(q)) %compare the difference between sample and VQ1
        diff2 = diff2 + abs(C(q) - C2(q)) %compare the difference between sample and VQ2
        diff3 = diff3 + abs(C(q) - C3(q)) %compare the difference between sample and VQ3
        diff4 = diff4 + abs(C(q) - C4(q)) %compare the difference between sample and VQ4
   end
    
    % compare the 4 differences, the smaller is the speaker
    if (diff1 < diff2) && (diff1 < diff3) && (diff1 < diff4) 
        matrix(i) = 1
    elseif (diff2 < diff1) && (diff2 < diff3) && (diff2 < diff4)
        matrix(i) = 2
    elseif (diff3 < diff1) && (diff3 < diff2) && (diff3 < diff4)
        matrix(i) = 3
    elseif (diff4 < diff1) && (diff4 < diff2) && (diff4 < diff3)
        matrix(i) = 4
    end
    
    if i > 1 && i < length(matrix)
        % smooth, because the truly speaker's difference might actually be bigger ,
        % so compare again and make sure the difference between the second one
        % and the first one is < 0.3
        if matrix(i) == 1
            if (matrix(i - 1) == 2) && (diff2 < diff3) && (diff2 < diff4) && (diff2 - diff1 < 0.3)
                matrix(i) = 2
            elseif (matrix(i - 1) == 3) && (diff3 < diff2) && (diff3 < diff4) && (diff3 - diff1 < 0.3)
                matrix(i) = 3
            elseif (matrix(i - 1) == 4) && (diff4 < diff2) && (diff4 < diff3) && (diff4 - diff1 < 0.3)
                matrix(i) = 4
            end
        elseif matrix(i) == 2
            if (matrix(i - 1) == 1) && (diff1 < diff3) && (diff1 < diff4) && (diff1 - diff2 < 0.3)
                matrix(i) = 1
            elseif (matrix(i - 1) == 3) && (diff3 < diff1) && (diff3 < diff4) && (diff3 - diff2 < 0.3)
                matrix(i) = 3
            elseif (matrix(i - 1) == 4) && (diff4 < diff1) && (diff4 < diff3) && (diff4 - diff2 < 0.3)
                matrix(i) = 4
            end
        elseif matrix(i) == 3
            if (matrix(i - 1) == 1) && (diff1 < diff2) && (diff1 < diff4) && (diff1 - diff3 < 0.3)
                matrix(i) = 1
            elseif (matrix(i - 1) == 2) && (diff2 < diff1) && (diff2 < diff4) && (diff2 - diff3 < 0.3)
                matrix(i) = 2
            elseif (matrix(i - 1) == 4) && (diff4 < diff1) && (diff4 < diff2) && (diff4 - diff3 < 0.3)
                matrix(i) = 4
            end
        elseif matrix(i) == 4
            if (matrix(i - 1) == 1) && (diff1 < diff2) && (diff1 < diff3) && (diff1 - diff4 < 0.3)
                matrix(i) = 1
            elseif (matrix(i - 1) == 2) && (diff2 < diff1) && (diff2 < diff3) && (diff2 - diff4 < 0.3)
                matrix(i) = 2
            elseif (matrix(i - 1) == 3) && (diff3 < diff1) && (diff3 < diff2) && (diff3 - diff4 < 0.3)
                matrix(i) = 3
            end
        end
    end
end

% for compare the time and speaker separately, so we can see the graph more clearly
%figure(1),
%for i = 1:length(matrix)
%    if matrix(i) == 1
%        plot(i,matrix(i),'b+');
%        hold on;
%    elseif matrix(i) == 2
%        plot(i,matrix(i),'r+');
%        hold on;
%    elseif matrix(i) == 3
%        plot(i,matrix(i),'g+');
%        hold on;
%    elseif matrix(i) == 4
%        plot(i,matrix(i),'y+');
%        hold on;
%    end
%end
%text(1600,1.9,'b+ : user1');
%text(1600,1.7,'r+ : user2');
%text(1600,1.5,'g+ : user3');
%text(1600,1.3,'y+ : user4');
%hold off;

%the final result
figure(1),
for i = 1:length(matrix)
    if matrix(i) == 1
        plot(i,1,'b+');
        hold on;
    elseif matrix(i) == 2
        plot(i,1,'r+');
        hold on;
    elseif matrix(i) == 3
        plot(i,1,'g+');
        hold on;
    elseif matrix(i) == 4
        plot(i,1,'y+');
        hold on;
    end
end
text(1600,1.9,'b+ : user1');
text(1600,1.7,'r+ : user2');
text(1600,1.5,'g+ : user3');
text(1600,1.3,'y+ : user4');
hold off;