function feat = feature_extraction(img)
% Output should be a fixed length vector [1*dimension] for a single image. 
% Please do NOT change the interface.
% load('categoryClassifier');
% s=categoryClassifier;
img = rgb2gray(img);
%  points=detectHarrisFeatures(img,'FilterSize', 4);
% points=detectSURFFeatures(img,'MetricThreshold',500);
points = detectMinEigenFeatures(img, 'FilterSize', 3);
[features, valid_points] = extractFeatures(img, points,'Method','SURF');
F=mean(features);
display(F);

feat = F;
  
