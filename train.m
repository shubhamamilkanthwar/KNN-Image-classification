% Yo    u can change anything you want in this script.
% It is provided just for your convenience.
clear; clc; close all;

img_path = './train/';
class_num = 30;
img_per_class = 55;
img_num = class_num .* img_per_class;
feat_dim = size(feature_extraction(imread('./val/Balloon/329016.JPG')),2);
folder_dir = dir(img_path);
feat_train = zeros(img_num,feat_dim);
label_train = zeros(img_num,1);
all_features = transpose([1:class_num]);
for i = 1:length(folder_dir)-2
    
    img_dir = dir([img_path,folder_dir(i+2).name,'/*.JPG']);
    if isempty(img_dir)
        img_dir = dir([img_path,folder_dir(i+2).name,'/*.BMP']);
    end
    
    label_train((i-1)*img_per_class+1:i*img_per_class) = i;

    for j = 1:length(img_dir)        
        img = imread([img_path,folder_dir(i+2).name,'/',img_dir(j).name]);
        feat_train((i-1)*img_per_class+j,:) = feature_extraction(img);
        %display(img)
    end
end
% bag = bagofFeatures(feat_train);
C = horzcat(label_train,feat_train);
 [~,~,X] = unique(C(:,1));
 C = accumarray(X,1:size(C,1),[],@(r){C(r,:)});
for i=1:30
    columnMeans(i,:)=std(C{i}(:,2:end));
 end

save('model.mat','feat_train','label_train','C','columnMeans');