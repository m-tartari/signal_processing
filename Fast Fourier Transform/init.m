y = [0 2 5 4 3 6 9 0 4 5 ];
Nf = 10;
fs = 44100;
[f, tfx] = transffourier(y, Nf, fs)
plot(f , abs( tfx ) )