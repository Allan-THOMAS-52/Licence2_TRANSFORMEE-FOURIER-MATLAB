% Load the image
image = imread('testFF2.jpg'); 

% Convert the image to grayscale (if it's a color image)
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Perform 2D FFT
fft2_result = fft2d(image);

% Perform 2D IFFT using the recursive function
ifft2_result = faInFourier2D(fft2_result);

fft2_result = fftshift(fft2_result);

magnitude = abs(fft2_result);

% Display the original image, its magnitude, and phase
subplot(1, 3, 1);
imshow(image, []);
title('Original Image');

subplot(1, 3, 2);
imshow(log(1 + magnitude), []); % Log-scaled magnitude
title('2D FFT Magnitude');
colormap(gca, 'jet');
colorbar;

subplot(1, 3, 3);
imshow(real(ifft2_result), []); % Display the real part of the IFFT result
title('2D IFFT Result');


