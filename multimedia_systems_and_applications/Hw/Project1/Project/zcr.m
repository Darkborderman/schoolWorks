function [ c ] = zcr( signal,fs,frame_size,frame_shift,window_type )
y = signal;
frame_size = frame_size/1000;
frame_shift = frame_shift/1000;

window_length = frame_size * fs;
sample_shift = frame_shift*fs;
sum1 = 0;
zcr = 0;
w = window(window_type,window_length);
jj=1;
for i = 1:(floor((length(y))/sample_shift)-ceil(window_length/sample_shift))% for setting the window size in short term
    y(((i-1)*sample_shift)+1) = y(((i-1)*sample_shift)+1)*w(jj);
    jj=jj+1;
    for j = (((i-1)*sample_shift)+2):(((i-1)*sample_shift)+window_length)
        y(j) = y(j)*w(jj); % calculate the zero-crossing rate
        jj = jj + 1;
        yy = y(j) * y(j-1);
        if(yy<0)
            sum1 = sum1 + 1;
        end
    end
    zcr(i) = sum1 / (2*window_length);
    sum1 = 0;jj = 1;
end
w = 0;
c = zcr;
%return c;

end