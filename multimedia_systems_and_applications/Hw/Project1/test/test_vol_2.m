[data, fs] =  audioread('TEST.wav'); % read exhalation audio wav  file (1 channel, mono)
% frequency is 44100 HZ
% windows of 0.1 s and overlap of 0.05 seconds
WINDOW_SIZE = fs*0.1; %4410 = fs*0.1
array_size = length(data); % array size of data
numOfPeaks = (array_size/(WINDOW_SIZE/2)) - 1;
step = floor(WINDOW_SIZE/2); %step size used in loop
transformed = data;
start =1;
k = 1;
t = 1;
g = 1;
o = 1;
% performing fft on each window and finding the peak of windows 
while(((start+WINDOW_SIZE)-1)<=array_size) 
    j=1;
    i =start;
    while(j<=WINDOW_SIZE)
        WindowArray(j) = transformed(i);
        j = j+1;
        i = i +1;
    end
    Y = fft(WindowArray);
    p = abs(Y).^2; %power
      [a, b] = max(abs(Y)); % find max a and its indices b
      [m, i] = max(p); %the maximum of the power m and its indices i
      maximum(g) = m;
      index(t) = i;
      power(o) = a;
      indexP(g) = b;
      start = start + step;
      k = k+1;
      t = t+1;
      g = g+1;
      o=o+1;  
  end
% low pass filter 
% filtering noise: ignor frequencies that are less than 5% of maximum frequency
for u=1:length(maximum)
    M = max(maximum); %highest value in the array
    Accept = 0.05* M;
    if(maximum(u) > Accept)
        maximum = maximum(u:length(maximum));
        break;
    end
end
% preparing the time of the graph, 
% Location of the Peak flow rates are estimated
TotalTime = (numOfPeaks * 0.1);
time1 = [0:0.1:TotalTime];
if(length(maximum) > ceil(numOfPeaks));
maximum = maximum(1:ceil(numOfPeaks)); 
end
time = time1(1:length(maximum));
% plotting frequency-time graph
figure(1);
plot(time, maximum);
ylabel('Frequency');
xlabel('Time (in seconds)');
% plotting volume-time graph
figure(2);
plot(time, cumsum(maximum)); % integration over time to get volume 
ylabel('Volume');
xlabel('Time (in seconds)');