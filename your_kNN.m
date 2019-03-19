function predict_label = your_kNN(feat)
% Output should be a fixed length vector [num of img, 1]. 
% Please do NOT change the interface.
% predict_label = zeros(size(feat,1),1); %dummy. replace it with your own code
load('model.mat','C','feat_train','label_train','columnMeans');
[r,a] = size(feat);
E=feat;
%  Y=columnMeans;
G= feat_train;
Q = label_train;
% 'Standardize',1
 Mdl = fitcknn(G,Q,'NumNeighbors',30,'Standardize',1);
 predict_label= predict(Mdl,E);                                                                       %for i = 1:r if(i<275)z=floor(i/20);predict_label(i,1) = 1+z;    else    predict_label(i,1)=1;       end    % predict_label(i,1)=fitcknn(X,Y,'NumNeighbors',5,'Standardize',1);

 end
