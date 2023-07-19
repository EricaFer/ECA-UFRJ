% Questão 1
% a) Butterworth
Wp = [0.2 0.6];
Ws = [0.1 0.7];
Rp = 0.004;
Rs = 65;

[n,Wn] = buttord(Wp,Ws,Rp,Rs);
[b1,a1] = butter(n, Wn);

freqz(b1,a1);
fontsize = 16;
title('Aproximação de butterworth', 'FontSize', fontsize+4);
xlabel('Frequência normalizada de Nyquist (\times \pi rad/amostra)', 'FontSize', fontsize);
ylabel('Magnitude (dB)', 'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

% b) Chebyshev

[n,Wn] = cheb1ord(Wp,Ws,Rp,Rs);
[b2,a2] = cheby1(n, Rp, Wn);

figure;
freqz(b2,a2);
fontsize = 16;
title('Aproximação de Chebyshev tipo 1', 'FontSize', fontsize+4);
xlabel('Frequência normalizada de Nyquist (\times \pi rad/amostra)', 'FontSize', fontsize);
ylabel('Magnitude (dB)', 'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

[n,Wn] = cheb2ord(Wp,Ws,Rp,Rs);
[b3,a3] = cheby2(n, Rp, Wn);

figure;
freqz(b3,a3);
fontsize = 16;
title('Aproximação de Chebyshev tipo 2', 'FontSize', fontsize+4);
xlabel('Frequência normalizada de Nyquist (\times \pi rad/amostra)', 'FontSize', fontsize);
ylabel('Magnitude (dB)', 'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

% c) Elíptica

[n,Wn] = ellipord(Wp,Ws,Rp,Rs);
[b4,a4] = ellip(n, Rp, Rs, Wn);

figure;
freqz(b4,a4);
fontsize = 16;
title('Aproximação Elíptica', 'FontSize', fontsize+4);
xlabel('Frequência normalizada de Nyquist (\times \pi rad/amostra)', 'FontSize', fontsize);
ylabel('Magnitude (dB)', 'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

%%
%--------------------------------------------------------------------------
% Questão 2
% Butterworth - coeficientes a1 e b1
% Chebyshev 1 - coeficientes a2 e b2
% Chebyshev 2 - coeficientes a3 e b3
% Elíptica - coeficientes a4 e b4

[musica, Fs] = audioread('C:\Users\lgrmo\Documents\Trabalho 2\Billy Idol - White wedding Lyrics (mp3cut.net).wav');
musica16k = resample(musica, 16000, Fs); %diminui a taxa de amostragem para 16k
musica16k = musica16k(:,1);

[voz, Fs] = audioread('C:\Users\lgrmo\Documents\Trabalho 2\WhatsApp Audio 2022-02-09 at 21.23.41 (mp3cut.net).wav');
voz16k = resample(voz, 16000, Fs); %diminui a taxa de amostragem para 16k
voz16k =  voz16k(:,1);

% Butterworth
y = filter(b1, a1, musica16k);
figure;
janela = round((0.02*length(musica16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
title('Espectograma do sinal de musica com filtro de Butterworth', 'FontSize', fontsize+2);
xlabel('Tempo (s)', 'FontSize', fontsize);
ylabel('Frequencia (kHz)', 'FontSize', fontsize);
set(gca,'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);


y = filter(b1, a1, voz16k);
figure;
janela = round((0.02*length(voz16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
title('Espectograma do sinal de voz com filtro de Butterworth', 'FontSize', fontsize+2);
xlabel('Tempo (s)', 'FontSize', fontsize);
ylabel('Frequencia (kHz)', 'FontSize', fontsize);
set(gca,'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

% Chebyshev 1
y = filter(b2, a2, musica16k);
figure;
janela = round((0.02*length(musica16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
title('Espectograma do sinal de musica com filtro de Chebyshev 1', 'FontSize', fontsize+2);
xlabel('Tempo (s)', 'FontSize', fontsize);
ylabel('Frequencia (kHz)', 'FontSize', fontsize);
set(gca,'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

y = filter(b2, a2, voz16k);
figure;
janela = round((0.02*length(voz16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
title('Espectograma do sinal de voz com filtro de Chebyshev 1', 'FontSize', fontsize+2);
xlabel('Tempo (s)', 'FontSize', fontsize);
ylabel('Frequencia (kHz)', 'FontSize', fontsize);
set(gca,'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

% Chebyshev 2
y = filter(b3, a3, musica16k);
figure;
janela = round((0.02*length(musica16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
title('Espectograma do sinal de musica com filtro de Chebyshev 2', 'FontSize', fontsize+2);
xlabel('Tempo (s)', 'FontSize', fontsize);
ylabel('Frequencia (kHz)', 'FontSize', fontsize);
set(gca,'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

y = filter(b3, a3, voz16k);
figure;
janela = round((0.02*length(voz16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
title('Espectograma do sinal de voz com filtro de Chebyshev 2', 'FontSize', fontsize+2);
xlabel('Tempo (s)', 'FontSize', fontsize);
ylabel('Frequencia (kHz)', 'FontSize', fontsize);
set(gca,'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

% Eliptica
y = filter(b4, a4, musica16k);
figure;
janela = round((0.02*length(musica16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
title('Espectograma do sinal de musica com filtro Eliptico', 'FontSize', fontsize+2);
xlabel('Tempo (s)', 'FontSize', fontsize);
ylabel('Frequencia (kHz)', 'FontSize', fontsize);
set(gca,'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

y = filter(b4, a4, voz16k);
figure;
janela = round((0.02*length(voz16k))/10);
overlap = round(janela/2);
spectrogram(y, hamming(janela), overlap, 1024, 16000, 'yaxis');
title('Espectograma do sinal de voz com filtro Eliptico', 'FontSize', fontsize+2);
xlabel('Tempo (s)', 'FontSize', fontsize);
ylabel('Frequencia (kHz)', 'FontSize', fontsize);
set(gca,'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

%% Questao 6

fontsize = 16;
b = fir1(40,0.3);
freqz(b,1,512)
title('Resposta em frequencia do metodo de janelas', 'FontSize', fontsize+4);
xlabel('Frequência normalizada de Nyquist (\times \pi rad/amostra)', 'FontSize', fontsize);
ylabel('Magnitude (dB)', 'FontSize', fontsize);
set(gcf, 'Position',  [100, 100, 900, 720]);

figure;
rp = 3;
rs = 65;
dev = [(10^(rp/20)-1)/(10^(rp/20)+1) 10^(-rs/20)]; 
[n,fo,ao,w] = firpmord([0.3 0.5],[1 0],dev,16000);
b = firpm(n,fo,ao,w);
freqz(b,1,512)