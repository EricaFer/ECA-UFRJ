% 1) Escolha dois sinais de áudio digitais, um de conversa e outro de música, com frequência de amostragem maior ou
% igual a 16 kHz e duração de 10 s. Abra-os, no Matlab, e escute os áudios. Reduza as suas frequências de
% amostragem para 16 kHz. Faça gráficos dos sinais no domínio do tempo e comente as formas de onda
% observadas (se necessário, plote trechos menores dos sinais).
% Funções do MATLAB: soundsc, wavread, plot, resample.

% Lendo arquivos de áudio
[conversa, fs]= audioread('conversa_original.wav'); 
[musica, fs]= audioread('musica_original.wav'); 

% Criando vetor do tempo
tempo = (0:(10*fs-1))/fs;

% Limita áudio a 10 s
conversa = conversa(1:(10*fs));
musica = musica(1:(10*fs));

% Escutando os áudios originais no MATLAB
%soundsc(conversa, fs);
%soundsc(musica, fs);

% Sinais em 16

conversa_16k = resample (conversa, 16e3, fs);
musica_16k = resample (musica, 16e3, fs);

figure(1), clf;

subplot(2,1, 1);
plot(tempo, conversa)
title('Sinal de conversa - Domínio do tempo')
%soundsc(conversa,fs)

subplot(2,1, 2);
t16 = (0:(10*16e3-1))/16e3;
plot(t16, conversa_16k);
title('Sinal de conversa reamostrado em 16KHz')
%soundsc(conversa_16k,fs)

figure(2), clf;

subplot(2,1, 1)
plot(tempo, musica)
title('Sinal de Música - Domínio do tempo')
%soundsc(musica,fs)

subplot(2,1, 2);
plot(t16, musica_16k);
title('Sinal de Música reamostrado em 16KHz')
%soundsc(musica_16k,fs)

% 2) Plote o espectrograma dos sinais amostrados em 16 kHz e comente os gráficos obtidos para cada caso. Use a
% janela de Hamming de tamanho correspondente a um intervalo entre 20 ms e 50 ms (potência de 2) e
% sobreposição de 50%. Comente os resultados obtidos em cada caso.
% Função do MATLAB: spectrogram.

% Foi escolhido 2^5 - 32. Única potência de 2 entre 20 e 50 (com expoente natural)

% Ao consultar a documentação da função spectrogram do MATLAB, foi percebido que 
% o padrão da função é utilizar a janela de Hamming com 50% de overlap,
% por isso esses valores não foram setados

figure(4), clf;
subplot(2,1, 1); 
spectrogram(conversa_16k, hamming(16e3*0.032), 256, 'yaxis')
title('Espectrograma do sinal de conversa amostrado em 16KHz')

subplot(2,1, 2);
spectrogram(musica_16k, hamming(16e3*0.032), 256, 'yaxis')
title('Espectrograma do sinal de música amostrado em 16KHz')

% 3) Adicione aos sinais de áudio amostrados em 16 kHz, um ruído branco gaussiano de média zero e variância tal
% que a razão sinal/ruído (SNR) seja 10 dB. Escute os áudios, faça gráficos dos sinais no domínio do tempo e
% plote os espectrogramas dos sinais. Repita para SNR de 0 dB. Comente os resultados para dois valores de
% SNR.
% Função do MATLAB: randn.

% SNR = 10dB

musica_16k_snr_10 = awgn(musica_16k,10,'measured');
conversa_16k_snr_10 = awgn(conversa_16k,10,'measured');

t16 = (0:(10*16e3-1))/16e3;

figure(5), clf;
subplot(2,1, 1); 
plot(t16,conversa_16k_snr_10);
title('Sinal de conversa amostrado em 16KHz com SNR 10 dB')

subplot(2,1, 2);
plot(t16,musica_16k_snr_10);
title('Sinal de música amostrado em 16KHz com SNR 10 dB')

figure(6), clf;
subplot(2,1, 1); 
spectrogram(conversa_16k_snr_10,'yaxis');
title('Espectrograma do Sinal de conversa amostrado em 16KHz com SNR 10 dB')

subplot(2,1, 2);
spectrogram(musica_16k_snr_10,'yaxis');
title('Espectrograma do Sinal de música amostrado em 16KHz com SNR 10 dB')

%SNR = 0dB

musica_16k_snr_0 = awgn(musica_16k,0,'measured');
conversa_16k_snr_0 = awgn(conversa_16k,0,'measured');

figure(7), clf;
subplot(2,1, 1); 
plot(t16,conversa_16k_snr_0);
title('Sinal de conversa amostrado em 16KHz com SNR 0 dB')

subplot(2,1, 2);
plot(t16,musica_16k_snr_0);
title('Sinal de música amostrado em 16KHz com SNR 0 dB')

figure(8), clf;
subplot(2,1, 1); 
spectrogram(conversa_16k_snr_0,'yaxis');
title('Espectrograma do Sinal de conversa amostrado em 16KHz com SNR 0 dB')

subplot(2,1, 2);
spectrogram(musica_16k_snr_0,'yaxis');
title('Espectrograma do Sinal de música amostrado em 16KHz com SNR 0 dB')
