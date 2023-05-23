clc
dados_de_entrada
%laje
nome_laje = "LAJE L1";
nome_ferrox = "N1";
nome_ferroy = "N2";
Mx = 636;
My = 407;
h = 10;
bf = 65;
bw = 9;
d = 6;
cobrimento = 3;
fck = 30;
fyd = 500;
bitx = 10;
bity = 10;

fprintf('\n--------------------------------------------------------\n');
fprintf('DIMENSIONAMENTO DO FERRO\n');
fprintf('--------------------------------------------------------\n');

%faz a leitura da planilha
bitola = 'bitola.xlsx';
bit50 = readmatrix(bitola,"Sheet","ca-50");
n = size(bit50(:,1),1);

%localiza a posição da linha de lambda
indx = find(bit50(:,1) == bitx);
indy = find(bit50(:,1) == bity);

%localiza a posição da linha de kx, mx, ny, my, ny
iAx = (indx + 1*n);
iAy = (indy + 1*n);

Ax = bit50(iAx);
Ay = bit50(iAy);

msdx = Mx*1.4;
msdy = My*1.4;

xx = (0.68*d-sqrt((0.68*d)^2-4*0.272*(msdx/(100*fck*0.1/1.4))))/0.544;
%fprintf('\nxx = %.2f cm\n', xx);

xy = (0.68*d-sqrt((0.68*d)^2-4*0.272*(msdy/(100*fck*0.1/1.4))))/0.544;
%fprintf('\nxy = %.2f cm\n', xy);

zx = d - 0.4*xx;
Asx = msdx/(zx*(fyd*0.1/1.15));

zy = d - 0.4*xy;
Asy = msdy/(zy*(fyd*0.1/1.15));

sx = Ax*100/Asx;
SX = floor(sx);

sy = Ay*100/Asy;
SY = floor(sy);

qtdx = (ly*100-14)/SX;
QTDX = ceil(qtdx);
lxf = (lx*100-2*cobrimento);

qtdy = (lx*100-14)/sy;
QTDY = ceil(qtdy);
lyf = (ly*100-2*cobrimento);


fprintf('\n%s - (%.2f m x %.2f m)\n', nome_laje,lx,ly);
fprintf('\nEM X: %d %s Ø%d C/%d C = %d\n', QTDX,nome_ferrox,bitx,SX,lxf);
fprintf('\nEM Y: %d %s Ø%d C/%d C = %d\n', QTDY,nome_ferroy,bity,SY,lyf);




