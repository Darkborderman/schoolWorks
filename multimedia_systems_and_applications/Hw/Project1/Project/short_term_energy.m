function [ c ] = short_term_energy( signal,fs,frame_size,frame_shift,window_type )
y = signal;
frame_size = frame_size/1000;
frame_shift = frame_shift/1000;
t = 1/fs:1/fs:(length(y)/fs); % plot wave form
subplot(5,1,1);plot(t,y);
title('Waveform');


window_length = frame_size * fs;
sample_shift = frame_shift*fs;
sum1 = 0;
energy = 0;
w = window(window_type,window_length);
jj=1;
for i = 1:(floor((length(y))/sample_shift)-ceil(window_length/sample_shift)) % for setting the window size in short term
    for j = (((i-1)*sample_shift)+1):(((i-1)*sample_shift)+window_length)
        y(j) = y(j)*w(jj); %calculate the energy
        jj = jj + 1;
        yy = y(j) * y(j);
        sum1 = sum1 + yy;
    end
    energy(i) = sum1;
    sum1 = 0;jj = 1;
end
w = 0;
c = energy;
%return c;

end