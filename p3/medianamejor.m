##LAB3 - Filtrado
function filtrada = medianamejor(im1)

  %Aplicamos el filtro a la imagen
  [F,C]= size(im1);
  im2 = uint8(zeros(F,C));
  for f = 2: F-1
    for c= 2:C-1
      nd = im1(f-1:f+1,c-1:c+1);  
      if(nd(2,2)<mean(nd))
        ndp = reshape(nd,1,9);
        im2(f,c) = median(ndp);
      else
        im2(f,c) = nd(2,2);
      endif   
    endfor
  endfor
  figure(1);
  imshow(im1);
  figure(2);
  imshow(im2);
  filtrada = im2;
endfunction
