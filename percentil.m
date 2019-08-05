function outputImage = percentil (inputImage)
    outputImage = zeros(size(inputImage));
    vector = inputImage(:);
    prc= prctile(vector,99);
    for i= 1:size(outputImage,1)
        for j = 1:size(outputImage,2)
            if inputImage(i,j) >=prc
                outputImage(i,j) = 1;
            end
        end
    end

end