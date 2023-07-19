%Questão 4 
    %Butterworth
    
        [B9,A9] = iirlp2hp(B1, A1, 0.4, 0.6);

        [H9,W9] = freqz (B9,A9);
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
        
        %Resposta em frequência
        dB = mag2db(abs(H9));
        subplot(2,2,[1 2]);plot (W5/pi, dB,'k','LineWidth',2);title('Butterworth');
        xlabel('Frequência normalizada');ylabel('Módulo')
        
        subplot(2,2,[3 4]);plot (W5/pi,unwrap(angle(H9)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Butterworth_modfas','-dpng','-r0')
    
        y = filter(B9, A9, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B9, A9, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        
    %Chebyshev 1
        [B10,A10] = iirlp2hp(B2, A2, 0.4, 0.6);

        [H10,W10] = freqz (B10,A10);
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
        
        %Resposta em frequência
        dB = mag2db(abs(H10));
        subplot(2,2,[1 2]);plot (W10/pi, dB,'k','LineWidth',2);title('Chebyshev1');
        xlabel('Frequência normalizada');ylabel('Módulo')
        
        subplot(2,2,[3 4]);plot (W10/pi,unwrap(angle(H10)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Chebyshev1_modfas','-dpng','-r0')
    
        y = filter(B10, A10, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B10, A10, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        
     %Chebyshev 2    
        [B11,A11] = iirlp2hp(B3, A3, 0.4, 0.6);

        [H11,W11] = freqz (B11,A11);   
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
        
        %Resposta em frequência
        dB = mag2db(abs(H11));
        subplot(2,2,[1 2]);plot (W11/pi, dB,'k','LineWidth',2);title('Chebyshev2');
        xlabel('Frequência normalizada');ylabel('Módulo')
        
        subplot(2,2,[3 4]);plot (W11/pi,unwrap(angle(H11)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Chebyshev2_modfas','-dpng','-r0')
    
        y = filter(B11, A11, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B11, A11, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        
    %Eliptica  
        [B12,A12] = iirlp2hp(B4, A4, 0.4, 0.6);

        [H12,W12] = freqz (B12,A12); 
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
        
        %Resposta em frequência
        dB = mag2db(abs(H12));
        subplot(2,2,[1 2]);plot (W12/pi, dB,'k','LineWidth',2);title('Eliptico');
        xlabel('Frequência normalizada');ylabel('Módulo')
        
        subplot(2,2,[3 4]);plot (W12/pi,unwrap(angle(H12)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Eliptico_modfas','-dpng','-r0')    
        
        y = filter(B12, A12, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B12, A12, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);