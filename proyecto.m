function proyecto(inputImage)
    imgOriginal = imread(inputImage);
    img= rgb2gray(imgOriginal);
    img= im2double(img);    
    
    per=percentil(img); %calcular percentil
    imgPer = tmp(img, per);
    smooth = imgaussfilt(per, 8);%suabizar la imagen
    [centers1, radii1] = imfindcircles(smooth,[100 175], 'Sensitivity',0.88, 'ObjectPolarity','bright');
    [centers2, radii2] = imfindcircles(smooth,[175 250], 'Sensitivity',0.88, 'ObjectPolarity','bright');
    [centers3, radii3] = imfindcircles(smooth,[100 175], 'Sensitivity',0.85, 'ObjectPolarity','bright');
    [centers4, radii4] = imfindcircles(smooth,[175 250], 'Sensitivity',0.85, 'ObjectPolarity','bright');

    centers = [centers1; centers2; centers3;centers4];
    radii = [radii1; radii2; radii3; radii4];
    [centro radio]= selectCandidato(centers, radii);

    sol = getSection(imgOriginal, centro, 210);
    subplot(2,3,1);
    imshow(imgOriginal);
    
    subplot(2,3,2);
    imshow(imgPer);
    
    subplot(2,3,3);
    imshow(smooth);
    
    subplot(2,3,4);
    %Todos los circulos encontrados
    imshow(img);
    viscircles(centers, radii,'Color','b');
    
    %solucion
    subplot(2,3,5);
    imshow(img);
    viscircles(centro, 210,'Color','g');
    
    subplot(2,3,6);
    imshow(sol);
end