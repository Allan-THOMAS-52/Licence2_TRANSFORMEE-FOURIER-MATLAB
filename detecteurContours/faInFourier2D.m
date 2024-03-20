function output = faInFourier2D(fft_result)
    % Calculate 2D IFFT using a custom 2D FFT implementation

    % Take the complex conjugate of the FFT result
    fft_result_conj = conj(fft_result);

    % Calculate the 2D FFT of the complex conjugate
    ifft_result = fft2d(fft_result_conj);

    % Scale the result to match the original image size
    [M, N] = size(ifft_result);
    ifft_result = ifft_result / (M * N);

    % Ensure the result is real, as it should be for an image
    output = real(ifft_result);
end
