function [ im ] = tmo_linear( L,image )

minlum = min(L(:))
maxlum = max(L(:))
%Lo = (L - minlum)/(maxlum - minlum);
Lo = (L -0.003)/(1 - minlum);

L = cat(3,L,L,L);
Lo = cat(3,Lo,Lo,Lo);
im = ((image./L).^0.7) .*Lo;


end

