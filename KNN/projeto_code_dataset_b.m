clear all, close all;
%% DATASETS ITEM B

sort_type = 'builtin'; % selecionar 'mysort' ou 'builtin'
k = [1,1,3,5,7,9]; % K = 1 ocorre duas vezes (a primeira é descartada) p/calc da média do tempo de execução
train_percent = 0.7; % porcentagem do holdout referente ao grupo de treino
nSim = 10;

tElapsed = zeros(length(k),nSim);
acc = tElapsed;
prec = tElapsed;
rev = tElapsed;

% data = clusterincluster()';
% data = corners()';
% data = crescentfullmoon()';
% data = halfkernel()';
% data = outlier()';
data = twospirals()';

for ii = 1:length(k)
    
    for jj = 1:nSim
        [train_data,train_label,test_data,test_label] = my_holdout(data(1:2,:),data(3,:),train_percent);
        tic
        y = KNN(train_data,train_label,test_data,k(ii),sort_type);
        tElapsed(ii,jj) = toc;
        [acc(ii,jj), tmp_prec, tmp_rev] = my_metrics(test_label,y);
        prec(ii,jj) = tmp_prec(1);
        rev(ii,jj) = tmp_rev(1);
    end    
    
end

disp('%--------%')
disp('t(ms)'), disp(mean(tElapsed(2:end,:),2)'*1000)
disp('acc'), disp(mean(acc(2:end,:),2)')
disp('prec'), disp(mean(prec(2:end,:),2)')
disp('rev'), disp(mean(rev(2:end,:),2)')
disp('%--------%')

% decisionRegion(train_data,train_label,k(ii));

C = confusionmat(test_label,y);