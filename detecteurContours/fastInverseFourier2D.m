% Load the image
image = imread('test10.jpg');

% Display the original image
subplot(1, 6, 1);
imshow(image, []);
title('Image Originelle');

%-----------------------------------------------------------

% Convert the image to grayscale (if it's a color image)
if size(image, 3) == 3
    image = rgb2gray(image);
end

[M,N] = size(image);

%-----------------------------------------------------------

% Perform 2D FFT
fft2_result = fft2d(image);

magnitude = abs(fft2_result);

% Display the Original spectrum
subplot(1, 6, 2);
imshow(log(1 + magnitude), []);
title('Spectre Originel');
colormap(gca, 'jet');

%-----------------------------------------------------------

fft2_centre_to_show = fftshift(fft2_result);

magnitude = abs(fft2_centre_to_show);

% Display the shifted spectrum
subplot(1, 6, 3);
imshow(log(1 + magnitude), []);
title('Spectre Centré');
colormap(gca, 'jet');

%-----------------------------------------------------------

filtre_Laplacien = [-1, -1, -1; -1, 8, -1; -1, -1, -1];
laplacian_filter_padded = zeros(M, N);
laplacian_filter_padded(1:3, 1:3) = filtre_Laplacien;

filtered_fft2_result = fft2d(laplacian_filter_padded) .* fft2_result;

fft2_shifted = fftshift(filtered_fft2_result);

% Display the shifted spectrum
magnitude = abs(fft2_shifted);
subplot(1, 6, 4);
imshow(log(1 + magnitude), []);
title('Spectre filtré Centré');
colormap(gca, 'jet');

%-----------------------------------------------------------

fft2_decentree_to_show = ifftshift(fft2_shifted);

% Display the shifted spectrum
magnitude = abs(fft2_decentree_to_show);
subplot(1, 6, 5);
imshow(log(1 + magnitude), []);
title('Spectre filtré décentré');
colormap(gca, 'jet');

%-----------------------------------------------------------


% Perform 2D IFFT using the recursive function
ifft2_result = faInFourier2D(fft2_shifted);

binary_result = abs(ifft2_result) > 30;

% Affiche l'image filtree finale, apres ifft2
subplot(1, 6, 6);
imshow(binary_result, []);
title('Image filtrée finale');



