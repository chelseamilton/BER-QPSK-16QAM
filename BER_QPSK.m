clc;
clear all;
close all;

N = 10000;
snr_range = 0:20;
snr = 10.^(snr_range/10);

for i = 1:length(snr_range)
    in = 2*(round(rand(1, N))-0.5);
    quad = 2*(round(rand(1, N))-0.5);
    s = in + (j*quad);
    G = (1/sqrt(2 + snr(i)))*(randn(1, N) + j*randn(1, N));
    r = s+G;
    in1 = sign(real(r));
    quad1 = sign(imag(r));
    ber_1 = (N - sum(in == in1))/N;
    ber_2 = (N - sum(quad == quad1))/N;
    BER(i) = mean([ber_1 ber_2]);
end

semilogy(snr_range, BER);
xlabel('SNR (dB)');
ylabel('BIT ERROR RATE');
grid on;