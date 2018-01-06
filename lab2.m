clc
clear all

image = hdrread('obrazek1.hdr');
L = (image(:,:,1)* 0.2127) + (image(:,:,2) * 0.7152) + (image(:,:,3) * 0.0722);

im = tmo_linear(L,image);
ldr = tmo_gamma(L,image);
photo = tmo_photo(L,image);
