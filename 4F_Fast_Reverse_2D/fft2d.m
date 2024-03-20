function X = fft2d(x)
    [M, N] = size(x);
    
    % Ensure the image size is a power of 2 by zero-padding
    M_padded = 2^nextpow2(M);
    N_padded = 2^nextpow2(N);
    x_padded = zeros(M_padded, N_padded);
    x_padded(1:M, 1:N) = x;
    
    X = zeros(M_padded, N_padded);

    % 2D FFT using 1D FFT along rows and columns
    for i = 1:M_padded
        X(i, :) = rapDisRec1D(x_padded(i, :));
    end

    for j = 1:N_padded
        X(:, j) = rapDisRec1D(X(:, j).');
    end
end

