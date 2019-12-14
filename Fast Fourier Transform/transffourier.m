function [f, tfx] = transffourier(y, fs)

Nt = length(y);
Nf = Nt;
k = 0:Nf-1;
f = (k/Nf*fs);
n = 1;
Y = fft(y, Nf);
tfx = Y / fs;

end