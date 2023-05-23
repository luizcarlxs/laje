clc 
tipo = 1;
%Marcus
fprintf('\n--------------------------------------------------------\n');
fprintf('MÉTODO DE MARCUS - Aula \n');
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

vx = 1-(20/3)*kxm/(mx*lambda^2);
vy = 1-(20/3)*ky*lambda^2/my;
pxm = p*kx;
pym = p*ky;


%Flecha
wxm = alfa_x*px*lx^4/(384*Ecs*1000*I); %(resultado em m);
%fprintf('w: %.5f m\n', wxm);

%Momentos Positivos e Negativo
Mxm = vx*px*lx^2/mx;
Mym = vy*py*ly^2/my;

%Imprime os resultados na tela
fprintf('Mx: %.4f kNm/m\n', Mxm);
fprintf('My: %.4f kNm/m\n', Mym);


