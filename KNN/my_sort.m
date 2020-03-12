function [sorted,Index] = my_sort(data)
% Insertion Sort

nSamples = length(data);
Index = 1:nSamples;
sorted = data;

for jj=1:nSamples
    for ii=2:nSamples
        if sorted(ii-1) > sorted(ii)
            tmp1 = sorted(ii);
            sorted(ii) = sorted(ii-1);
            sorted(ii-1) = tmp1;
            
            tmp2 = Index(ii);
            Index(ii) = Index(ii-1);
            Index(ii-1) = tmp2;
        end
    end
end

end

