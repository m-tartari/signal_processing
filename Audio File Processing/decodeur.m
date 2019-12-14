function [y, fs] = decodeur(fichier, fmin, fmax, npt, echelle)
%% Create a mask of audio file "fichier"
[masky fs] = audioread(fichier);

%% Compute the Fourier transform
% Scale the signal
masky = masky *echelle; 

% Compute Fourier transf. between fmin and fmax 
tf = masky(:,1) + j * masky(:,2);

% Find kmin and kmax that are the position of fmin and fmax 
%   inside the vector npt 
kmin = round ( fmin*npt/fs )+1;  
kmax = round ( fmax*npt/fs )+1;

% Zero-pad missing frequencies
tfy=[zeros(kmin-1 ,1);  tf;   zeros(npt-kmax,1)];

%% Compute inverse Fourier transform
y = ifft(tfy, 'symmetric');



