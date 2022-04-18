function h = histo(im)
  [F,C] = size(im);
  h = zeros(1, 255);
  for f= 1:F
    for c= 1:C
      nd = im(f,c);
      if (nd >0)
        h(nd) = h(nd) +1;
      endif
    endfor
  endfor
  bar(h)
endfunction
