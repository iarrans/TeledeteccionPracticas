function im2 = densi(im1)
  %ejercicio 5.4
  %con histo(img ndvi) se pueden apreciar mejor distintos rangos. 
  %Falta ajustar colores para imagen final, pero funciona
  %junto con ajuste, falta indicar la leyenda
  [F,C] = size(im1);
  im2= uint8(zeros(F,C,3));
  for f = 1:F
    for c = 1:C
      nd = im1(f,c);
      if (nd>0)
        if nd<120
          im2(f,c,:) = [0,0,255];%ej: si nd<120, coloreamos de azul. Condición variable.
        endif
        if (nd>120 && nd<150)
          im2(f,c,:) = [0,160,160];%ej: si nd<40, coloreamos de azul. Condición variable.
        endif
        if (nd>150 && nd<170)
          im2(f,c,:) = [0,255,0];%ej: si nd<40, coloreamos de azul. Condición variable.
        endif
        if (nd>170 && nd<190)
          im2(f,c,:) = [160,160,0];%ej: si nd<40, coloreamos de azul. Condición variable.
        endif
        if (nd>190 && nd<200)
          im2(f,c,:) = [255,0,0];%ej: si nd<40, coloreamos de azul. Condición variable.
        endif
      else
        im2(f,c,:) = [0,0,0];%ej: si nd<40, coloreamos de verde. Condición variable.
      endif
    endfor
  endfor
  imshow(im2);
endfunction
