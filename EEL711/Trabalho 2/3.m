%Questão 3
    % Butterworth
        [B5,A5] = iirlp2lp(B1, A1, 0.4, 0.2);

        [H5,W5] = freqz (B5,A5);
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
        
        %Resposta em frequência
        dB = mag2db(abs(H5));
        subplot(2,2,[1 2]);plot (W5/pi, dB,'k','LineWidth',2);title('Butterworth');
        xlabel('Frequência normalizada');ylabel('Módulo')
        
        subplot(2,2,[3 4]);plot (W5/pi,unwrap(angle(H5)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Butterworth_modfas','-dpng','-r0')
    
        y = filter(B5, A5, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B5, A5, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        
        
    % Chebyshev 1
        [B6,A6] = iirlp2lp(B2, A2, 0.4, 0.2);

        [H6,W6] = freqz (B6,A6);
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
        
        %Resposta em frequência
        dB = mag2db(abs(H6));
        subplot(2,2,[1 2]);plot (W6/pi, dB,'k','LineWidth',2);title('Chebyshev1');
        xlabel('Frequência normalizada');ylabel('Módulo')
        
        subplot(2,2,[3 4]);plot (W6/pi,unwrap(angle(H6)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Chebyshev1_modfas','-dpng','-r0')
        
        y = filter(B6, A6, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B6, A6, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

    % Chebyshev 2
        [B7,A7] = iirlp2lp(B3, A3, 0.4, 0.2);

        [H7,W7] = freqz (B7,A7);   
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
        
        %Resposta em frequência
        dB = mag2db(abs(H7));
        subplot(2,2,[1 2]);plot (W7/pi, dB,'k','LineWidth',2);title('Chebyshev2');
        xlabel('Frequência normalizada');ylabel('Módulo')
        
        subplot(2,2,[3 4]);plot (W7/pi,unwrap(angle(H7)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Chebyshev2_modfas','-dpng','-r0')
        
        y = filter(B7, A7, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B7, A7, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
    
    % Eliptica
        [B8,A8] = iirlp2lp(B4, A4, 0.4, 0.2);

        [H8,W8] = freqz (B8,A8); 
        h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
        
        %Resposta em frequência
        dB = mag2db(abs(H8));
        subplot(2,2,[1 2]);plot (W8/pi, dB,'k','LineWidth',2);title('Eliptico');
        xlabel('Frequência normalizada');ylabel('Módulo')
        
        subplot(2,2,[3 4]);plot (W8/pi,unwrap(angle(H8)),'k','LineWidth',2);
        xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
        print('Eliptico_modfas','-dpng','-r0')
        
        y = filter(B8, A8, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B8, A8, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
       
        
