% MÉTODO DA FALSA POSIÇÃO
% AUTOR: DEIVIS COSTA PEREIRA
% MÉTODOS NUMÉRICOS COMPUTACIONAIS

clear;
clc;

f = input('Insira aqui sua função top: ','s');
a = input('Insira o valor do limite inferior A: ');
b = input('Insira o valor do limite superior B: ');
tol = input('Insira o valor da tolerância: ');

fa = subs(f, a);
fb = subs(f, b);

while (fa*fb > 0)
    disp('Intervalo inválido, insira um intervalo válido!!!');
    a = input('Insira o valor do limite inferior A: ');
    b = input('Insira o valor do limite superior B: ');
    
    fa = subs(f, a);
    fb = subs(f, b);
end 

intervalo = abs(a-b);
niter = (log(intervalo) - log(tol))/log(2);
niter = ceil(niter);
i = 1;

hold on;
grid on;
achou = 0;

while (i < niter && intervalo > tol)
    xbarra = (a*fb - b*fa)/(fb-fa);
    fxbar = subs(f, xbarra);
    
    fplot(f, [a b], 'r');
    plot(xbarra, fxbar, '*');
    
    if (abs(fxbar) <= tol)
        disp('A solução foi obtida pela Imagem');
        achou = 1;
        break
    end
    if (fa*fxbar < 0)
        b = xbarra;
        fb = fxbar;
    else
        a = xbarra;
        fa = fxbar;
    end
    intervalo = abs(a-b);
    i = i + 1;
    pause;
end

if achou == 1
    fprintf('A raiz foi obtida após: %i iterações\n', i);
    fprintf('A raiz é: %d\n', xbarra);
else
    fprintf('Não foi possível achar uma solução em %i iterações\n', niter);
    fprintf('A aproximação é: %d\n', xbarra);
end

return
