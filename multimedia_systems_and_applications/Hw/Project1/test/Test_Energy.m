clear('all');
close('all');
[f,fs] = audioread('TEST.wav');
N = size(f,1); % Determine total number of samples in audio file
figure;
subplot(2,1,1);
plot(1:N, f(:,1));
title('Left Channel');
subplot(2,1,2);
plot(1:N, f(:,1));
title('Right Channel');
n = 2;
fprintf('The sum of the absoulte values (Before filtering) is: \n');
fff = fft(f);
%plot(1:N, fff(:,1));
h = sum(abs(fff));
max(f)
disp(h)
beginFreq = 700 / (fs/2);
endFreq = 1600 / (fs/2);
[b,a] = butter(n, [beginFreq, endFreq], 'bandpass');
fOut = filter(b, a, f);
% Construct audioplayer object and play
%p = audioplayer(fOut, fs);
%p.play;
fprintf('The sum of the absoulte values (After filtering) is: \n');
figure;
plot(filter(b, a, f))
ggg = fft(fOut);
h = sum(abs(ggg));
disp(h)
fprintf('Sampling Frequency is: \n');
disp(fs)
%plot(fOut);