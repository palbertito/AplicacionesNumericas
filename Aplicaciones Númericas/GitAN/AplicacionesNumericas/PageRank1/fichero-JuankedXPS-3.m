% Cristóbal Pascual, David
% Doncel Aparicio, Alberto

%Matriz A de conexiones
A=[0 0 0 0 0 0 0;
   0.333 0 0 0.5 0 0 0.5;
   0 0.5 0 0 0 0 0;
   0.333 0 0.5 0 0 0.333 0.5;
   0.333 0 0 0 0 0.333 0;
   0 0 0.5 0 0 0 0;
   0 0.5 0 0.5 0 0.333 0];
% i=[0 3 1 4 2 1 3]+1;
% j=[3 2 2 2 0 3 2]+1;
i=[0 0 0 0 0 0 0;
    1 0 0 1 0 0 1;
    0 1 0 0 0 0 0;
    1 0 1 0 0 1 1;
    1 0 0 0 0 1 0;
    0 0 1 0 0 0 0;
    0 1 0 1 0 1 0]+1;
j=[0 1 0 1 1 0 0;
    0 0 1 0 0 0 1;
    0 0 0 1 0 1 0;
    0 1 0 0 0 0 1;
    0 0 0 0 0 0 0;
    0 0 0 1 1 0 1;
    0 1 0 1 0 0 0]+1;
%i=find(Nj==0);
N=7; % Dimensión de la matriz
C=sparse(j,i,1,N,N);
%C=sparse(1:7,1:7,1,N,N)
 % Crea la matriz dispersa C de tamaño NxN tal que C(j(k),i(k))=1.
 % Los vectores i, j del mismo tamaño contienen los nodos de entrada y de salida
full(C) % Visualizamos la matriz completa.
Ccompleta=full(C); % Creamos la matriz completa
whos % Vemos el tamaño que ocupan en memoria las matrices C y Ccompleta 
