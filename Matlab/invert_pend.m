function dthdt = invert_pend(t,th,g,l,K)
dthdt = zeros(2,1);
dthdt(1)=th(2);
dthdt(2)=g/l*sin(th(1))-cos(th(1))/l*(-K(1)*th(1)-K(2)*th(2));
end