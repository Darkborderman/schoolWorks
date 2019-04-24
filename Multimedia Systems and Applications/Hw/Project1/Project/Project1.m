clear('all');
close('all');
[y,fs] = audioread('TEST.wav'); %read auio file

frame_size = 20; %setting
frame_shift = 10;
window_type = 'rectwin';

max_value = max(abs(y));
y = y/max_value;
energy = short_term_energy(y,fs,frame_size,frame_shift,window_type); %call short_term_energy
zcr = zcr(y,fs,frame_size,frame_shift,window_type); %call zcr
tt = 1/fs:(frame_size/2000):(length(energy)*(frame_shift/1000));
subplot(5,1,3);
plot(tt,energy);
title('Energy Contour');
subplot(5,1,5);
plot(tt,zcr);
title('Zero-Crossing Rate Contour');

avg_energy = sum(abs(energy)) / length(energy); %for calculating ITU & IZCT
%fprintf('avg_energy = ');
%disp(avg_energy);
var_energy = var(abs(energy));
%fprintf('var_energy = ');
%disp(var_energy);
avg_zcr = sum(abs(zcr)) / length(zcr);
%fprintf('avg_zcr = ');
%disp(avg_zcr);
var_zcr = var(abs(zcr));
%fprintf('var_zcr = ');
%disp(var_zcr);

ITU = avg_energy;
IZCT = avg_zcr;
begin_p = 0;
end_p = 0;
begin_temp = 0;
end_temp = 0;
count = 0;

for i = 1:length(energy) - 1 %find begin point
    if(energy(i) < ITU)
        if(energy(i + 1) > ITU)
            begin_p = i;
            break
        end
    end
end

for j = length(energy):-1:2 % find end point
    if(energy(j) < ITU)
        if(energy(j - 1) > ITU)
            end_p = j;
            break
        end
    end
end

%cal Pitch
frame_size = 30;
frame_shift = 10;
max_value=max(abs(y));
y=y/max_value;
window_period = frame_size / 1000;
window_length = window_period*fs;
shift_period = frame_shift / 1000;
sample_shift = shift_period*fs;
pitch_freq = 0;

sum1 = 0;autocorrelation = 0;sample_no = 0;
for i = 1:(floor((length(y))/sample_shift)-ceil(window_length/sample_shift)) % for setting the window size in short term
    k = 1;yy = 0;
    for j = (((i-1)*sample_shift)+1):(((i-1)*sample_shift)+window_length) % copy data in short term
        yy(k) = y(j);
        k = k + 1;
    end
    for l = 0:(length(yy) - 1) % calculate the pitch
        sum1 = 0;
        for u = 1:(length(yy) - l)
            s = yy(u)*yy(u + l);
            sum1 = sum1 + s;
        end
        autocor(l + 1) = sum1;
        autocorrelation(l + 1,i) = autocor(l + 1);
    end
    auto = autocor(21:160);
    max1= 0;
    for uu = 1:140
        if(auto(uu)>max1)
            max1 = auto(uu);
            sample_no = uu;
        end
    end
    pitch_freq(i) = 1/((20+sample_no)*(1/fs));
end
[rows,cols] = size(autocorrelation);
pitch_t = 1/fs:shift_period:(cols*shift_period);
subplot(5,1,4);
plot(pitch_t,pitch_freq,'.'); % plot pitch contour
title('Pitch Contour');

t = 1/fs:1/fs:(length(y)/fs); % plot end-pont
subplot(5,1,2);plot(t,y);hold on;
plot([(begin_p * (length(y)/fs)/length(energy)),(begin_p * (length(y)/fs)/length(energy))],[-1,1]);hold on;
plot([(end_p * (length(y)/fs)/length(energy)),(end_p * (length(y)/fs)/length(energy))],[-1,1]);
hold off;
title('End-Point');