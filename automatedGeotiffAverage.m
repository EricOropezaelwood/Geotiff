%{
%   Read in every .tif file from a directory and create 
%   a new image based on the average of all input images.
%
%   Authors: Glenn Grant, Eric Oropezaelwood
%}

%read all tiff files from the directory
geotiffFiles = dir('*.tif');
numFiles = length(geotiffFiles);

imgSum = 0;
mapSum = 0;

%loop through all files and sum 'img' and 'map' values
for k = 1 : numFiles
  [img,map] = imread(geotiffFiles(k).name,1);
  imgSum = imgSum + img;
  mapSum = mapSum + map;
end

%average the 'img' and 'map' values form imread
avgImg = imgSum/numFiles;
avgMap = mapSum/numFiles;

%convert to rgb image
rgbImage = ind2rgb(avgImg,avgMap);

%display averaged map
imshow(rgbImage)
