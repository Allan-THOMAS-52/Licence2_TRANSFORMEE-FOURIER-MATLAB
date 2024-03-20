% Define a test signal
fs = 1000; % Sampling frequency (Hz)
t = 0:1/fs:1-1/fs; % Time vector from 0 to 1 second
f1 = 50; % Frequency of the first sinusoid (Hz)
f2 = 200; % Frequency of the second sinusoid (Hz)
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t); % Sum of two sinusoids

% Find the nearest higher power of 2 for zero-padding
N_original = length(x);
N_fft = 2^nextpow2(N_original);

% Zero-pad the signal
x_padded = [x, zeros(1, N_fft - N_original)];

% Calculate the frequencies corresponding to the FFT bins
frequencies = (0:N_fft-1) * fs / N_fft;

% Call the custom FFT function
X = rapDisRec1D(x_padded);

% Plot the original signal and its FFT
figure;
subplot(2, 1, 1);
plot(t, x);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(2, 1, 2);
plot(frequencies, abs(X));
title('FFT of the Signal');
xlabel('Frequency (Hz)');
ylabel('Magnitude');