function ecualizada = ecual(img, porcentaje)
  
  [F, C] = size(img);
  ecualizada = uint8(zeros(F,C));
  histograma = histo(img);
  hac = 0;
   for nd = 1:length(histograma)
       hac = hac + histograma(nd);
       histograma(nd) = hac;
   end
   P = sum(histograma);
   FE = 255 / P;
   
       for f = 1:F
        for c = 1:C
            nd = im1(f, c);
            if nd > 0
                ndp = round(h(nd) * FE);
                ecualizada(f, c) = ndp;
            end
        end
    end
    imshow(im2);
  
endfunction