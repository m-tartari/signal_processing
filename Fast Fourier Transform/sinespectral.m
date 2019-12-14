Nt = 128;
Nf = Nt
fs = 1000;
f0 = 5/ 128 * fs;
a = 1;
phi = pi / 2;
n = 0:Nt-1;
y = a * cos(2 * pi * f0 * n / fs + 0)
figure(1)
plot(n/fs,y)

figure()
[f, tfx] = transffourier(y, Nf, fs)
figure(2)
plot ([f-fs f], [abs(tfx) abs(tfx)],'rx')
axis ([-200 200 -inf inf])
hold on

Nf = 4096
[f, tfx] = transffourier(y, Nf, fs)
plot ([f-fs f], [abs(tfx) abs(tfx)], 'b')
axis ([-200 200 -inf inf])


Nt = 128;
Nf = Nt
fs = 1000;
f0 = 5.7/ 128 * fs;
a = 1;
phi = pi / 2;
n = 0:Nt-1;
y = a * cos(2 * pi * f0 * n / fs + 0)


[f, tfx] = transffourier(y, Nf, fs)
figure(3)
plot ([f-fs f], [abs(tfx) abs(tfx)],'rx')
axis ([-200 200 -inf inf])
hold on

Nf = 4096
[f, tfx] = transffourier(y, Nf, fs)
plot ([f-fs f], [abs(tfx) abs(tfx)], 'b')
axis ([-200 200 -inf inf])
