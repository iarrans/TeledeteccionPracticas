funcion im2 = filtro(im1, w)

[F, C] = size(im1);
im2 = uint8(zeros(F,C));

  for f = 2:F-1
      for c = 2:C-1
          nd = im1(f-1:f+1, c-1:c+1);
          %if nd(2,2) > 0
            nd = reshape(nd, 1, 9);
            %ndp = sum(sum(double(nd) .* w));
            ndp = median(nd);
            im2(f,c) = ndp;
          %endif
      endfor
  endfor