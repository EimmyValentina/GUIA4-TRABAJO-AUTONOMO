% Funciones polyfit y polyval


% Cargar la base de datos census
load census;

% Carga la base de datos "census" disponible en MATLAB

% La base de datos "census" contiene información sobre la población de EE. UU. 

% Ajuste polinomial de curvas
p1 = polyfit(cdate,pop,1); % Ajuste polinomial de grado 1
p2 = polyfit(cdate,pop,2); % Ajuste polinomial de grado 2
p3 = polyfit(cdate,pop,3); % Ajuste polinomial de grado 3

% Graficar datos y ajustes polinomiales
scatter(cdate, pop); % Grafica los datos de población
hold on;
fplot(@(x) polyval(p1,x), [min(cdate), max(cdate)], 'K'); % Grafica ajuste polinomial grado 1
fplot(@(x) polyval(p2,x), [min(cdate), max(cdate)], 'm'); % Grafica ajuste polinomial grado 2
fplot(@(x) polyval(p3,x), [min(cdate), max(cdate)], 'r'); % Grafica ajuste polinomial grado 3
hold off;
legend('Datos', 'Ajuste Lineal', 'Ajuste Cuadrático', 'Ajuste Cúbico');
xlabel('Año');
ylabel('Población');
title('Ajuste Polinomial de Curvas a Datos de Población');

% Calcular error cuadrático medio
y1 = polyval(p1, cdate); % Evaluar ajuste grado 1 en los datos
y2 = polyval(p2, cdate); % Evaluar ajuste grado 2 en los datos
y3 = polyval(p3, cdate); % Evaluar ajuste grado 3 en los datos

mse1 = mean((pop - y1).^2); % Calcular error cuadrático medio para ajuste grado 1
mse2 = mean((pop - y2).^2); % Calcular error cuadrático medio para ajuste grado 2
mse3 = mean((pop - y3).^2); % Calcular error cuadrático medio para ajuste grado 3

% Mostrar resultados
fprintf('Error cuadrático medio para ajuste grado 1: %.2f\n',mse1);
fprintf('Error cuadrático medio para ajuste grado 2: %.2f\n',mse2);
fprintf('Error cuadrático medio para ajuste grado 3: %.2f\n',mse3);