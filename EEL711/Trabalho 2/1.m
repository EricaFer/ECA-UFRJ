%Questão 1
    FaixPas = 0.3;
    FaixRej = 0.5;
    Rip = abs(20* log10(1 - 0.005));
    AtenuRej = 60;

    %Butterworth
        [Nbut,Wbut] = buttord(FaixPas,FaixRej,Rip,AtenuRej);
        [B1,A1] = butter(Nbut,Wbut);
        Butterwoth = filt(B1,A1);

        [H1,W1] = freqz (B1,A1);
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])

        %Resposta em frequência
        dB = mag2db(abs(H1));
        subplot(2,2,[1 2]);plot (W1/pi, dB,'k','LineWidth',2);title('Butterworth');
        xlabel('Frequência normalizada');ylabel('Módulo')

        subplot(2,2,[3 4]);plot (W1/pi,unwrap(angle(H1)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Butterworth_modfas','-dpng','-r0')


    % Chebyshev1
        [Nche1,Wche1] = cheb1ord(FaixPas,FaixRej,Rip,AtenuRej);
        [B2,A2] = cheby1(Nche1,Rip,Wche1);
        Chebyshev1 = filt(B2,A2);

        [H2,W2] = freqz (B2,A2);
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])

        %Resposta em frequência
        dB = mag2db(abs(H2));
        subplot(2,2,[1 2]);plot (W2/pi, dB,'k','LineWidth',2);title('Chebyshev1');
        xlabel('Frequência normalizada');ylabel('Módulo')

        subplot(2,2,[3 4]);plot (W2/pi,unwrap(angle(H2)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Chebyshev1_modfas','-dpng','-r0')

    % Chebyshev2
        [Nche2,Wche2] = cheb2ord(FaixPas,FaixRej,Rip,AtenuRej);
        [B3,A3] = cheby2(Nche2,AtenuRej,Wche2);
        Chebyshev2 = filt(B3,A3);

        [H3,W3] = freqz (B3,A3);   
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])

        %Resposta em frequência
        dB = mag2db(abs(H3));
        subplot(2,2,[1 2]);plot (W3/pi, dB,'k','LineWidth',2);title('Chebyshev2');
        xlabel('Frequência normalizada');ylabel('Módulo')

        subplot(2,2,[3 4]);plot (W3/pi,unwrap(angle(H3)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Chebyshev2_modfas','-dpng','-r0')

    %Elíptico
        [Nelipt,Welipt] = ellipord(FaixPas,FaixRej,Rip,AtenuRej);
        [B4,A4] = ellip(Nelipt,Rip,AtenuRej,Welipt);
        Eliptico = filt(B4,A4); 
        
        [H4,W4] = freqz (B4,A4); 
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])

        %Resposta em frequência
        dB = mag2db(abs(H4));
        subplot(2,2,[1 2]);plot (W4/pi, dB,'k','LineWidth',2);title('Eliptico');
        xlabel('Frequência normalizada');ylabel('Módulo')

        subplot(2,2,[3 4]);plot (W4/pi,unwrap(angle(H4)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Eliptico_modfas','-dpng','-r0')
    
