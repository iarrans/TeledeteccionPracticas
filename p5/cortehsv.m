function im2 = cortehsv(im1)
  %ejercicio 5.5, entra color verdadero rgb
  %Paso 1: Transforme la combinación (RGB) al dominio HSV.----------------------
  im1hsv = uint8(rgb2hsv(im1).* 255);
  S = im1hsv(:,:,2);
  %Paso 2: Realice un corte de colas de la componente S o de la componente V.-----------------------------
  im1hsv(:,:,2) =  corte(S,1);%usamos las funciones desarrolladas durante la práctica 3
  %Paso 3: Transforme la imagen resultante (HSV) de nuevo al dominio RGB.----------------------------
  im2hsv = double(im1hsv)./ 255;
  im2=hsv2rgb(im2hsv);
  im2 = uint8(im2 .* 255);
  imshow(im2);
endfunction