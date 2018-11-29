% MÉTODO DE GAUSS-SEIDEL
% MÉTODOS NUMÉRICOS COMPUTACIONAIS
% DEIVIS COSTA PEREIRA

clc;
clear;
format short;

A = input('Entre com a matriz A desejada: ');
b = input('Entre com a matriz B desejada: ');
nMax = input('Entre com o nMax desejada: ');
erro = input('Entre com a tolerância desejada: ');
x0 = input('Entre com o vetor inicial: ');

g=b;
[n, m] = size(A);

% Garantir que a diagonal principal não vai zerar, Quando for randomico
%for i=1:n
%    for j=1:n
%        if (i==j)
%            A(i,j) = 1000*A(i,j);
%        end
%    end
%end

% Construção de C e do vetor g
C = zeros(n,n);
for i=1:n
    g(i) = b(i)/A(i,i);
    for j=1:n
        if (i==j)
            C(i,j) = 0;
        else
            C(i,j) = -A(i,j)/A(i,i);
        end
    end
end
% Critério de Sassenfeld
bet = zeros(1, n);
bet(1) = sum(abs(C(1,2:n)));
for i=2:n
    bet(i) = sum(abs(C(i,1:i-1)))*bet(i-1) + sum(abs(C(i,i+1:n)));
end

bmax = max(max(bet));

if bmax >= 1
    fprintf('Não há garantia de convergência!!\n');
    return;
end
% Aplicação do Método de Gauss-Seidel
num = 0;
x1 = x0;
while num < nMax
    x0 = x1;
    for i = 1:n
        soma = 0;
        for j=1:n
            if i == j || i<j
                soma = soma + C(i,j)*x0(j);
            else
                soma = soma + C(i,j)*x1(j);
            end
        end
        x1(i) = soma + g(i);
    end
    
    e = norm(x0-x1, inf)/norm(x1, inf);
    
    if(e < erro)
        disp(x1);
        return;
    end
    
    num = num + 1;
end

disp(x1);