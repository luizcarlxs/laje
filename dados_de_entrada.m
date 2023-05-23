Exemplo = 'Metodo de Marcus';
clc
%Condições de Contorno
lx = 5;
ly = 4;
lambda = ly/lx;
h = 10;               %[cm];
I = (h/100)^3/12;



tipo_marcus = ["tipo1" "tipo2" "tipo3" "tipo4" "tipo5" "tipo6"];
alfas = [5 2 2 1 1 1;5 5 2 5 2 1];



%Dados do Concreto
fck = 30;               %[MPa];
alfa_E = 1;
alfa_i = 0.8+0.2*fck/80;
Ecs = alfa_E*alfa_i*5600*(fck)^0.5;

%Carregamentos
g_pp = 25*(h/100);     %kN/m²
g_rev = 1.5;           %kN/m²
g_alv = 1.0;           %kN/m²
g = g_pp+g_rev+g_alv;   %kN/m²
q = 2.0;                %kN/m²(NBR 6118/14)
p = 5.2;                %kN/m²
