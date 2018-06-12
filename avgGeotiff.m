[geotiff1,map1] = imread('N_20180601_concentration_v3.0.tif',1);
[geotiff2,map2] = imread('N_20180602_concentration_v3.0.tif',1);
[geotiff3,map3] = imread('N_20180603_concentration_v3.0.tif',1);
%convert tiff images to RGB
if ~isempty(map1)
    image1 = ind2rgb(geotiff1,map1);
end
if ~isempty(map2)
    image2 = ind2rgb(geotiff2,map2);
end
if ~isempty(map3)
    image3 = ind2rgb(geotiff3,map3);
end
%initialize an empty image with same size of .tiff files
tiffDifference = zeros(448,304,3);

%test loop
%{
for i = 1:448
    image1(i,:,:) = 2;
end
%}

%average the red values
for i = 1:448
    tiffDifference(i,:,:) = (image1(i,:,:)+image2(i,:,:)+image3(i,:,:))/3;
end
%average the green values
for i = 1:304
    tiffDifference(:,i,:) = (image1(:,i,:)+image2(:,i,:)+image3(:,i,:))/3;
end
%average the blue values
for i = 1:3
    tiffDifference(:,:,i) = (image1(:,:,i)+image2(:,:,i)+image3(:,:,i))/3;
end

%display new averaged image
imshow(tiffDifference,map1)
