function [y] = KNN(train_data,train_label,test_data,k,sort_type)
%KNN - K Nearest Neighbors Classifier

if nargin < 5
    sort_type = 'builtin';
end

nFeatures = size(train_data,1);
nTrain  = size(train_data,2);
nTest  = size(test_data,2);

y = zeros(nTest,1);

nLabels  = unique(train_label);
nClasses = length(nLabels);

for m = 1:nTest
    
    d = zeros(1,nTrain);
    
    for n=1:nTrain
        tmp =  test_data(:,m) - train_data(:,n);
        d(n) = norm(tmp);
    end
    
    if (strcmp(sort_type, 'mysort'))
        [~,I] = my_sort(d);
        klabels = train_label(I(1,1:k));
    elseif (strcmp(sort_type, 'builtin'))
        [~,I] = sort(d);
        klabels = train_label(I(1,1:k));
    end
    
    tmp = zeros(1,nClasses);
    for ii = 1:nClasses
        for jj = 1:k
            if klabels(jj) == nLabels(ii)
                tmp(ii) = tmp(ii)+1;
            end 
        end
    end
    [~,I] = max(tmp);
    y(m) = nLabels(I);        
        
    end
end

