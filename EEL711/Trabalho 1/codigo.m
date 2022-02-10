% 1) Escolha dois sinais de áudio digitais, um de voz e outro de música, com frequência de amostragem maior ou
% igual a 16 kHz e duração de 10 s. Abra-os, no Matlab, e escute os áudios. Reduza as suas frequências de
% amostragem para 16 kHz. Faça gráficos dos sinais no domínio do tempo e comente as formas de onda
% observadas (se necessário, plote trechos menores dos sinais).
% Funções do MATLAB: soundsc, wavread, plot, resample.

% Lendo arquivos de áudio
[conversa, fs]= audioread('conversa_original.wav'); 
[musica, fs]= audioread('musica_original.wav'); 

% Limita áudio a 10 s
conversa = conversa(1:(10*fs));
musica = musica(1:(10*fs));

% Escutando os áudios originais no MATLAB
%soundsc(conversa, fs);
%soundsc(musica, fs);

% Criando vetor do tempo
tempo = (0:(10*fs-1))/fs;

figure(1), clf;

subplot(2,1, 1);
plot(tempo, conversa)
title('Sinal de Voz - Domínio do tempo')
%soundsc(conversa,fs)

subplot(2,1, 2)
plot(tempo, musica)
title('Sinal de Música - Domínio do tempo')
%soundsc(musica,fs)

conversa_16k = resample (conversa, 16e3, fs);
musica_16k = resample (musica, 16e3, fs);

figure(2), clf;

subplot(2,1, 1);
t16 = (0:(10*16e3-1))/16e3;
plot(t16, conversa_16k);
title('Sinal de Voz reamostrado em 16KHz')

subplot(2,1, 2);
t16 = (0:(10*16e3-1))/16e3;
plot(t16, musica_16k);
title('Sinal de Música reamostrado em 16KHz')

% Comparando antes e depois da amostragem de 16 kHz -----------------------------------------(ver isso)

% Limita áudio a 1 s (melhor visualização)
conversa_1s = conversa(1:(1*fs));
musica_1s = musica(1:(1*fs));

conversa_16k_1s = conversa_16k(1:(1*16e3));
musica_16k_1s = musica_16k(1:(1*16e3));

% Criando vetor do tempo
tempo_1s = (0:(1*fs-1))/fs;

figure(3), clf;

subplot(2,1, 1);
plot(tempo, conversa_1s)
title('Sinal de Voz - Domínio do tempo')

subplot(2,1, 2);
t16_1s = (0:(1*16e3-1))/16e3;
plot(t16_1s, conversa_16k_1s);
title('Sinal de Voz reamostrado em 16KHz')

figure(4), clf;

subplot(2,1, 1)
plot(tempo, musica)
title('Sinal de Música - Domínio do tempo')

subplot(2,1, 2);
plot(t16_1s, musica_16k_1s);
title('Sinal de Música reamostrado em 16KHz')

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
spectrogram(conversa_16k, 16e3*0.032, 256, 'yaxis')
title('Espectograma do sinal de voz amostrado em 16KHz')

subplot(2,1, 2);
spectrogram(musica_16k, 16e3*0.032, 256, 'yaxis')
title('Espectograma do sinal de música mostrado em 16KHz')

% 3) Adicione aos sinais de áudio amostrados em 16 kHz, um ruído branco gaussiano de média zero e variância tal
% que a razão sinal/ruído (SNR) seja 10 dB. Escute os áudios, faça gráficos dos sinais no domínio do tempo e
% plote os espectrogramas dos sinais. Repita para SNR de 0 dB. Comente os resultados para dois valores de
% SNR.
% Função do MATLAB: randn.



