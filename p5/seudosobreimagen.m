function im2 = seudosobreimagen(im1)
  [F,C] = size(im1);
  im2= uint8(zeros(F,C,3));
  for f = 1:F
    sprintf(Procesando fila %d, f)
    for c = 1:C
      nd = im1(f,c);
      if (nd>0)
        if nd<40
          im2(f,c,:) = [0,0,255];%ej: si nd<40, coloreamos de azul. Condición variable.
        else
        im2(f,c,:) = im1(f,c,:);%ej: si nd<40, coloreamos de azul. Condición variable.
        endif
      endif
    endfor
  endfor
  imshow(im2);
endfunction
