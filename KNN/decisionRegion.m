function [] = decisionRegion(train_data,train_label,k)

nClasses  = length(unique(train_label));

figure
hold on

surf_range = 8;
x=linspace(-surf_range,surf_range,200);
y=linspace(-surf_range,surf_range,200);
[X,Y]=meshgrid(x,y);

Z = X;
for i = 1:length(X)
    for j = 1:length(Y)
        Z(i,j) = KNN(train_data,train_label,[X(i,j);Y(i,j)],k);
    end
end

h = surf(X,Y,Z-nClasses);
alpha 0.3
view(2);
set(h,'edgecolor','none');

tmp2 = [];
tmp3 = [];
map = [];
str_color = ['bo';'r+';'g*';'m^'];
for n=1:nClasses
    tmpx = train_data(:,find(train_label==n));
    tmp1 = scatter(tmpx(1,:),tmpx(2,:),str_color(n,:));
    tmp2 = [tmp2; tmp1];
    map = [map;tmp1.CData];
    tmp3 = [tmp3;sprintf('Classe %i',n)];
end
legend(tmp2,tmp3);
xlabel('Atributo 1')
ylabel('Atributo 2')
axis([-surf_range surf_range -surf_range surf_range])
pbaspect([1 1 1])
grid
title('Fronteira de Decisão ')

colormap(map)

end

