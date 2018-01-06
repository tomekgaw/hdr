function [ ldr ] = tmo_gamma( L,image )


c = 0.4
Lo = L.^c;

L = cat(3,L,L,L);
Lo = cat(3,Lo,Lo,Lo);
ldr = ((image./L).^0.7) .*Lo;

end

