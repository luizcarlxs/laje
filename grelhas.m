fprintf('\n--------------------------------------------------------\n');
fprintf('TEORIA DAS GRELHAS\n');
fprintf('--------------------------------------------------------\n');

alfa_x = alfas(1,tipo);
alfa_y = alfas(2,tipo);
delta = alfa_y/alfa_x;

%define os valores de mx para um dado alfa_x
if alfa_x==1
    mx = 24;
elseif alfa_x==2
    mx = 128/9;
elseif alfa_x==5
    mx = 8;
end

%define os valores de mx para um dado alfa_x
if alfa_y==1
    my = 24;
elseif alfa_y==2
    my = 128/9;
elseif alfa_y==5
    my = 8;
end

%Quinhões de Carga
kx = (delta*lambda^4)/(1+delta*lambda^4);
ky = 1/(1+delta*lambda^4);

%Grelhas
px = p*kx;
py = p*ky;

%Flecha
wx = alfa_x*px*lx^4/(384*Ecs*1000*I); %(resultado em mm)
fprintf('w: %.5f m\n', wx);

%Momentos Positivos e Negativo
Mx = px*lx^2/mx;
My = py*ly^2/my;
fprintf('Mx: %.4f kNm/m\n', Mx);
fprintf('My: %.4f kNm/m\n', My);