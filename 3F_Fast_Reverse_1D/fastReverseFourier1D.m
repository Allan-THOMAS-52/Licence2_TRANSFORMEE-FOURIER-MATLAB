% Define the parameters
Fs = 200;            % Sampling frequency
T = 1.0;             % Duration of the signal in seconds
t = 0:1/Fs:T-1/Fs;   % Time vector
f = 99;              % Frequency of the sinusoidal signal

% Create the sinusoidal signal
x = sin(2*pi*f*t);

% Perform the 1D FFT
X = zeros(size(x));
N = length(x);
for k = 0:N-1
    for n = 0:N-1
        X(k+1) = X(k+1) + x(n+1) * exp(-1i*2*pi*k*n/N);
    end
end

% Perform the IFFT
x_reconstructed = zeros(size(x));

for n = 0:N-1
    for k = 0:N-1
        x_reconstructed(n+1) = x_reconstructed(n+1) + X(k+1) * exp(1i*2*pi*k*n/N);
    end
    x_reconstructed(n+1) = x_reconstructed(n+1) / N;
end

% Plot the original and reconstructed signals
figure;
subplot(3,1,1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, real(X));
title('fft Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(t, real(x_reconstructed)); % Use real() to get rid of small imaginary parts
title('Reconstructed Signal');
xlabel('Time (s)');
ylabel('Amplitude');


