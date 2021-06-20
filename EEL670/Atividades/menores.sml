fun menores(e, nil) = nil
|   menores(e,L) =   
  let
    fun ordena(nil) = nil
    |   ordena(temp) =
      if hd temp < e then ordena(tl temp)@[hd temp] else ordena(tl temp)
  in
    ordena(L)
  end;


menores(3,[1,2,5]);
