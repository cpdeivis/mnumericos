%MÉTODO DE NEWTON
%AUTOR: DEIVIS COSTA PEREIRA
%MÉTODOS NUMÉRICOS COMPUTACIONAIS

clear;
clc;

% ENTRADAS DO MÉTODO
f = input('Entre com a função: ','s');
f = sym(f);
fl = diff(f);
x0 = input('Entre com o ponto inicial x0: ');
tol = input('Entre com a tolerância desejada: ');
max = input('Entre com o número máximo de iterações: ');

erro = tol + 1; %Pq o valor inicial do erro precisa ser maior que a tolerância
n = 1;
modificado = 0;

fprintf('Itera  x0     fx0      x1      fx1    flinnha\n');

hold on;
grid on;

% LAÇO DO MÉTODO
while erro > tol && n < max
    fx0 = subs(f, x0);
    if modificado == 1
        x1 = x0 - (fx0/flx0);
        modificado = 0;
    else
        flx0 = subs(fl, x0);
        x1 = x0 - (fx0/flx0);
        % Teste para iniciar uso do método modificado
        if (abs(subs(fl, x1)) < tol)
            disp('Utilizando Método de Newton Modificado!!');
            modificado = 1;
        end
    end
    
    % Aplica x1 em f
    fx1 = subs(f, x1);
    fprintf('%i | %d | %d | %d | %d | %d \n', n, x0, fx0, x1, fx1, flx0);
    
    % Plota o gráfico
    intervalo = abs(x1 - x0) + 2;
    i0 = x0-intervalo;
    i1 = x1+intervalo;
    fplot(matlabFunction(f), [i0 i1], 'r');
    fplot(matlabFunction(fl), [i0 i1], 'm');
    plot(x1, fx1, '*b');
    
    if abs(fx1) < tol
        fprintf('O método converge pela imagem a sol é: %d \n', x1);
        break;
    end
    erro = abs(x1 - x0) / abs(x1);
    x0 = x1;
    n = n + 1;
    
    pause;
end
