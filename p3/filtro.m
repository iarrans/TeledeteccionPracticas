##LAB3 - Filtrado
#{
  Escriba una función llamada filtro que realice el filtrado lineal de una imagen
  monobanda a partir de una matriz 3£3 de coeficientes de filtrado indicada como
  parámetro de entrada. La función debe devolver la imagen resultante así como visualizarla
  en pantalla.
#}

function filtrada = filtro(im1, coeficientes)
  %En primer lugar, normalizamos coeficientes
  
  suma = sum(sum(abs(coeficientes)));
  coeficientes = coeficientes * 1/suma;
  
  %Aplicamos el filtro a la imagen
  [F,C]= size(im1);
  im2 = uint8(zeros(F,C));
  for f = 2: F-1
    for c= 2:C-1
      nd = im1(f-1:f+1,c-1:c+1);
      if nd(2,2)>0
        ndp = sum(sum(double(nd).*coeficientes));
        im2(f,c) = uint8(ndp);
      endif
    endfor
  endfor
  figure(1);
  imshow(im1);
  figure(2);
  imshow(im2);
  filtrada = im2;
endfunction
