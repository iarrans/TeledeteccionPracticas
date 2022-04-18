##LAB3 - Filtrado
function filtrada = mediana(im1)

  %Aplicamos el filtro a la imagen
  [F,C]= size(im1);
  im2 = uint8(zeros(F,C));
  for f = 2: F-1
    for c= 2:C-1
      nd = im1(f-1:f+1,c-1:c+1);  
      ndp = reshape(nd,1,9);
      im2(f,c) = median(ndp);
    endfor
  endfor
  figure(1);
  imshow(im1);
  figure(2);
  imshow(im2);
  filtrada = im2;
endfunction
