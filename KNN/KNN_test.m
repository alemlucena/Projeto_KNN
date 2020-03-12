clear all, close all;
%%

load dataset3.txt

sort_type = 'builtin'; % selecionar 'mysort' ou 'builtin'
k = [1,5,9];
train_percent = 0.7; % porcentagem do holdout referente ao grupo de treino
nSim = 10;
tElapsed = zeros(1,nSim);
acc = tElapsed;
prec = tElapsed;
rev = tElapsed;

data = dataset3';
data_size = size(data,1);

for jj = 1:length(k)
%     [train_data,train_label,test_data,test_label] = my_holdout(data(1:2,:),data(3,:),train_percent);
    train_data = data(1:2,:);
    train_label = data(3,:);
    decisionRegion(train_data,train_label,k(jj))
end
