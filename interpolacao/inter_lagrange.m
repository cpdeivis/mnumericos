% INTERPOLAÇÃO POLINOMIAL -> LAGRANGE
% MÉTODOS NUMÉRICOS COMPUTACIONAIS
% DEIVIS COSTA PEREIRA

clear all;
clc;
format long;

% INPUTS
x = input('Entre com o vetor x: ');
y = input('Entre com o vetor y: ');
n = length(x);
gr = n-1;

% PLOTAR PONTOS
hold on;
grid on;
plot(x, y, 'r*');

% CONSTRUÇÃO POLINOMIO
poli = '';
for i=1:n
    poli = strcat(poli,num2str(y(i)),'*');
    for k=1:n
        if (i~=k)
            poli=strcat(poli,'(x-',num2str(x(k)),')/(',num2str(x(i)),'-',num2str(x(k)),')*');
        end 
    end
    poli(length(poli)) = '+';
end
poli = poli(1:(length(poli)-1));
fprintf(poli);
fprintf('\n');
fun = inline(poli);
ezplot(fun);
