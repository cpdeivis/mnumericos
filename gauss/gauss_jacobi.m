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

for i=1:n
    for j=1:n
        if (i==j)
            A(i,j) = 1000*A(i,j);
        end
    end
end

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

if norm(C, Inf) >= 1
    if norm(C, 1) >= 1
        fprintf('Não há garantia de convergência no método');
        return;
    end
end

num = 0;
x1 = x0;
while num < nMax
    x0 = x1;
    
    x1 = C*x0 + g;
    
    e = norm(x0-x1, Inf)/norm(x1, Inf);
    
    if e < erro
        break;
    end
    
    num = num+1;
end

fprintf('O vetor solucao eh: \n');
disp(x1);