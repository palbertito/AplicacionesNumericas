% Cristóbal Pascual, David
% Doncel Aparicio, Alberto

clear all
i=[5 3 3 7 7 8 11 11 11];
j=[11 10 8 8 11 9 9 10 2];
N=11; % DimensiÃ³n de la matriz
alpha=0.85;
C=sparse(j,i,1,N,N);
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
G=alpha*S+(1-alpha)*ones(N)/N;
[autovalor,pagerank]=getPageRank(G,50,N);
bar(pagerank)
function [autovalor, autovector]=potencia(A,niter)
 N=11;
 x1=ones(N,1);
 for k=1:niter
 x=x1;
 x=x/norm(x);
 x1=A*x;
 end
 lambda=x'*x1;
 autovector=x;
 autovalor=lambda;
return
end
function [autovalor, pagerank]=getPageRank(A,niter,N)
 x1=ones(N,1);
 for k=1:niter
 x=x1;
 x=x/norm(x);
 x1=A*x;
 end
 lambda=x'*x1;
 pagerank=x/sum(x);
 autovalor=lambda;
return
end