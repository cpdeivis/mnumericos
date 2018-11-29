% INTERPOLAÇÃO NEWTON
% MÉTODOS NUMÉRICOS COMPUTACIONAIS
% DEIVIS COSTA PEREIRA

clear all;
clc;
format long;

x = input('Entre con o vetor X: ');
y = input('Entre con o vetor Y: ');
n = length(x);
m = length(y);

if n~=m
    fprintf('Entrada inválida!!');
    return;
end

plot(x, y, 'r*');
grid on;
hold on;

M = zeros(n,n+1);
M(:,1) = x;
M(:,2) = y;

gap = 1;
tam = n-1;

for j=3:(n+1)
    for i=1:tam
        M(i,j) = (M(i+1,j-1) - M(i,j-1))/(M(i+gap,1) - M(i,1));
    end
    gap = gap + 1;
    tam = tam - 1;
end

poli = '';
poli = strcat(poli, num2str(M(1,2)), ' + (x - ', num2str(M(1,2)), ')');
for i=3:n+1
    poli = strcat(poli, ' * ', num2str(M(1,i)));
    if i==(n+1)
        break;
    end
    for j=2:i
        if j==2
            poli = strcat(poli, ' + (x - ', num2str(M(j-1,1)), ')');
        else
            poli = strcat(poli, ' * (x - ', num2str(M(j-1,1)), ')');
        end
    end
end

disp(poli);
fplot(poli, [min(x),max(x)]);