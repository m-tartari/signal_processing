clc
[y, fs] = audioread('musique.wav');
info = audioinfo('musique.wav');
bits = info.BitsPerSample;
 [f, tfx] = transffourier(y, fs);
 
 figure(2)
 hold off
 plot(f , abs( tfx ) )
% sound(y,fs)
fmin=0;
fmax=1000;
fichier = 'encoded.wav';

[npt, echelle] = codeur(y, fs, bits, fmin, fmax, fichier); 
[Y, Fs, Bits] = decodeur(fichier, fmin, fmax, npt, echelle);
sound(Y,Fs)

 [f, tfx] = transffourier(Y, fs);
 hold on
  plot(f , abs( tfx ) )


figure(3)
hold off
plot(y)
hold on
plot(Y)