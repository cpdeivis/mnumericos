% MÉTODO DE ELIMINAÇÃO DE GAUSS
% MÉTODOS NUMÉRICOS COMPUTACIONAIS
% DEIVIS COSTA PEREIRA

clear all;
clc;
format short;

A = input('Entre com a Matriz A: ');
b = input('Entre com o vetor b: ');

[n k] = size(A);
aum = [A b];

% Método de Eliminação de Gauss
for j  = 1:n-1
    if aum(j, j) == 0   
        max = 0;
        ind = j+1;
        for i = j+1:n
            if aum(i,j) > max
                max = aum(i,j);
                ind = i;
            end
        end
        if (max == 0)
            fprintf('Não é possível resolver o Sistema!!!\n');
            return;
        end
        aum([j ind], :) = aum([ind j], :);
    end
    
    for i = j+1:n
        m(i, j) = aum(i, j)/aum(j, j);
        aum(i,:) = aum(i, :) - m(i,j)*aum(j,:);
    end
end

% Resolução do Sistema Triangular Superior
x(n) = aum(n,n+1)/aum(n, n);

for i=n-1:-1:1
    soma = 0;
    for j = i+1 : n
        soma = soma + aum(i, j)*x(j);
    end
    
    x(i) = (aum(i, n+1)-soma)/aum(i,i);
end

fprintf('\n\n O Vetor solução é:\n');

for i = 1:n
    fprintf(' x(%d) = %f\n', i, x(i));
end
