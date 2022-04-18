function cortada = corte(img, porcentaje)
  #Primero, calculamos los nd a los que hay que hacer el corte
  h = histo(img);
  numpix = sum(h);
  limitepix = uint8(numpix * (porcentaje/100));
  limitepix
  lowercounter = 0;
  uppercounter = 0;
  m = 0;
  M= 0;
  %Contar hasta que se alcance limitepix, tanto por arriba como por abajo, y ver
  % el nd resultante. Pasárselo a span.
  % [20, 2, 5, 7, 8,...,]
  for i = 1:1:length(h)
    lowercounter = lowercounter + h(i);
    if (lowercounter >= limitepix)
      m = i;
      break
    endif  
  endfor

  
  for i = length(h):-1:1
    uppercounter = uppercounter + h(i);
    if (uppercounter >= limitepix)
      M = i;
      break
    endif  
  endfor
  m
  M
  
  cortada = span(img, m, M);
endfunction