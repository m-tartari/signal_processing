f0 = 1;
t = 0:0.01:10;
a = 5;
phi = pi/2;

x = a * cos(2*pi*f0*t + phi)
% plot(t,x)
f = zeros(length(t));
n = 1;

% for t = 0:10
%     f(n) = x(t) * e^(-1j * 2 * pi * f * t)
% end
% 
X=fft(x)
n=-10:0.1:10
plot(t,X)
