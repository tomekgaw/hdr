function [ ldr ] = tmo_photo( L,image )

s = 0.0001;
a = 0.3;
l = log10(L + s);
lmax = 1000;
[w,k] = size(image);
Ls = exp(1/(w*k).* sum(l(:)));
size(Ls)
Lp = a./Ls.*L;
%Lo = (Lp+(1 + Lp./(lmax*lmax)))./(1+Lp);
Lo = Lp./(1+Lp);
L = cat(3,L,L,L);
Lo = cat(3,Lo,Lo,Lo);
ldr = ((image./L).^0.7) .*Lo;

end

