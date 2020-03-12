function [acc, prec, rev] = my_metrics(test_label,label_hat)

nClasses  = length(unique(test_label));
classLabels = unique(test_label);
nSamples = length(test_label);

TP = zeros(1,nClasses);

acc = zeros(1,nClasses);
prec = zeros(1,nClasses);
rev = zeros(1,nClasses);

for ii=1:nSamples
    if test_label(ii) == label_hat(ii)
        for jj=1:nClasses
            if classLabels(jj) == label_hat(ii)
                TP(jj) = TP(jj)+1;
            end
        end
    end
end

acc = sum(TP)/nSamples;
for jj=1:nClasses
    prec(jj) = TP(jj)/length(label_hat(find(label_hat==classLabels(jj))));
    rev(jj)  = TP(jj)/length(test_label(find(test_label==classLabels(jj))));
end

end

