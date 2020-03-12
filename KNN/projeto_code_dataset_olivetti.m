clear all, close all;
%% DATASETS ITEM C - Olivetti
% View Dataset

load olivettifaces.mat

nSubject = 40;
nFaces = 10;

sort_type = 'builtin'; % selecionar 'mysort' ou 'builtin'
k = [1,1,3,5,7,9]; % K = 1 ocorre duas vezes (a primeira é descartada) p/calc da média do tempo de execução
train_percent = 0.7; % porcentagem do holdout referente ao grupo de treino
nSim = 10;

tElapsed = zeros(length(k),nSim);
acc = tElapsed;
prec = tElapsed;
rev = tElapsed;

data = faces;
labels = reshape(ones(10,40).*[1:40],[400,1]);

for ii = 1:length(k)
    
    for jj = 1:nSim
        [train_data,train_label,test_data,test_label] = my_holdout(data,labels,train_percent);
        tic
        y = KNN(train_data,train_label,test_data,k(ii),sort_type);
        tElapsed(ii,jj) = toc;
        [acc(ii,jj), tmp_prec, tmp_rev] = my_metrics(test_label,y);
        prec(ii,jj) = tmp_prec(1);
        rev(ii,jj) = tmp_rev(1);
    end    
    C{ii} = confusionmat(test_label,y);
end

disp('%--------%')
disp('t(ms)'), disp(mean(tElapsed(2:end,:),2)'*1000)
disp('acc'), disp(mean(acc(2:end,:),2)')
disp('prec'), disp(mean(prec(2:end,:),2)')
disp('rev'), disp(mean(rev(2:end,:),2)')
disp('%--------%')

%-- Confusion matrix

nUp = 320/nSubject;

figure, n=1;
for ii=2:2:6
CM = C{ii};
subplot(1,3,n), imshow(imresize(CM./max(CM),nUp,'nearest'))
title(sprintf('K = %i',k(ii)))
n = n+1;
end