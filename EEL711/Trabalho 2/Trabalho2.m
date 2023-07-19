%Quest�o 1
    FaixPas = 0.3;
    FaixRej = 0.5;
    Rip = abs(20* log10(1 - 0.005));
    AtenuRej = 60;

%A-Butterworth
    [Nbut,Wbut] = buttord(FaixPas,FaixRej,Rip,AtenuRej);
    [B1,A1] = butter(Nbut,Wbut);
    Butterwoth = filt(B1,A1);
    %zplane
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    zplane(B1,A1);title('Butterworth')
    print('Butterworth_Z','-dpng','-r0')
    
    [H1,W1] = freqz (B1,A1);
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %M�dulo
    dB = mag2db(abs(H1));
    subplot(2,2,[1 2]);plot (W1/pi, dB,'k','LineWidth',2);title('Butterworth');
    xlabel('Frequ�ncia normalizada');ylabel('M�dulo')
    %Fase
    subplot(2,2,[3 4]);plot (W1/pi,unwrap(angle(H1)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequ�ncia normalizada');ylabel('Fase')
    print('Butterworth_modfas','-dpng','-r0')
    
%B-Chebyshev1 e Chebyshev2
 % Chebyshev1
    [Nche1,Wche1] = cheb1ord(FaixPas,FaixRej,Rip,AtenuRej);
    [B2,A2] = cheby1(Nche1,Rip,Wche1);
    Chebyshev1 = filt(B2,A2);
    %zplane
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    zplane(B2,A2);title('Chebyshev1')
    print('Chebyshev1_Z','-dpng','-r0')
    
    [H2,W2] = freqz (B2,A2);
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %M�dulo
    dB = mag2db(abs(H2));
    subplot(2,2,[1 2]);plot (W2/pi, dB,'k','LineWidth',2);title('Chebyshev1');
    xlabel('Frequ�ncia normalizada');ylabel('M�dulo')
    %Fase
    subplot(2,2,[3 4]);plot (W2/pi,unwrap(angle(H2)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequ�ncia normalizada');ylabel('Fase')
    print('Chebyshev1_modfas','-dpng','-r0')
    
% Chebyshev2
    [Nche2,Wche2] = cheb2ord(FaixPas,FaixRej,Rip,AtenuRej);
    [B3,A3] = cheby2(Nche2,AtenuRej,Wche2);
    Chebyshev2 = filt(B3,A3);
    %zplane
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    zplane(B3,A3);title('Chebyshev2')
    print('Chebyshev2_Z','-dpng','-r0')
    
    [H3,W3] = freqz (B3,A3);   
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %M�dulo
    dB = mag2db(abs(H3));
    subplot(2,2,[1 2]);plot (W3/pi, dB,'k','LineWidth',2);title('Chebyshev2');
    xlabel('Frequ�ncia normalizada');ylabel('M�dulo')
    %Fase
    subplot(2,2,[3 4]);plot (W3/pi,unwrap(angle(H3)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequ�ncia normalizada');ylabel('Fase')
    print('Chebyshev2_modfas','-dpng','-r0')

%C-Eliptica
    [Nelipt,Welipt] = ellipord(FaixPas,FaixRej,Rip,AtenuRej);
    [B4,A4] = ellip(Nelipt,Rip,AtenuRej,Welipt);
    Eliptico = filt(B4,A4); 
    %zplane
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    zplane(B4,A4);title('El�ptico')
    print('Eliptico_Z','-dpng','-r0')
    
    [H4,W4] = freqz (B4,A4); 
    h = figure; set(h,'Units','Normalized','OuterPosition',[0 0 1 1])
    %M�dulo
    dB = mag2db(abs(H4));
    subplot(2,2,[1 2]);plot (W4/pi, dB,'k','LineWidth',2);title('Eliptico');
    xlabel('Frequ�ncia normalizada');ylabel('M�dulo')
    %Fase
    subplot(2,2,[3 4]);plot (W4/pi,unwrap(angle(H4)),'k','LineWidth',2);
    xlim([0 1]);xlabel('Frequ�ncia normalizada');ylabel('Fase')
    print('Eliptico_modfas','-dpng','-r0')
    
%Quest�o 2
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
%soundsc(y, f16);
xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
title('Butterworth - música')
print('Butterworth_spec_mus','-dpng','-r0')

y = filter(B1, A1, conversa16k);
figure;
janela = round((0.02*length(conversa16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
%soundsc(y, f16);
xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
title('Butterworth - conversa')
print('Butterworth_spec_conv','-dpng','-r0')


% Chebyshev 1

y = filter(B2, A2, musica16k);
figure;
janela = round((0.02*length(musica16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
%soundsc(y, f16);
xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
title('Chebyshev1 - música')
print('Chebyshev1_spec_mus','-dpng','-r0')

y = filter(B2, A2, conversa16k);
figure;
janela = round((0.02*length(conversa16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
%soundsc(y, f16);
xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
title('Chebyshev1 - conversa')
print('Chebyshev1_spec_conv','-dpng','-r0')

% Chebyshev 2

y = filter(B3, A3, musica16k);
figure;
janela = round((0.02*length(musica16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
%soundsc(y, f16);
xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
title('Chebyshev2 - música')
print('Chebyshev2_spec_mus','-dpng','-r0')


y = filter(B3, A3, conversa16k);
figure;
janela = round((0.02*length(conversa16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
%soundsc(y, f16);
xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
title('Chebyshev2 - conversa')
print('Chebyshev2_spec_conv','-dpng','-r0')


% Eliptica

y = filter(B4, A4, musica16k);
figure;
janela = round((0.02*length(musica16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
%soundsc(y, f16);
xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
title('Eliptica - música')
print('Eliptica_spec_mus','-dpng','-r0')

y = filter(B4, A4, conversa16k);
figure;
janela = round((0.02*length(conversa16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
%soundsc(y, f16);
xlim([0 1]);xlabel('Tempo (s)');ylabel('Frequência (Hz)')
title('Eliptica - conversa')
print('Eliptica_spec_conv','-dpng','-r0')