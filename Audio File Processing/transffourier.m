function [f, tfx] = transffourier(y, Nf, fs)
%% Initialize 
Nt = length(y);
f = zeros(Nf,1);
tfx = zeros(Nf,1);
k = 0:1:Nf-1;

%% Transform computation
f = k*fs/Nf;          %frequancy  vector
tfx = fft(y, Nf);
end

