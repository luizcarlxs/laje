% ------------------------------------------------------------------------
% ------------------------------------------------------------------------
%  Estruturas de Concreto I - 2023.1 - Prof. Augusto Albuquerque
%  Departamento de Engenharia Estrutural e Construção Civil - DEECC
%  Universidade Federal do Ceará - UFC
% ------------------------------------------------------------------------
%
%  LAJE
%  Programa para cálculo de momento em Lajes Maciças segundo as tabelas de
%  Marcus
%
% ------------------------------------------------------------------------
%
%  por:
%  Luiz Carlos Matias Teixeira
%
% ------------------------------------------------------------------------
% to-do list:
% - corrigir armadura mínima
%
% ---------------------------------------------------------------------
clc
%-------------------------------------------------------------------------
%Tabelas de Marcus
tipo_marcus = ["tipo1" "tipo2" "tipo3" "tipo4" "tipo5" "tipo6"];

global fsig;
fck = 30;
fyk = 500;

fsig = fopen(strcat('Resultados.txt'),'w');

%faz a leitura da planilha
filename = 'marcus.xlsx';
arq_momento = 'momento.xlsx';
momento = readmatrix(arq_momento);
nm = size(momento(:,1),1);
M = zeros(nm,4);
T = zeros(nm,1);

for i=1:nm
    % ---------------------------
    % Calculos dos esforços
    tipo = momento(i+4*nm);
    h = momento(i+3*nm);
    marcus = readmatrix(filename,"Sheet",tipo_marcus(tipo));
    nx = size(marcus(:,1),1);
    lxx = momento(i+1*nm);
    lyy = momento(i+2*nm);
    lambm = momento(i+2*nm)/momento(i+1*nm);
    lambm = round(lambm*100)/100;
    if lambm > 2
        M(i,1) = 0.00;
        M(i,2) = 0.00;
        M(i,3) = 0.00;
        M(i,4) = 0.00;
    else
    %localiza a posição da linha de lambda
    indices = find(marcus(:,1) == round(lambm*100)/100);
    
    %localiza a posição da linha de kx, mx, ny, my, ny
    ikx = (indices + 1*nx);
    imx = (indices + 2*nx);
    inx = (indices + 3*nx);
    imy = (indices + 4*nx);
    iny = (indices + 5*nx);
    
    %e mx, ny, my, ny
    kxm = marcus(ikx);
    mxm = marcus(imx);
    mym = marcus(imy);
    
    if marcus(inx)==1e24
        nxm = inf;    
    else
        nxm = marcus(inx);
    end
 
    if marcus(iny)==1e24
        nym = inf;   
    else
        nym = marcus(iny);
    end


    M(i,1) = 100*1.4*(momento(i+10*nm))*(momento(i+1*nm))^2/marcus(imx);
    M(i,2) = 100*1.4*(momento(i+10*nm))*(momento(i+1*nm))^2/marcus(imy);
    M(i,3) = 100*1.4*(momento(i+10*nm))*(momento(i+1*nm))^2/marcus(inx);
    M(i,4) = 100*1.4*(momento(i+10*nm))*(momento(i+1*nm))^2/marcus(iny);
    M(i,5) = 0.8*(100/6)*(h/100)^2*1.3*0.3*(fck)^(2/3);
    

    %dimensionamento
    num_ferrox = 1:2:2*nm;
    num_ferroy = 2:2:2*nm+1;
    %h = 14.93;
    cobrimento = 3;
    d = h-cobrimento-1;

    %rho_min = 0.2*0.3*fck^(2/3)/fyk;
    %rho_s = 0.67*rho_min;   

    msdx = M(i,1);
    msdy = M(i,2);

    Mdmin = 0.8*(100/6)*(h/100)^2*1.3*0.3*(fck)^(2/3)*100;

    if Mdmin > msdx
        msdx = Mdmin;
    end
    if Mdmin > msdy
        msdy = Mdmin;
    end

    %mdmin = 0.8*(1/6)*(h/100)^2*1.3*0.3*fck^(2/3)
    %faz a leitura da planilha
    bitola = 'bitola.xlsx';
    bit50 = readmatrix(bitola,"Sheet","ca-50");
    nb = size(bit50(:,1),1);
    
   
    xx = (0.68*d-sqrt((0.68*d)^2-4*0.272*(msdx/(100*fck*0.1/1.4))))/0.544;
    fprintf('\nxx = %.2f cm\n', xx);
    
    xy = (0.68*d-sqrt((0.68*d)^2-4*0.272*(msdy/(100*fck*0.1/1.4))))/0.544;
    fprintf('\nxy = %.2f cm\n', xy);
    
    zx = d - 0.4*xx;
    Asx = msdx/(zx*(fyk*0.1/1.15));
    Asxt = Asx;
    
    
    zy = d - 0.4*xy;
    Asy = msdy/(zy*(fyk*0.1/1.15));
    Asyt = Asy;

   
    Asmin = 0.0015*100*h
    Asx
    
    if Asmin > Asx
        Asx = Asmin
    end
    Asy
    if Asmin > Asy
        Asy = Asmin;
    end
    

    %bitx = 5;
    for ib=1:nb
        sb = bit50(ib,2)*100/Asx;
        if sb >= 13 && sb<=22
            bitx=bit50(ib,1)
        else

        end
    end 
    %bity = 5;
    for ib2=1:nb
        sb2 = bit50(ib2,2)*100/Asy;
        if sb2 >= 13 && sb2 <=22
            bity=bit50(ib2,1)
        end
    end 

    bitx
    bity
    %localiza a posição da linha da bitola na tabela de área
    indx = find(bit50(:,1) == bitx);
    indy = find(bit50(:,1) == bity);
    
    %localiza a posição da linha de Ax, Ay
    iAx = (indx + 1*nb);
    iAy = (indy + 1*nb);
    
    Ax = bit50(iAx);
    Ay = bit50(iAy);
    
    sx = Ax*100/Asx;
    sy = Ay*100/Asy;

    SX = floor(sx);
    SY = floor(sy);
    
    qtdx = (lyy*100-14)/SX;
    QTDX = ceil(qtdx);
    lxf = ceil(lxx*100-2*cobrimento);
    
    qtdy = (lxx*100-14)/sy;
    QTDY = ceil(qtdy);
    lyf = ceil(lyy*100-2*cobrimento);

    fprintf(fsig,'\nlinha neutra x = %.2f cm', xx);
    fprintf(fsig,'\nMsd = 1.4 ⋅ Mx = %.4f kN.cm/m', msdx);
    fprintf(fsig,'\nBraço de alavanca (z) = d - 0.4x = %.2f cm', zx);
    fprintf(fsig,'\nÁrea de aço (Asx) = %.2f cm² (Asmin = %.2f cm²)', Asxt,Asmin);
    fprintf(fsig,'\nFerro utilizado: Ø%d (área = %.2f cm²)',bitx, Ax);
    fprintf(fsig,'\nEspaçamento (Espx) = Øs ⋅ 100/Asx = %.2f ⋅ 100/%.2f = %.2f cm',Ax, Asx,sx);
    fprintf(fsig,'\nEspx = %.2f cm (projeto)', SX);
    fprintf(fsig, '\n--------------------------------------------------------');
    fprintf(fsig,'\nFERRO EM X: %d N%d Ø%.1f C/%d C = %d\n', QTDX,num_ferrox(1,i),bitx,SX,lxf);
    fprintf(fsig, '--------------------------------------------------------\n');
 
    fprintf(fsig,'\nlinha neutra x = %.2f cm', xy);
    fprintf(fsig,'\nMsd = 1.4 ⋅ My = %.4f kN.cm/m', msdy);
    fprintf(fsig,'\nBraço de alavanca (z) = d - 0.4x = %.2f cm', zy);         
    fprintf(fsig,'\nÁrea de aço (Asy) = %.2f cm² (Asmin = %.2f cm²)', Asyt,Asmin);
    fprintf(fsig,'\nFerro utilizado: Ø%d (área = %.2f cm²)',bity, Ay);
    fprintf(fsig,'\nEspaçamento (Espy) = Øs ⋅ 100/Asy = %.2f ⋅ 100/%.2f = %.2f cm',Ay, Asy,sy);
    fprintf(fsig,'\nEspy = %.2f cm (projeto)', SY); 
    fprintf(fsig,'\n--------------------------------------------------------');
    fprintf(fsig,'\nFERRO EM Y: %d N%d Ø%.1f C/%d C = %d\n', QTDY,num_ferroy(1,i),bity,SY,lyf);
    fprintf(fsig,'--------------------------------------------------------\n');
    end


    % --------------------------------------------------------------------
    
 





end

fprintf('\n--------------------------------------------------------\n')
fprintf(' OK');
fprintf('\n-------------------------------------------------------- \n');

M