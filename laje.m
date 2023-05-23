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
%dados_de_entrada

tipo_marcus = ["tipo1" "tipo2" "tipo3" "tipo4" "tipo5" "tipo6"];
alfas = [5 2 2 1 1 1;5 5 2 5 2 1];


%carrega o função de grelhas
%grelhas

%carrega a função de marcus-grelhas
%marcus_grelhas

%carrega a função de marcus_tabela
marcus_tabela


