function im2= ndvi(n, r)
  
  [F,C]= size(n);%Suponemos misma dimensi�n bandas
  im2 = uint8(zeros(F,C,3));
  for f = 1:F
    for c = 1:C
      nd = im1(f,c);
      ndn = double(n(f,c)) / 255;
      ndr = double(r(f,c)) / 255; %se recomienda tambi�n hacer estas divisiones despu�s de la comprobaci�n.
      if (ndn>0 & ndr>0)
        ndvi = (ndn - ndr) / (ndn + ndr);
        %al estar normalizado, va de -1 a 1. Hay que cambiar el rango para que no salga todo negro
        %Tenemos que ajustarlo. Llevamos resultados a rango 1, 255 para poder visualizarlo.
        %aunque c�lculo estaba perfecto hasta este punto)
        ndvi = 255 * (ndvi +1)/2 %ahora ya est� en rango (0, 255)
        if ndvi == 0
          ndvi = 1; %Para respetar la distinci�n nd=0 inv�lido.
        endif
        im2(f,c)= rvi;
        %Se recomienda colorear solo los que est�n de 128 para arriba y poner de gris los que est�n hacia abajo de 128
        %Rangos de rvi no ocupan lo mismo.
        %recomendado rango 128, 192, pero recomienda ajustar seg�n nuestro histograma
      endif
    endfor
  endfor
  imshow(im2);
endfunction
