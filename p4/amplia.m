#{
    Escriba una funci�n llamada amplia que realice la ampliaci�n de una imagen
    mediante la t�cnica de interpolaci�n bilineal. Suponga un factor de escalado R � 2
    constante. Es decir, la imagen resultante debe tener el doble de filas y el doble de
    columnas.
#}

function ampliada= amplia(img)
  
  %Creamos imagen doble 
  [F, C] = size(img);
  ampliada = zeros(2*F, 2*C);
  %Colocamos p�xeles de la imagen original cada dos p�xeles 
  ampliada(1:2:2*F, 1:2:2*C) = img;
  %Bucle que realiza la interpolaci�n entre los p�xeles de las filas
  for f = 1:2:2*F
    for c = 2:(2*C)-1
        if mod(c, 2) == 0%Si se encuentra en una posici�n par se trata de una columna ampliada
            nd1 = ampliada(f, c-1); %Pixel de la izquierda  
            nd2 = ampliada(f, c+1); %Pixel de la derecha
            ndp = (nd1 + nd2) / 2; %Valor p�xel ampliado (media)
            ampliada(f, c) = ndp; %se asigna el valor en esa fila y columna
        endif
    end    
  end
  
  %Bucle que realiza la interpolaci�n entre los p�xeles de las columnas
  for f = 2:(2*F)-1
      if mod(f, 2) == 0%Si se encuentra en una posici�n par se trata de una fila ampliada
          f1 = ampliada(f -1, :);%Pixel de la izquierda 
          f2 = ampliada(f + 1, :);%Pixel de la derecha
          fnd = (f1 + f2) / 2;%Valor p�xel ampliado (media)
          ampliada(f, :) = fnd; %se asigna el valor en los valores de esa columna
      endif
  end
  
  %%Correcci�n de extremos (�ltima columna y �ltima fila)
ampliada(2*F,:)= ampliada((2*F)-1,:);
ampliada(:,2*C)= ampliada(:,(2*C)-1);
  
    
ampliada = uint8(ampliada);
imshow(ampliada);

 
endfunction

%>> gris = imread('bn2graydiezma.png');