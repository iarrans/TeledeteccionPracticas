function im2= rvi(n, r)
  
  [F,C]= size(n);%Suponemos misma dimensión bandas
  im2 = uint8(zeros(F,C,3));
  for f = 1:F
    for c = 1:C
      nd = im1(f,c);
      ndn = double(n(f,c)) / 255;
      ndr = double(r(f,c)) / 255;
      if (ndn>0 & ndr>0)
        rvi = ndn / ndr;
        %podemos, para que no salga todo negro por bajos nd,podemos hacer corte de colas
        %a imagen resultante para mayor contraste o podemos multiplicar las salidas del rvi por una cte.
        im2(f,c)= rvi;
      endif
    endfor
  endfor
  imshow(im2);
endfunction
