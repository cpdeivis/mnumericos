% INTEGRAÇÃO NUMÉRICA: TRAPÉZIOS GENERALIZADOS
% MÉTODOS NUMÉRICOS COMPUTACIONAIS
% DEIVIS COSTA PEREIRA

clear all;
clc;
format long;

% INPUTS
func = input('Digite a funcao desejada: ', 's');
a = input('Entre com o ponto a: ');
b = input('Entre com o ponto b: ');
n = input('Entre com o número de subintervalos: ');
h = (b-a)/n;

% CONSTRUÇÃO DO VETOR X e Y
j=1;
for i=a:h:b
    x(j) = i;
    j = j+1;
end
y = zeros(1, length(x));
for i=1:n+1
    y(i) = subs(func,x(i));
end

sum = 0;
for i=1:(n+1)
    if i~=1 && i~=(n+1)
        sum = sum + 2*y(i);
    else
        sum = sum + y(i);
    end
end

res = (h/2) * sum;
disp(res);
