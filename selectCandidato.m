function [center, radio] = selectCandidato(centers, radiios)
    
    tamRadio = 390;
    dif = abs(tamRadio- radiios(1)*2);
    center = centers(1,:);
    radio = radiios(1);
    for i = 1:size(radiios)
        diftmp = abs(tamRadio- radiios(i)*2);
        if dif > diftmp
            dif = diftmp;
            center = centers(i,:);
            radio = radiios(i);
        end
    end
end