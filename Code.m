clc;    
clear all;
close all;  
imtool close all;  



Read=imread('11.png');
%Represents all rows and all columns in the first image and average intensity of the red channel 
Newimage=Read(:,:,1);
%Remove noise from the image
removeNoise=medfilt2(Newimage);
figure(1) , imshow(removeNoise,[]);title('Enhanced image');
%Reduce blurring of the image by sharping it.
sharpeImage=imsharpen(removeNoise,'Radius',2,'Amount',2);
figure(2) , imshow(sharpeImage,[]);title('Enhanced image by reducing blurring');


%Get Fourier Transform of an image
%The five domain features of an image
fftImage=fft2(double(sharpeImage));
imageFeatures=abs(fftImage(:));
imageFeatures=sort(imageFeatures,'descend');
imageFeatures=imageFeatures(1:5);
%apply log transform
loT=log(1+abs(fftImage));
figure(3), imshow(loT,[]);title('Log transformed image');




%Get the DC value of image
DC = mean2(fftImage);
fprintf('DC value=');
disp(DC);




%The signature vector for each image in each class
im1=imread('01.jpeg');
im2=imread('02.jpg');
im3=imread('03.jpg');
im4=imread('11.jpg');
im5=imread('12.jpg');
im6=imread('13.jpg');
im7=imread('21.jpg');
im8=imread('22.jpg');
im9=imread('23.jpg');
im10=imread('31.jpg');
im11=imread('32.jpg');
im12=imread('33.jpg');
im13=imread('41.jpg');
im14=imread('42.jpg');
im15=imread('43.jpg');

g1=rgb2gray(im1);
g2=rgb2gray(im2);
g3=rgb2gray(im3);


fftIm1=fft2(double(g1));
im1Features=abs(fftIm1(:));
im1Features=sort(im1Features,'descend');
im1Features=im1Features(1:5);

fftIm2=fft2(double(g2));
im2Features=abs(fftIm2(:));
im2Features=sort(im2Features,'descend');
im2Features=im2Features(1:5);

fftIm3=fft2(double(g3));
im3Features=abs(fftIm3(:));
im3Features=sort(im3Features,'descend');
im3Features=im3Features(1:5);

fftIm4=fft2(double(im4));
im4Features=abs(fftIm4(:));
im4Features=sort(im4Features,'descend');
im4Features=im4Features(1:5);

fftIm5=fft2(double(im5));
im5Features=abs(fftIm5(:));
im5Features=sort(im5Features,'descend');
im5Features=im5Features(1:5);

fftIm6=fft2(double(im6));
im6Features=abs(fftIm6(:));
im6Features=sort(im6Features,'descend');
im6Features=im6Features(1:5);

fftIm7=fft2(double(im7));
im7Features=abs(fftIm7(:));
im7Features=sort(im7Features,'descend');
im7Features=im7Features(1:5);

fftIm8=fft2(double(im8));
im8Features=abs(fftIm8(:));
im8Features=sort(im8Features,'descend');
im8Features=im8Features(1:5);

fftIm9=fft2(double(im9));
im9Features=abs(fftIm9(:));
im9Features=sort(im9Features,'descend');
im9Features=im9Features(1:5);

fftIm10=fft2(double(im10));
im10Features=abs(fftIm10(:));
im10Features=sort(im10Features,'descend');
im10Features=im10Features(1:5);

fftIm11=fft2(double(im11));
im11Features=abs(fftIm11(:));
im11Features=sort(im11Features,'descend');
im11Features=im11Features(1:5);

fftIm12=fft2(double(im12));
im12Features=abs(fftIm12(:));
im12Features=sort(im12Features,'descend');
im12Features=im12Features(1:5);

fftIm13=fft2(double(im13));
im13Features=abs(fftIm13(:));
im13Features=sort(im13Features,'descend');
im13Features=im13Features(1:5);

fftIm14=fft2(double(im14));
im14Features=abs(fftIm14(:));
im14Features=sort(im14Features,'descend');
im14Features=im14Features(1:5);

fftIm15=fft2(double(im15));
im15Features=abs(fftIm15(:));
im15Features=sort(im15Features,'descend');
im15Features=im15Features(1:5);

%Classify the testing image to each image in each class
features=[im1Features,im2Features,im3Features,im4Features,im5Features,im6Features,im7Features,im8Features,im9Features,im10Features,im11Features,im12Features,im13Features,im14Features,im15Features];
for i=1:15
    compare(i)=sqrt((imageFeatures(1)-features(1,i))^2+(imageFeatures(2)-features(2,i))^2+(imageFeatures(3)-features(3,i))^2+(imageFeatures(4)-features(4,i))^2+(imageFeatures(5)-features(5,i))^2);
end    
[Z,V]=min(compare);


%Get class and image number
if (V==1 || V==2|| V==3)
    fprintf('The similar image is in class 1 and image number=')
    disp(V)

elseif (V==4 || V==5|| V==6)
    fprintf('The similar image is in class 2 and image number=')
    disp(V)

elseif (V==7 || V==8|| V==9)
    fprintf('The similar image is in class 3 and image number=')
    disp(V)

elseif (V==10 || V==11|| V==12)
    fprintf('The similar image is in class 4 and image number=')
    disp(V)
elseif (V==13 || V==14|| V==14)
    fprintf('The similar image is in class 5 and image number=')
    disp(V)
end