%-------------------------------------------------------------------------
%Tabelas de Marcus
fprintf('\n--------------------------------------------------------\n');
fprintf('Tabelas de Marcus - Tipo: %d \n',tipo);
fprintf('--------------------------------------------------------\n');


%faz a leitura da planilha
filename = 'marcus.xlsx';
marcus = readmatrix(filename,"Sheet",tipo_marcus(tipo));
n = size(marcus(:,1),1);

%localiza a posição da linha de lambda
indices = find(marcus(:,1) == round(lambda*100)/100);

%localiza a posição da linha de kx, mx, ny, my, ny
ikx = (indices + 1*n);
imx = (indices + 2*n);
inx = (indices + 3*n);
imy = (indices + 4*n);
iny = (indices + 5*n);

%e mx, ny, my, ny
kxm = marcus(ikx);
mxm = marcus(imx);
mym = marcus(imy);



arq_momento = 'momento.xlsx';
momento = readmatrix(arq_momento);
n = size(momento(:,1),1)
M = zeros(n,4);
T = zeros(n,1);

for i=1:n
    tipo = momento(i+4*n);
    Mx = (momento(i+4*n))*(momento(i+4*n))^2/marcus(imx);
    M(i,2) = momento(i+4*n);

end
T

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

%Momentos Positivos e Negativo
Mx = p*lx^2/marcus(imx);
My = p*lx^2/marcus(imy);
Xx = -p*lx^2/marcus(inx);
Xy = -p*lx^2/marcus(iny);

fprintf('\nMx: %.4f kNm/m\n', Mx);
fprintf('My: %.4f kNm/m\n', My);
fprintf('Xx: %.4f kNm/m\n', Xx);
fprintf('Xy: %.4f kNm/m\n', Xy);
