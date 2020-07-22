% Cristóbal Pascual, David
% Doncel Aparicio, Alberto

clear all

%Matriz A de conexiones
A=[0 0 0 0 0 0 0;
   0.333 0 0 0.5 0 0 0.5;
   0 0.5 0 0 0 0 0;
   0.333 0 0.5 0 0 0.333 0.5;
   0.333 0 0 0 0 0.333 0;
   0 0 0.5 0 0 0 0;
   0 0.5 0 0.5 0 0.333 0];

i=[1 4 7 2 1 3 6 7 1 6 3 2 4 6];
j=[2 2 2 3 4 4 4 4 5 5 6 7 7 7];
%i=find(Nj==0);
N=7; % Dimensión de la matriz
alpha=0.85;
C=sparse(j,i,1,N,N);
%C=sparse(1:7,1:7,1,N,N)
 % Crea la matriz dispersa C de tamaño NxN tal que C(j(k),i(k))=1.
 % Los vectores i, j del mismo tamaño contienen los nodos de entrada y de salida
full(C) % Visualizamos la matriz completa.
Ccompleta=full(C); % Creamos la matriz completa
whos % Vemos el tamaño que ocupan en memoria las matrices C y Ccompleta 
Nj=sum(C);
Dj=zeros(1,N);
Dj(find(Nj==0))=1;
S=C;
for k=1:N
    if Dj(k)==1
        S(:,k)=ones(N,1)/N;
    else
        S(:,k)=S(:,k)/Nj(k);
    end
end
%G=zeros(size(S));
G=alpha*S+(1-alpha)*ones(N)/N;
[V,D]=eig(G);
autovalores=diag(abs(D));
V;
autovector=sum(abs(V));

[lambda,x]=potencia(G,50);
precision1=norm(G*x-lambda*x);
precision2=abs(lambda-1);
% G*x
% lambda*x
[lambda,pagerank]=getPageRank(G,500000,7);
precision3=norm(G*x-lambda*x);
precision4=abs(lambda-1);
bar(pagerank)