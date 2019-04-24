close ('all');
clear ('all');

A=imread('img01.jpg');
B=rgb2gray(A);
C=double(B);

for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        B(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end
figure,
subplot(2,2,1)
imshow(B); title('Sobel gradient');

img=imread('img01.jpg'); 
a=rgb2gray(img);
Hx = [-1 0 1; -2 0 2;-1 0 1]; 
%y方向 
Hy = [1 2 1; 0 0 0; -1 -2 -1]; 

%2.convolution 
kx = conv2(a,Hx); %x方向梯度值 
ky = conv2(a,Hy); %y方向梯度值 

%計算每一個點梯度值大小 
k = (kx.^2 + ky.^2).^0.5; 
%此時選取適當threshold將足夠大的梯度值選出，就是edge 
k = k./max(max(k)); 
t = graythresh(k) ; %或是你可以自己指定。 
result = k>t; 

subplot(2,2,2)
imshow(result) 

A=imread('img02.jpg');
C=double(A);

for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        %Sobel mask for x-direction:
        Gx=((2*C(i+2,j+1)+C(i+2,j)+C(i+2,j+2))-(2*C(i,j+1)+C(i,j)+C(i,j+2)));
        %Sobel mask for y-direction:
        Gy=((2*C(i+1,j+2)+C(i,j+2)+C(i+2,j+2))-(2*C(i+1,j)+C(i,j)+C(i+2,j)));
      
        %The gradient of the image
        %B(i,j)=abs(Gx)+abs(Gy);
        A(i,j)=sqrt(Gx.^2+Gy.^2);
      
    end
end
subplot(2,2,3)
imshow(A); title('Sobel gradient');

img=imread('img02.jpg'); 
%a=rgb2gray(img);
Hx = [-1 0 1; -2 0 2;-1 0 1]; 
%y方向 
Hy = [1 2 1; 0 0 0; -1 -2 -1]; 

%2.convolution 
kx = conv2(img,Hx); %x方向梯度值 
ky = conv2(img,Hy); %y方向梯度值 

%計算每一個點梯度值大小 
k = (kx.^2 + ky.^2).^0.5; 
%此時選取適當threshold將足夠大的梯度值選出，就是edge 
k = k./max(max(k)); 
t = graythresh(k) ; %或是你可以自己指定。 
result = k>t; 
subplot(2,2,4);
imshow(result);