% Questão 6a)

    % Projete filtros FIR que satisfaçam as especificações do Prob. 1 
    % usando os métodos 

    % a) das Janelas (função fir1)
    % b) Parks-McClellan (função firpm)

    % Especificações do Trabalho 1:

    % i.   Faixa de passagem: 0 - 0.3*pi
    % ii.  Faixa de rejeição: 0.5*pi - pi
    % iii. Atenuação de faixa > 60dB
    % iv.  rippleple na faixa de passagem < 0.005

    faixa_passagem = 0.3;
    faixa_rej = 0.5;
    ripple = abs(20* log10(1 - 0.005));
    atenua_rej = 60;

    % rippleple passagem
    rp = 0.005;

    % atenuação rejeição (dB)
    rs = 60; 

    dev = [rp 10^(-rs/20)]; 

% a) das Janelas (função fir1)

        [n_kaiser,Wn_kaiser] = kaiserord([0.3 0.5],[0 1],dev);
        B1 = fir1(n_kaiser,Wn_kaiser);
        freqz(B1,1,512)
        title('Resposta em frequência do Método das Janelas - Kaiser', 'FontSize', fontsize);
        %print('Kaiser_firpm','-dpng','-r0')

    % b) Parks-McClellan (função firpm)

        [n,fo,ao,w] = firpmord([0.3 0.5],[1 0],dev);
        B2 = firpm(n,fo,ao,w);
        freqz(B2,1,512)
        title('Resposta em frequência do Método Parks-McClellan (firpm)', 'FontSize', fontsize);
        %print('Parks-McClellan_firpm','-dpng','-r0')

%6b) Repetindo o Problema 2

    f16 = 16e3;
    [musica, Fs] = audioread('musica_original.wav');
    musica16k = resample(musica, 16000, Fs); % diminui a taxa de amostragem para 16k
    musica16k = musica16k(:,1);
    %soundsc(musica16k, f16);

    [voz, Fs] = audioread('conversa_original.wav');
    conversa16k = resample(voz, 16000, Fs); % diminui a taxa de amostragem para 16k
    conversa16k =  conversa16k(:,1);
    %soundsc(conversa16k, f16);

    % Método das Janelas - Kaiser

        y = filter(B1, 1, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
        title('Kaiser - música')
        print('Kaiser_spec_mus','-dpng','-r0')

        y = filter(B1, 1, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
        title('Kaiser - conversa')
        print('Kaiser_spec_conv','-dpng','-r0')


    % Parks-McClellan 

        y = filter(B2,1, musica16k);
        figure;
        janela = round((0.02*length(musica16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
        title('Parks-McClellan  - música')
        print('Parks-McClellan _spec_mus','-dpng','-r0')

        y = filter(B2,1, conversa16k);
        figure;
        janela = round((0.02*length(conversa16k))/10);
        overlap = round(janela/2);
        spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
        %soundsc(y, f16);
        xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
        title('Parks-McClellan  - conversa')
        print('Parks-McClellan _spec_conv','-dpng','-r0')

