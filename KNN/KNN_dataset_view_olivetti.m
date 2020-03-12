clear all, close all;
%% View Dataset

load olivettifaces.mat

nSubject = 40;
nFaces = 10;

tmp2 = [];
for j=0:4
    tmp1 = [];
    for i=1:10
        tmp1 = [tmp1,reshape(faces(:,i+(j*10)),[64,64])];
    end
    tmp2 = [tmp2;tmp1];
end
figure
imshow(tmp2,[0 255]);