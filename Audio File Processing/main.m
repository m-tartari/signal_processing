clear all
clc

%% Initialize
Nt = 128;       % timespan for windowing
fs = 1000;      % sampling frequency
Nf = 4096;      % number of frequencies

%% Define time function
a = 1;         
phi = pi/6;    
n = 0:Nt-1;     
f0 = 5.7/128*fs;
y = a*cos (2*pi*f0*n/fs + phi ) ;


%% Compute Fourier transform
[f tfx] = transffourier(y, Nf, fs);

%% Plot
t = linspace(0, 2*pi, Nt);

figure(1)
subplot(2,1,1), plot(t, y);
hold on;
    title('Time plot of Y', 'interpreter','latex')
    xlim([0 max(t)]);
    xticks([0 pi/2 pi 3*pi/2 2*pi])
    xticklabels({'0','\pi/2','\pi', '3\pi/2','2\pi'})
hold off;

subplot(2,1,2), plot(f,abs(tfx));
    hold on;
        xlim([0 max(f)]);
        title('Fast Fourier Transform', 'interpreter','latex')
    hold off;