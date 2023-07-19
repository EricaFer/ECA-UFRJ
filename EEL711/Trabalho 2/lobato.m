FaixPas = [.2 .6];
FaixRej = [.1 .7];
Rip = abs(20* log10(1 - 0.01));
AtenuRej = 40;

format shortE
%H(Z) = B(Z)/A(Z)
%---------------Letra A--------------


% Butterworth
    [Nbut,Wbut] = buttord(FaixPas,FaixRej,Rip,AtenuRej);
    [B1,A1] = butter(Nbut,Wbut);
    Butterwoth = filt(B1,A1)
    %zplane
    %h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %zplane(B1,A1);title('Butterworth')
    %
    %print('Questao5aButterworth-ZPlane','-dpng','-r0')
    
    [H1,W1] = freqz (B1,A1);
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %Módulo
    dB = mag2db(abs(H1));
    subplot(2,2,[1 2]);plot (W1/pi, dB,'k','LineWidth',2);title( 'Filtro - Butterworth');
    xlabel('Frequência normalizada');ylabel('Módulo')
    %Fase
    subplot(2,2,[3 4]);plot (W1/pi,unwrap(angle(H1)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
    %print('Q1Butterworth-MOD_FAS','-dpng','-r0')
    
    

%---------------Letra B--------------  
 % Chebyshev1
    [Nche1,Wche1] = cheb1ord(FaixPas,FaixRej,Rip,AtenuRej);
    [B2,A2] = cheby1(Nche1,Rip,Wche1);
    Chebyshev1 = filt(B2,A2)
    %zplane
    %h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %zplane(B2,A2);title('Chebyshev1')
    %print('Questao5bChebyshev1-ZPlane','-dpng','-r0')
    
    [H2,W2] = freqz (B2,A2);
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %Módulo
    dB = mag2db(abs(H2));
    subplot(2,2,[1 2]);plot (W2/pi, dB,'k','LineWidth',2);title('Filtro - Chebyshev1');
    xlabel('Frequência normalizada');ylabel('Módulo')
    %Fase
    subplot(2,2,[3 4]);plot (W2/pi,unwrap(angle(H2)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
    %print('Q1Chebyshev1-MOD_FAS','-dpng','-r0')
    

% Chebyshev2
    [Nche2,Wche2] = cheb2ord(FaixPas,FaixRej,Rip,AtenuRej);
    [B3,A3] = cheby2(Nche2,AtenuRej,Wche2);
    Chebyshev2 = filt(B3,A3)
    %zplane
    %h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %zplane(B3,A3);title('Chebyshev2')
    %print('Questao5bChebyshev2-ZPlane','-dpng','-r0')
    
    [H3,W3] = freqz (B3,A3);   
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %Módulo
    dB = mag2db(abs(H3));
    subplot(2,2,[1 2]);plot (W3/pi, dB,'k','LineWidth',2);title('Filtro- Chebyshev2');
    xlabel('Frequência normalizada');ylabel('Módulo')
    %Fase
    subplot(2,2,[3 4]);plot (W3/pi,unwrap(angle(H3)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
    %print('Q1Chebyshev2-MOD_FAS','-dpng','-r0')


%---------------Letra C--------------
% Eliptica
    [Nelipt,Welipt] = ellipord(FaixPas,FaixRej,Rip,AtenuRej);
    [B4,A4] = ellip(Nelipt,Rip,AtenuRej,Welipt);
    Eliptico = filt(B4,A4)   
    %zplane
    %h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %zplane(B4,A4);title('Elíptico')
    %print('Questao5cEliptico-ZPlane','-dpng','-r0')
    
    [H4,W4] = freqz (B4,A4); 
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %Módulo
    dB = mag2db(abs(H4));
    subplot(2,2,[1 2]);plot (W4/pi, dB,'k','LineWidth',2);title('Filtro - Eliptico');
    xlabel('Frequência normalizada');ylabel('Módulo')
    %Fase
    subplot(2,2,[3 4]);plot (W4/pi,unwrap(angle(H4)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
    %print('Q1Eliptico-MOD_FAS','-dpng','-r0')