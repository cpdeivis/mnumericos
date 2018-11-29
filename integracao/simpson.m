% INTEGRA��O NUM�RICA: 1/3 SIMPSON
% M�TODOS NUM�RICOS COMPUTACIONAIS
% DEIVIS COSTA PEREIRA

clear all;
clc;
format long;

% INPUTS
func = input('Digite a funcao desejada: ', 's');
a = input('Entre com o ponto a: ');
b = input('Entre com o ponto b: ');
n = input('Entre com o n�mero de subintervalos: ');
if(mod(n, 2) ~= 0)
    disp('N�mero inv�lido, entrada par!');
    return;
end
h = (b-a)/n;

% CONSTRU��O DO VETOR X e Y
x = a:h:b;
y = subs(func, x);

% SOMA
sum = 0;
for i=2:2:(length(y)-1)
   sum = sum + y(i-1) + 4*y(i) + y(i+1); 
end
 
res = (h/3) * sum;
disp(res);