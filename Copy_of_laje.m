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
% - corrigir implementação do método de arc-length
% - pós-processamento de todas as informações em arquivos 
%
% ------------------------------------------------------------------------

function  laje()

%================================================================
%
%tipo = 1;               %Escolha aqui o tipo de vinculação;
%
%================================================================

%carrega o arquivo de entrada
dados_de_entrada

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

%carrega o função de grelhas
grelhas

%carrega a função de marcus-grelhas
marcus_grelhas

%carrega a função de marcus_tabela
marcus_tabela


