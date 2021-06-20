fun ordena(a:real, b:real, c:real) = 

  if (a <= b andalso b <= c) then a::b::c::[] 

  else if (a <= c andalso c <= b) then a::c::b::[] 
    
    else if (b <= a andalso a <= c) then b::a::c::[] 
    
      else if (b <= c andalso c <= a) then b::c::a::[] 

        else if (c <= a andalso a <= b) then c::a::b::[]

          else if (c <= b andalso b <= a) then c::b::a::[] else nil;
  
  
ordena(4.0,7.0,3.0);

