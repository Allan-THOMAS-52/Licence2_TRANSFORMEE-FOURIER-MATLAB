% Load the image
image = imread('test3.jpg');  % Replace 'your_image.jpg' with the path to your image

% Convert the image to grayscale (if it's a color image)
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Get the size of the image
[M, N] = size(image);

% Initialize the DFT result matrices
dft_result = zeros(M, N);

% Calculate the 2D DFT manually
for u = 1:M
    for v = 1:N
        dft_value = 0;
        for x = 1:M
            for y = 1:N
                dft_value = dft_value + double(image(x, y)) * exp(-1i * 2 * pi * ((u-1)*(x-1)/M + (v-1)*(y-1)/N));
            end
        end
        dft_result(u, v) = dft_value;
    end
end

% Shift the zero frequency components to the center
dft_result = fftshift(dft_result);

% Calculate the magnitude and phase of the DFT
magnitude_spectrum = abs(dft_result);
phase_spectrum = angle(dft_result);

% Log-transform the magnitude for better visualization
magnitude_spectrum = log(1 + magnitude_spectrum);

% Display the original image
subplot(1, 3, 1);
imshow(uint8(image));
title('Original Image');

% Display the DFT magnitude
subplot(1, 3, 2);
imshow(magnitude_spectrum, []);
colormap(gca, 'jet');
colorbar;
title('DFT Magnitude');

% Display the DFT phase
subplot(1, 3, 3);
imshow(phase_spectrum, []);
colormap(gca, 'jet');
colorbar;
title('DFT Phase');



