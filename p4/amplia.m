#{
    Escriba una función llamada amplia que realice la ampliación de una imagen
    mediante la técnica de interpolación bilineal. Suponga un factor de escalado R Æ 2
    constante. Es decir, la imagen resultante debe tener el doble de filas y el doble de
    columnas.
#}

function ampliada= amplia(img)
  
  %Creamos imagen doble 
  [F, C] = size(img);
  ampliada = zeros(2*F, 2*C);
  %Colocamos píxeles de la imagen original cada dos píxeles 
  ampliada(1:2:2*F, 1:2:2*C) = img;
  %Bucle que realiza la interpolación entre los píxeles de las filas
  for f = 1:2:2*F
    for c = 2:(2*C)-1
        if mod(c, 2) == 0%Si se encuentra en una posición par se trata de una columna ampliada
            nd1 = ampliada(f, c-1); %Pixel de la izquierda  
            nd2 = ampliada(f, c+1); %Pixel de la derecha
            ndp = (nd1 + nd2) / 2; %Valor píxel ampliado (media)
            ampliada(f, c) = ndp; %se asigna el valor en esa fila y columna
        endif
    end    
  end
  
  %Bucle que realiza la interpolación entre los píxeles de las columnas
  for f = 2:(2*F)-1
      if mod(f, 2) == 0%Si se encuentra en una posición par se trata de una fila ampliada
          f1 = ampliada(f -1, :);%Pixel de la izquierda 
          f2 = ampliada(f + 1, :);%Pixel de la derecha
          fnd = (f1 + f2) / 2;%Valor píxel ampliado (media)
          ampliada(f, :) = fnd; %se asigna el valor en los valores de esa columna
      endif
  end
  
  %%Corrección de extremos (última columna y última fila)
ampliada(2*F,:)= ampliada((2*F)-1,:);
ampliada(:,2*C)= ampliada(:,(2*C)-1);
  
    
ampliada = uint8(ampliada);
imshow(ampliada);

 
endfunction

%>> gris = imread('bn2graydiezma.png');