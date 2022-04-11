function im2= ndvi(n, r)
  
  [F,C]= size(n);%Suponemos misma dimensión bandas
  im2 = uint8(zeros(F,C,3));
  for f = 1:F
    for c = 1:C
      nd = im1(f,c);
      ndn = double(n(f,c)) / 255;
      ndr = double(r(f,c)) / 255; %se recomienda también hacer estas divisiones después de la comprobación.
      if (ndn>0 & ndr>0)
        ndvi = (ndn - ndr) / (ndn + ndr);
        %al estar normalizado, va de -1 a 1. Hay que cambiar el rango para que no salga todo negro
        %Tenemos que ajustarlo. Llevamos resultados a rango 1, 255 para poder visualizarlo.
        %aunque cálculo estaba perfecto hasta este punto)
        ndvi = 255 * (ndvi +1)/2 %ahora ya está en rango (0, 255)
        if ndvi == 0
          ndvi = 1; %Para respetar la distinción nd=0 inválido.
        endif
        im2(f,c)= rvi;
        %Se recomienda colorear solo los que están de 128 para arriba y poner de gris los que están hacia abajo de 128
        %Rangos de rvi no ocupan lo mismo.
        %recomendado rango 128, 192, pero recomienda ajustar según nuestro histograma
      endif
    endfor
  endfor
  imshow(im2);
endfunction
