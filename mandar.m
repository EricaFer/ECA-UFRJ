% 3) Adicione aos sinais de áudio amostrados em 16 kHz, um ruído branco gaussiano de média zero e variância tal
% que a razão sinal/ruído (SNR) seja 10 dB. Escute os áudios, faça gráficos dos sinais no domínio do tempo e
% plote os espectrogramas dos sinais. Repita para SNR de 0 dB. Comente os resultados para dois valores de
% SNR.
% Função do MATLAB: randn.

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
