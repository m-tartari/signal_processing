clear all
clc

%% Audio1
[y1 fs] = audioread('musique.wav');
sound(y1, fs)

%% Audio1 File encoding
fmin = 1000; fmax = 8000;   % encoding boundary frequencies
[npt, echelle] = codeur(y1, fs, fmin, fmax, 'musique2.wav');

%% Audio 2 = Decoded file Audio 1
[y2, fs] = decodeur('musique2.wav', fmin, fmax, npt, echelle);
pause(6.5);                 % wait for the Audio 1 to finish playing
sound(y2, fs)

%% Error Computation (= Audio 1 - Audio 2)
err = abs(fft(y1)) - abs(fft(y2));

%% Plot
f = (0:npt-1)/npt*fs;

figure;
subplot(2,1,1), plot(f,abs(fft(y1)));
    hold on;
        plot(f,abs(fft(y2)));
        xlim([0 max(f)]); 
        title('Fast Fourier Transform', 'interpreter','latex')
        legend('Audio 1','Audio 2')
    hold off;

subplot(2,1,2), plot(f,err,'g');
    hold on;
        xlim([0 max(f)]);
        ylim([min(err) max(err)]);
        title('Decoding Error', 'interpreter','latex')
    hold off;















