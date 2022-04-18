function ecualizada = ecual(img)
  
  [F, C] = size(img);
  ecualizada = uint8(zeros(F,C));
  histograma = histo(img);
  P = sum(histograma);
  hac = 0;
   for nd = 1:length(histograma)
       hac = hac + histograma(nd);
       histograma(nd) = hac;
   end
   bar(histograma);

   FE = 255 / P; 
      for f = 1:F
        for c = 1:C
            nd = img(f, c);
            if nd > 0
                nd2 = round(histograma(nd) * FE);
                ecualizada(f, c) = nd2;
            end
        end 
    end
    imshow(ecualizada);

  
endfunction