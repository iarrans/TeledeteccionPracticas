function e = ecualizacion() 
  h = zeros(1, 256);  
  % PROBABILIDAD DE CADA NIVEL DE GRIS:
  pixelesTotales = F*C;
  probabilidad = zeros(1,256);
  for k = 1:256
  probabilidad(k)= h(k)/pixelesTotales;
  end for;

  % VECTOR ACUMULADA (255 elementos):
  acumulada = zeros(1,256);
  acumulada(1) = p(1); % Del pixel 0 es p0
  for k = 2:256
      acumulada(k) = acumulada(k-1) + probabilidad(k);
  endfor

  % VECTOR ECUALIZADOR (transformación del gris):
  ecualizador = zeros(1,256);
  for k = 1:256
      ecualizador(k) = acumulada(k)*256;
  endfor
  
  % SUSTITUIMOS LOS NIVELES EN BASE AL ECUALIZADOR:
  v = zeros(F,C);
  for i = 1:F
    for j = 1:C
        v(i,j) = ecualizador(imagenGris(i,j)+1);
    endfor
  endfor
  
  % CONVERTIMOS A ENTERO:
  v = uint8(v);
  
  % MOSTRAMOS LA IMAGEN ECUALIZADA:
  imshow(v), title('Imagen Ecualizada');
  
  % HISTOGRAMA IMAGEN ECUALIZADA:
  h1 = zeros(1, 256); 
  for i = 1:F
    for j = 1:C
        h1(v(i,j)+1) = h1(v(i,j)+1)+1;
    endfor
  endfor
  
end