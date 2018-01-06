im1 = imfinfo('1.jpg');im1 = im1.DigitalCamera.ExposureTime;
im2 = imfinfo('2.jpg');im2 = im2.DigitalCamera.ExposureTime;
im3 = imfinfo('3.jpg');im3 = im3.DigitalCamera.ExposureTime;
im4 = imfinfo('4.jpg');im4 = im4.DigitalCamera.ExposureTime;
im5 = imfinfo('5.jpg');im5 = im5.DigitalCamera.ExposureTime;
im6 = imfinfo('6.jpg');im6 = im6.DigitalCamera.ExposureTime;
im7 = imfinfo('7.jpg');im7 = im7.DigitalCamera.ExposureTime;
im8 = imfinfo('8.jpg');im8 = im8.DigitalCamera.ExposureTime;
im9 = imfinfo('9.jpg');im9 = im9.DigitalCamera.ExposureTime;

evs = [im1,im2,im3,im4,im5,im6,im7,im8,im9];

% czasy naswietlania podzielone przez sume czasow naswietlania 
evs = evs./sum(evs);
w = 0;
s = 0;

for images = 1:9
    EXP = imread(sprintf('%d.jpg',images));
    %figure(images)
    %imshow(EXP)
    %EXP = imread('1.jpg');
    EXP = double(EXP)./255;
    EXP_W = ones(size(EXP));
    %EXP_W(any(EXP) <0.2) = 0;
    %EXP_W(any(EXP) >0.8) = 0;
    EXP_W = exp(-4*(EXP-127.5).^2 /(127.5)^2);
    % dopisac krzywa gaussa i tmo foto
    s = s + EXP .* EXP_W * (1/evs(images));
    w = w + EXP_W;
end

hdr = s./w;
hdr2=(hdr*0.01).^0.4;

hdrwrite(hdr,'obrazek1.hdr');


