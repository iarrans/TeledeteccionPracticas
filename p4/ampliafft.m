function ampliada, psnr= ampliafft(img,R)
  
[F, C] = size(img);
F2 = F*R;
C2 = C*R;
%inicializamos imagen ampliada con ceros
ampliadafft = zeros(F2, C2);
%calculamos la fft de la imagen que nos llega por entrada
imgfft = fft2(img);

%
ampliadafft(1:F/2, 1:C/2) = imgfft(1:F/2, 1:C/2); %C1
ampliadafft(F2-(F/2)+1:F2, 1:C/2) = imgfft((F/2)+1:F, 1:C/2); %C2
ampliadafft(1:F/2, C2-(C/2)+1:C2) = imgfft(1:(F/2), (C/2)+1:C); %C3
ampliadafft(F2-(F/2)+1:F2, C2-(C/2)+1:C2) = imgfft((F/2)+1:F, (C/2)+1:C); %C4
ampliada = real(ifft2(ampliadafft)) * ((F2*C2)/(F*C)); %Recuperamos la imagen adecuando su amplitud
%

ampliada = uint8(ampliada);
imshow(ampliada); 
%Calculamos el psnr de la imagen
psnr = psnr(ampliada, img);
endfunction
