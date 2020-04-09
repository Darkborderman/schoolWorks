function [ energy ] = energyCalc(y)
frameWidth = 441;                          %# 10 msec
  numSamples = length(y);                    %# Number of samples in y
  numFrames = floor(numSamples/frameWidth);  %# Number of full frames in y
  energy = zeros(1,numFrames);               %# Initialize energy
  startSample = zeros(1,numFrames);          %# Initialize start indices of frame
  endSample = zeros(1,numFrames);            %# Initialize end indices of frame
for frame = 1:numFrames                              %# Loop over frames
  startSample(frame) = (frame-1)*frameWidth+1;       %# Starting index of frame
  endSample(frame) = frame*frameWidth;               %# Ending index of frame
  frameIndex = startSample(frame):endSample(frame);  %# Indices of frame samples
  energy(frame) = sum(y(frameIndex).^2);             %# Calculate frame energy
end
end

