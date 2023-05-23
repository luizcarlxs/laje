%Marcus
fprintf('\n--------------------------------------------------------\n');
fprintf('MÉTODO DE MARCUS - Aula \n');
fprintf('--------------------------------------------------------\n');

vx = 1-(20/3)*kx/(mx*lambda^2);
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