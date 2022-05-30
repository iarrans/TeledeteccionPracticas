function im3 = isodata(im1,numGrupos)
  %Ejercicio 6.1
  [F,C,B] = size(im1);
  %Ubicación inicial de los centros
  k = 0;
  b = 1;
  while b==1
      b = 0;
      f = round(1 + rand * (F - 1));
      c = round(1 + rand * (C - 1));
      v1 = double(im1(f,c,:));
      f = round(1 + rand * (F - 1));
      c = round(1 + rand * (C - 1));
      v2 = double(im1(f,c,:));
      if prod([v1(1),v1(2),v2(1),v2(2)]) == 0
        b =1;%Para que producto de los centros no de 0 y evita rproblemas después
      endif
  endwhile
  im2 = zeros(F,C);
  k = 0;
  b = 1;
  while b==1 && k<1000
    b = 0;
    for f = 1:F
      for c = 1:C
        nd1 = double(im1(f,c,1));
        nd1 = double(im1(f,c,2));
        %Fase de asignación
        
        %medir disrancias
        if nd1 > 0&& nd2 > 0
          d1 = sqrt((v1(1)-nd1)^2+(v1(2)-nd2)^2);
          d2 = sqrt((v2(1)-nd1)^2+(v2(2)-nd2)^2);
          %asignar categoría según menor distancia
          if d1 < d2
            if im2(f,c) ~= 1
              im2(f,c) = 1;
              b = 1;
            endif
          else
            if im2(f,c) ~= 2
              im2(f,c) = 2;
            endif
          endif
        endif
      endfor
    endfor
    im1b1 = im1(:,:,1);
    im1b2 = im1(:,:,2);
    im1b1r = reshape(im1b1,1, []);
    im1b2r = reshape(im1b2,1, []);
    hold off;
    plot(im1b1,im1b2,'.b');
    hold on;
    plot(v1(1),v1(2),'or');
    plot(v2(1),v2(2),'om');
    %Mover los centros
    Pixeles1 = sum(sum(im2 ==1));
    Pixeles2 = sum(sum(im2 ==2));
    v1(1) = mean(mean(im1b1(im2==1)));
    v1(2) = mean(mean(im1b1(im2==1)));
    v2(1) = mean(mean(im1b1(im2==2)));
    v2(2) = mean(mean(im1b1(im2==2)));
    plot(v1(1),v1(2),'*r');
    plot(v2(1),v2(2),'*g');
    k = k+ 1
  endwhile

%pseudocolor para pintar la imagen
hold off;
im3 = zeros(F,C,3);
for f = 1:F
  for c = 1:C
    nd = im2(f,c)
    if nd==1
      im3(f,c,:) = [255,0,0]; %categoría 1
    else
      if nd==2
        im3(f,c,:) = [0,255,0];%categoría 2
      endif
    endif
  endfor
endfor
imshow(im3);
  
endfunction
