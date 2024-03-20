% Load the image
image = imread('test1-3.jpg');  % Replace 'your_image.jpg' with the path to your image

% Convert the image to grayscale (if it's a color image)
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Call the custom 2D FFT function
fft2_result = fft2d(image);
fft2_result = fftshift(fft2_result);

% Calculate the magnitude of the FFT
magnitude = abs(fft2_result);
phase = angle(fft2_result);

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
imshow(phase, []); % Display the phase
title('2D FFT Phase');
colormap(gca, 'jet');
colorbar;
