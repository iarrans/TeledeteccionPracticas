function resultado = span(img, m, M)
  
[F,C] = size(img);
resultado = uint8(zeros(size(img)));

  for f= 1:F
    for c= 1:C
      nd = img(f,c);
      if (nd >0)
        resultado(f,c) = round((nd - m)*(254/(M-m))+1);
      endif
    endfor
  endfor 
  imshow(resultado);
endfunction