function zamik = fnVskladiKota(alfa1, alfa2)
% Vskladi meritev kota glede na to katera je daljsa meritev, oz katera ima
% daljse posneto mirovanje :D
% Vsklajevanje je vedno narejeno tako da je alfa1 daljsi od alfa2, torej je
% treba biti pozoren pri klicu funkcije kateri signal je daljsi od drugega

    alfa1Enosmerna = mean(alfa1);
    alfa1 = alfa1 - mean(alfa1);
    alfa2 = alfa2 - mean(alfa2);
    [alfa1, alfa2] = fnSkrajsajSignala(alfa1, alfa2);


    

    Rxy = fnRxyf(alfa2, alfa1);
    zamik = find(Rxy==max(Rxy));




end