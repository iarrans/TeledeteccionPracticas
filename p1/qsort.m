
function f = qsort(x)
  
    tam = length(x);
    
    if tam <= 1
      f = x;
    else

      p = x(1);
      aord = [];
      bord = [];
      
        for e = 2:tam
            if x(e) <= p
              aord(end+1) = x(e);
             else 
              bord(end+1) = x(e);
            endif
        end
      
      f = [ qsort(aord) p qsort(bord) ];
      
      
    endif
   
endfunction

