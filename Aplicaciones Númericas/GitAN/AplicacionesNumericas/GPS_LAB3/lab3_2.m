clear all
sp=read_sp3('igs13230.sp3');
sats=[1 2 5 6 14 16 21 25 30];
N=8;
t=7200;
pos=~[4855000; -325000; 4115000];
XYZ=get_data_sats(sp,t,sats,N);
XYZog=XYZ;
H=get_HR(XYZ,pos);
Q=(H'*H)^-1;
PDoP=sqrt(Q(1,1)+Q(2,2)+Q(3,3));
sats=[6 16 25 30];
XYZ=get_data_sats(sp,t,sats,N);
H=get_HR(XYZ,pos);
Q=(H'*H)^-1;
PDoP2=sqrt(Q(1,1)+Q(2,2)+Q(3,3));
for i=1:1000
    for j=1:4
        XYZ(:,j)=XYZ(:,j)+randn(3,1);
    end
end
H=get_HR(XYZ,pos);
Q=(H'*H)^-1;
varx=sqrt(Q(1,1));
vary=sqrt(Q(2,2));
varz=sqrt(Q(3,3));
PDoP3=sqrt(Q(1,1)+Q(2,2)+Q(3,3));
sats=[2 6 16 21];
XYZ=get_data_sats(sp,t,sats,N);
H=get_HR(XYZ,pos);
Q=(H'*H)^-1;
PDoP4=sqrt(Q(1,1)+Q(2,2)+Q(3,3));
sats=[1 2 5 6 14 16 21 25 30];
lista=nchoosek(sats,4);
PDoP5=zeros(1,126);
for i=1:length(lista)
    XYZ=get_data_sats(sp,t,lista(i,:),N);
    H=get_HR(XYZ,pos);
    Q=(H'*H)^(-1);
    PDoP5(1,i)=sqrt(Q(1,1)+Q(2,2)+Q(3,3));
end
semilogy(PDoP5);
hold on
minimo=min(PDoP5);
maximo=max(PDoP5);
plot(find(PDoP5==minimo),minimo,'bo');
hold on
plot(find(PDoP5==maximo),maximo,'ro');
hold on
legend ('PDoP5','minimo','maximo')
hold off
% plot(XYZ2(1,:),XYZ2(2,:),'bo')
satmin=lista(find(PDoP5==minimo),:);
satmax=lista(find(PDoP5==maximo),:);
XYZ=get_data_sats(sp,t,lista(i,:),N);
plot(XYZog(1,:),XYZog(2,:),'bo')
hold on
XYZog=get_data_sats(sp, t, satmin, N);
plot(XYZog(1,:),XYZog(2,:),'r.')
XYZog=get_data_sats(sp, t, satmax, N);
hold on
plot(XYZog(1,:),XYZog(2,:),'g.')
legend('satelites', 'minimo', 'maximo')

% legend(XYZ(1,