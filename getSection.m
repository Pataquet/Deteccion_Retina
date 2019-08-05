function outputImage = getSection(original, center, radio)
    grayImage = rgb2gray(original);
    [rows, columns, numberOfColorBands] = size(grayImage);
    circleCenterX = center(1); 
    circleCenterY = center(2); 
    
    circleImage = false(rows, columns); 
    [x, y] = meshgrid(1:columns, 1:rows); 
    circleImage((x - circleCenterX).^2 + (y - circleCenterY).^2 <= radio.^2) = true; 

    if numberOfColorBands == 1
        outputImage = original;
        outputImage(~circleImage) = grayImage(~circleImage); 
    end
end