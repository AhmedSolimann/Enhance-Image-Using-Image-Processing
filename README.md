# Enhance-Image-Using-Image-Processing
**Problem Description:**

The problem is to enhance the given image by clearing the noise, then extract the 5 frequency domain features and classify it with other images in each class determine the nearest features of other images.

**Steps:**

1) Read the image then enhance it by removing the noise using “Image(: ,: ,1)” and “medfilt2”.
2) Get Fourier Transform of the spatial domain using fft2 and apply log transform by using “log(1+abs(Image))”.
3) Get the DC value of the image using “mean2(Image)”.
4) Extract the features of test image by using “fft2()”, ”abs()”, “sort()” and since we need to extract five features then we use “imageFeatures(1:5)”.
5) Read each image in each class and transfer it to gray scale by using ”rgb2gray()”.
6) Extract the features of each image in each class by using “fft2()”, ”abs()”, “sort()” and since we need to extract five features then we use “imageFeatures(1:5)”.
7) Create an array which contain the features of the class images to use it in the loop.
8) Create a loop compare features of the test image with each features of class images.
9) Determine the image that is look alike class images in features by getting the minimum value of the features.
10) Determine the class for the similar image by knowing its’ number.
