function X = rapDisRec1D(x)
    % Ensure that the input signal length is a power of 2
    N = length(x);
    if bitand(N, N-1) ~= 0
        error('Input signal length must be a power of 2');
    end
    
    if N == 1
        X = x; % Base case of the recursion
    else
        % Split the signal into even and odd parts
        x_even = x(1:2:N);
        x_odd = x(2:2:N);
        
        % Recursively compute FFT for even and odd parts
        X_even = rapDisRec1D(x_even);
        X_odd = rapDisRec1D(x_odd);
        
        % Combine the results using butterfly operations
        twiddle = exp(-2j * pi * (0:N/2-1) / N);
        X = [X_even + twiddle .* X_odd, X_even - twiddle .* X_odd];
    end
end

