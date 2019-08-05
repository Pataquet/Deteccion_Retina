function outputImage = tmp(original, transformacion)
    outputImage = original;
    for i = 1:size(original,1)
        for j = 1:size(original,2)
            if transformacion(i,j)==1
                outputImage(i,j)=1;
            end
        end
    end
end