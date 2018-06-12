%read in files
[geotiff1,map1] = imread('N_20180601_concentration_v3.0.tif',1);
[geotiff2,map2] = imread('N_20180602_concentration_v3.0.tif',1);
[geotiff3,map3] = imread('N_20170601_concentration_v3.0.tif',1);

%get an average of the tiff files
avgImage = (geotiff1 + geotiff2 + geotiff3) / 3;

averageMap = (map1+map2+map3)/3;

%convert the averaged tiff image to RGB
rgbImage = ind2rgb(avgImage,averageMap);

imshow(rgbImage)
