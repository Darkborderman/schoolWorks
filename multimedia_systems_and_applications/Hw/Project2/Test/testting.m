close 'all';
clear 'all';

J = imread('img02.jpg');
JS = J;
JSS = J;
C = double(JS);
for i = 1 : size(C, 1) - 2
    for j = 1 : size(C, 2) - 2
        %Sobel mask for x-direction:
        %        j, j+1, j+2
        %i     [-1,  -2,  -1]
        %i + 1 [ 0,   0,   0]
        %i + 2 [+1,  +2,  +1] 
        Gx = ((C(i + 2, j) + 2 * C(i + 2, j + 1) + C(i + 2, j + 2)) - (C(i, j) + 2 * C(i, j + 1) + C(i, j + 2)));
        
        %Sobel mask for y-direction:
        %        j, j+1, j+2
        %i     [-1,   0,  +1]
        %i + 1 [-2,   0,  +2]
        %i + 2 [-1,   0,  +1]
        Gy = ((C(i, j + 2) + 2 * C(i + 1, j + 2) + C(i + 2, j + 2)) - (C(i, j) + 2 * C(i + 1, j) + C(i + 2, j)));
        
        %The gradient of the image
        JS(i, j) = abs(Gx) + abs(Gy);
        JSS(i, j) = sqrt(Gx.^2 + Gy.^2);      
    end
end

figure,
subplot(1, 2, 1)
imshow(JS);          %print original file
subplot(1, 2, 2)
imshow(JSS);         %print sobeled file