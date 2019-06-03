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
%y��V 
Hy = [1 2 1; 0 0 0; -1 -2 -1]; 

%2.convolution 
kx = conv2(a,Hx); %x��V��׭� 
ky = conv2(a,Hy); %y��V��׭� 

%�p��C�@���I��׭Ȥj�p 
k = (kx.^2 + ky.^2).^0.5; 
%���ɿ���A��threshold�N�����j����׭ȿ�X�A�N�Oedge 
k = k./max(max(k)); 
t = graythresh(k) ; %�άO�A�i�H�ۤv���w�C 
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
%y��V 
Hy = [1 2 1; 0 0 0; -1 -2 -1]; 

%2.convolution 
kx = conv2(img,Hx); %x��V��׭� 
ky = conv2(img,Hy); %y��V��׭� 

%�p��C�@���I��׭Ȥj�p 
k = (kx.^2 + ky.^2).^0.5; 
%���ɿ���A��threshold�N�����j����׭ȿ�X�A�N�Oedge 
k = k./max(max(k)); 
t = graythresh(k) ; %�άO�A�i�H�ۤv���w�C 
result = k>t; 
subplot(2,2,4);
imshow(result);