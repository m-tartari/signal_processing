function[y, fs, bits] = decodeur(fichier, fmin, fmax, npt, echelle)
 
    [d fs] = audioread(fichier);
    info = audioinfo(fichier);
    bits = info.BitsPerSample;
    
    d=d*echelle;
    tfy=zeros(npt, 1);
    kmin = round(npt*fmin/fs) + 1;
    kmax = round(npt*fmax/fs) + 1;
    
    d1=(d(:,1)+j*d(:,2));
    tfy(kmin:kmax) = d1;
    y=ifft(tfy, 'symmetric');
    
end
