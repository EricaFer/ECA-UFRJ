%Questão 2
    f16 = 16e3;
    [musica, Fs] = audioread('musica_original.wav');
    musica16k = resample(musica, 16000, Fs); %diminui a taxa de amostragem para 16k
    musica16k = musica16k(:,1);
    %soundsc(musica16k, f16);

    [voz, Fs] = audioread('conversa_original.wav');
    conversa16k = resample(voz, 16000, Fs); %diminui a taxa de amostragem para 16k
    conversa16k =  conversa16k(:,1);
    %soundsc(conversa16k, f16);

    % Butterworth
        y = filter(B1, A1, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B1, A1, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

    % Chebyshev 1
        y = filter(B2, A2, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B2, A2, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

    % Chebyshev 2
        y = filter(B3, A3, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B3, A3, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

    % Eliptica
        y = filter(B4, A4, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);

        y = filter(B4, A4, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        
