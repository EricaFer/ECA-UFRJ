% Questão 5
% a)

    FaixPas = [.2 .6];
    FaixRej = [.1 .7];
    Rip = abs(20* log10(1 - 0.01));
    AtenuRej = 40;

    %A-Butterworth

    fontsize = 13;

    [Nbut,Wbut] = buttord(FaixPas,FaixRej,Rip,AtenuRej);
    [B1,A1] = butter(Nbut,Wbut);


    [H1,W1] = freqz (B1,A1);
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %Módulo
    dB = mag2db(abs(H1));
    subplot(2,2,[1 2]);plot (W1/pi, dB,'k','LineWidth',2);title('Resposta em frequência para o método Butterworth', fontsize);
    xlabel('Frequência normalizada');ylabel('Módulo')
    %Fase
    subplot(2,2,[3 4]);plot (W1/pi,unwrap(angle(H1)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
    print('Butterworth_modfas','-dpng','-r0')
        
    %B-Chebyshev1 e Chebyshev2
    % Chebyshev1

    [Nche1,Wche1] = cheb1ord(FaixPas,FaixRej,Rip,AtenuRej);
    [B2,A2] = cheby1(Nche1,Rip,Wche1);

    [H2,W2] = freqz (B2,A2);
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %Módulo
    dB = mag2db(abs(H2));
    subplot(2,2,[1 2]);plot (W2/pi, dB,'k','LineWidth',2);title('Resposta em frequência para o método Chebyshev1', fontsize);
    xlabel('Frequência normalizada');ylabel('Módulo')
    %Fase
    subplot(2,2,[3 4]);plot (W2/pi,unwrap(angle(H2)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
    print('Chebyshev1_modfas','-dpng','-r0')
        
    % Chebyshev2

    [Nche2,Wche2] = cheb2ord(FaixPas,FaixRej,Rip,AtenuRej);
    [B3,A3] = cheby2(Nche2,AtenuRej,Wche2);
    [H3,W3] = freqz (B3,A3);   
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %Módulo
    dB = mag2db(abs(H3));
    subplot(2,2,[1 2]);plot (W3/pi, dB,'k','LineWidth',2);title('Resposta em frequência para o método Chebyshev2', fontsize);
    xlabel('Frequência normalizada');ylabel('Módulo')
    %Fase
    subplot(2,2,[3 4]);plot (W3/pi,unwrap(angle(H3)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
    print('Chebyshev2_modfas','-dpng','-r0')

    %C-Eliptica

    [Nelipt,Welipt] = ellipord(FaixPas,FaixRej,Rip,AtenuRej);
    [B4,A4] = ellip(Nelipt,Rip,AtenuRej,Welipt);

    [H4,W4] = freqz (B4,A4); 
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %Módulo
    dB = mag2db(abs(H4));
    subplot(2,2,[1 2]);plot (W4/pi, dB,'k','LineWidth',2);title('Resposta em frequência para o método Eliptico', fontsize);
    xlabel('Frequência normalizada');ylabel('Módulo')
    %Fase
    subplot(2,2,[3 4]);plot (W4/pi,unwrap(angle(H4)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequência normalizada');ylabel('Fase')
    print('Eliptico_modfas','-dpng','-r0')

% Questão 5
% b)

    f16 = 16e3;
    [musica, Fs] = audioread('musica_original.wav');
    musica16k = resample(musica, 16000, Fs); % diminui a taxa de amostragem para 16k
    musica16k = musica16k(:,1);
    %soundsc(musica16k, f16);

    [voz, Fs] = audioread('conversa_original.wav');
    conversa16k = resample(voz, 16000, Fs); % diminui a taxa de amostragem para 16k
    conversa16k =  conversa16k(:,1);
    %soundsc(conversa16k, f16);

    % Butterworth

    y = filter(B1, A1, musica16k);
    figure;
    janela = round((0.02*length(musica16k))/10);
    overlap = round(janela/2);
    spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
    soundsc(y, f16);
    xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
    title('Butterworth - música', fontsize)
    print('Butterworth_spec_mus','-dpng','-r0')

    y = filter(B1, A1, conversa16k);
    figure;
    janela = round((0.02*length(conversa16k))/10);
    overlap = round(janela/2);
    spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
    soundsc(y, f16);
    xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
    title('Butterworth - conversa', fontsize)
    print('Butterworth_spec_conv','-dpng','-r0')


    % Chebyshev 1

    y = filter(B2, A2, musica16k);
    figure;
    janela = round((0.02*length(musica16k))/10);
    overlap = round(janela/2);
    spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
    soundsc(y, f16);
    xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
    title('Chebyshev1 - música', fontsize)
    print('Chebyshev1_spec_mus','-dpng','-r0')

    y = filter(B2, A2, conversa16k);
    figure;
    janela = round((0.02*length(conversa16k))/10);
    overlap = round(janela/2);
    spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
    soundsc(y, f16);
    xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
    title('Chebyshev1 - conversa', fontsize)
    print('Chebyshev1_spec_conv','-dpng','-r0')

    % Chebyshev 2

    y = filter(B3, A3, musica16k);
    figure;
    janela = round((0.02*length(musica16k))/10);
    overlap = round(janela/2);
    spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
    soundsc(y, f16);
    xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
    title('Chebyshev2 - música', fontsize)
    print('Chebyshev2_spec_mus','-dpng','-r0')


    y = filter(B3, A3, conversa16k);
    figure;
    janela = round((0.02*length(conversa16k))/10);
    overlap = round(janela/2);
    spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
    %soundsc(y, f16);
    xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
    title('Chebyshev2 - conversa', fontsize)
    print('Chebyshev2_spec_conv','-dpng','-r0')


    % Eliptica

    y = filter(B4, A4, musica16k);
    figure;
    janela = round((0.02*length(musica16k))/10);
    overlap = round(janela/2);
    spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
    soundsc(y, f16);
    xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
    title('Eliptica - música', fontsize)
    print('Eliptica_spec_mus','-dpng','-r0')

    y = filter(B4, A4, conversa16k);
    figure;
    janela = round((0.02*length(conversa16k))/10);
    overlap = round(janela/2);
    spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
    %soundsc(y, f16);
    xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
    title('Eliptica - conversa', fontsize)
    print('Eliptica_spec_conv','-dpng','-r0')