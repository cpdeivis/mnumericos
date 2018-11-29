% INTERPOLAÇÃO POLINOMIAL
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

% CONSTRUÇÃO A e b
b = transpose(y);
A = zeros(n,n);
for i=1:n
   for j=1:n-1
       A(i,j) = x(i)^(gr-j+1); 
   end
   A(i,n) = 1;
end

% APLICA GAUSS
% SEM VERIFICAÇÕES DE ERRO EM GAUSS
aum = [A b];
% disp(aum);
for j = 1:n
    aux = j;
    for i = (aux+1):n
        mij = (aum(i,j))/(aum(j,j));
		aum(i,:) = aum(i,:) - mij*(aum(aux,:));
    end
end

% RESOLUÇÃO DO SISTEMA
for i = n:-1:1
	soma = 0;
    for j = i+1:n
        soma = soma + aum(i,j)*x(j);
    end
	x(i) = (aum(i,(n+1))-soma)/(aum(i,i));
end

% CONSTRUÇÃO POLINOMIO
fprintf('\n\nO vetor solução é:\n');
p = '';
for i = 1:n
    if (i == n)
        p = strcat(p,num2str(x(i)));
    end
    if ((n-i) ~= 0)
		p = strcat(p,num2str(x(i)),'*x^',num2str(n-i));
    end
    if (i ~= n)
		p = strcat (p,'+');
    end
end
fprintf(p);
fprintf('\n');
fun = inline(p);
ezplot(fun);