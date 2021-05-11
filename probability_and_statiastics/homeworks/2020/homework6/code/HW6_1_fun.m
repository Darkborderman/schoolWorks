function[f]=HW6_1_fun(x,y,ux,uy,sx,sy,p)
z=((x-ux)/sx).^2+((y-uy)/sy).^2-(2.*p.*(x-ux).*(y-uy)/(sx.*sy));
f=1/(2.*pi.*sx.*sy.*(1-p.^2).^0.5).*exp(-z/(2.*(1-p.^2)));
end