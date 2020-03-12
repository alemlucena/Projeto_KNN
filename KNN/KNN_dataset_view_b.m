clear all, close all;
%% Decision Region

func_name = {'clusterincluster';'corners';'crescentfullmoon';'halfkernel';'outlier';'twospirals'};

for ii=1:6
    clear data
    
    eval(['data =',sprintf(func_name{ii}),'();']);
    
    nClasses  = length(unique(data(:,3)));
    
    train_data  = data(:,1:2)';
    train_label = data(:,3)';
    subplot(2,3,ii)
    hold on
    
    tmp2 = [];
    map = [];
    str_color = ['bo';'r+';'g*';'m^'];
    for n=1:nClasses
        tmpx = data(find(data(:,3)==n),:);
        tmp1 = scatter(tmpx(:,1),tmpx(:,2),str_color(n,:));
        tmp2 = [tmp2; tmp1];
        map = [map;tmp1.CData];
    end
    xlabel('x_1')
    ylabel('x_2')
    axis([-8 8 -8 8])
    pbaspect([1 1 1])
    grid
    title(sprintf(func_name{ii}))
end
