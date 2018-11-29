% AJUSTE DE CURVAS
% MÉTODOS NUMÉRICOS COMPUTACIONAIS
% DEIVIS COSTA PEREIRA

clear all;
clc;
format short;

% INPUTS
x = input('Entre com o vetor x: ');
y = input('Entre com o vetor y: ');
n = length(x);

% DIAGRAMA DE DISPERSÃO
hold on;
grid on;
plot(x, y, 'r*');

% ESCOLHA TIPO DE AJUSTE
m = 1;
ajuste = input('Escolha o ajuste:\n0 - Polinomial\n1 - Hiperbólico\n2 - Exponencial de base e\n3 - Exponencial de base qualquer\n4 - Geométrico\n');
switch ajuste
    case 0 % POLINOMIAL
        m = input('Entre com o grau do polinomio: ');
    case 1 % HIPERBÓLICO
        y = 1./y;
    case {2, 3} % EXPONENCIAL e | EXPONENCIAL QUALQUER
        y = log(y);
    case 4 % GEOMÉTRICO
        x = log(x);
        y = log(y);
    otherwise  
end

A = zeros(m+1, m+1);
b = zeros(m+1, 1);

% CONSTRUCAO MATRIZ A E VETOR B
expM = (2*m);
for i = 1:(m+1)
    k = expM;
    for j = 1:(m+1)
        A(i, j) = sum(x.^k);
        k = k -1;
        if(i == (m+1) && j == (m+1))
            A(i,j) = n;
        end 
    end
    expM = expM -1;
    b(i) = sum(y.*(x.^((m+1)-i)));
end
b(i) = sum(y);

% APLICA GAUSS
% SEM VERIFICAÇÕES DE ERRO EM GAUSS
aum = [A b];
disp(aum);
for j = 1:(m+1)
    aux = j;
    for i = (aux+1):(m+1)
        mij = (aum(i,j))/(aum(j,j));
		aum(i,:) = aum(i,:) - mij*(aum(aux,:));
    end
end

% RESOLUÇÃO DO SISTEMA
for i = (m+1):-1:1
	soma = 0;
    for j = i+1:(m+1)
        soma = soma + aum(i,j)*x(j);
    end
	x(i) = (aum(i,(m+2))-soma)/(aum(i,i));
end

% CONSTRUÇÃO POLINOMIO
n = m+1;
fprintf('\n\nO vetor solução é:\n');
p = '';
switch ajuste
    case 0 % POLINOMIAL
        p = strcat(p, num2str(x(1)), '*x^', num2str(n-1));
        for i = 2:n
            p = strcat(p,' + (',num2str(x(i)),')* x^',num2str(n-i));
        end
    case 1 % HIPERBÓLICO
        p = strcat(p,'1/(', num2str(x(1)), '*x + ', num2str(x(2)), ')');
    case 2 % EXPONENCIAL e
        p = strcat(p,num2str(exp(x(2))), '*e^(', num2str(x(1)), '*x)');
    case 3 % EXPONENCIAL QUALQUER
        p = strcat(p,num2str(exp(x(2))), '*', num2str(exp(x(1))), '^x');
    case 4 % GEOMÉTRICO
        p = strcat(p,num2str(exp(x(2))), '*x^', num2str(x(1)));
    otherwise     
end
fprintf(p);
fprintf('\n');
f = inline(p);
ezplot(f);