clc;
clear;

%% QUESTAO 1
clc;
InfoMusica32k=audioinfo('audio_musica.wav');
[musica32k,Fs] =audioread('audio_musica.wav');

InfoVoz32k=audioinfo('audio_voz.wav');
[voz32k,Fs] =audioread('audio_voz.wav');
%sound(audio32k,Fs);
figure;
t=0:1/Fs:10-1/Fs;
subplot(2,1,1)
plot(t,musica32k);
title('Sinal de música');
subplot(2,1,2)
plot(t,voz32k);
title('Sinal de voz');


%%
%%QUESTAO 2
clc;
Fs16=Fs/2;
Fs8=Fs/4;
Fs4=Fs/8;

musica16k=resample(musica32k,Fs16,Fs);
voz16k=resample(voz32k,Fs16,Fs);
% sound(musica16k,Fs16);
% sound(voz16k,Fs16);
t16=0:1/Fs16:10-1/Fs16;

musica8k=resample(musica32k,Fs8,Fs);
voz8k=resample(voz32k,Fs8,Fs);
%sound(musica8k,Fs8);
%sound(voz8k,Fs8);
t8=0:1/Fs8:10-1/Fs8;

musica4k=resample(musica32k,Fs4,Fs);
voz4k=resample(voz32k,Fs4,Fs);
% sound(musica4k,Fs4);
% sound(voz4k,Fs4);
t4=0:1/Fs4:10-1/Fs4;



figure;
subplot(3,2,1)
plot(t16,musica16k);
title('Música 16k');

subplot(3,2,2)
plot(t16,voz16k);
title('Voz 16k');

subplot(3,2,3)
plot(t8,musica8k);
title('Música 8k');

subplot(3,2,4)
plot(t8,voz8k);
title('Voz 8k');

subplot(3,2,5)
plot(t4,musica4k);
title('Música 4k');

subplot(3,2,6)
plot(t4,voz4k);
title('Voz 4k');

clear t8 t4 musica8k audio8k musica4k audio4k;
%%
%% Questao 3
clc;
Nx = length(t16);
nsc = floor(Nx*0.032);
nff = max(256,2^nextpow2(nsc));
nsc128 = floor(Nx*0.128);
nff128 = max(256,2^nextpow2(nsc128));



figure;
subplot(2,2,1)
spectrogram(musica16k,hamming(nsc),[],nff);
title('Sinal música  hamming 32ms ');

subplot(2,2,2)
spectrogram(musica16k,rectwin(nsc),[],nff);
title('Sinal música retangular 32ms ');

subplot(2,2,3)
spectrogram(musica16k,hamming(nsc128),[],nff128);
title('Sinal música  hamming 128ms ');

subplot(2,2,4)
spectrogram(musica16k,rectwin(nsc128),[],nff128);
title('Sinal música  retangular 128ms ');

figure;
subplot(2,2,1)
spectrogram(voz16k,hamming(nsc),[],nff);
title('Sinal voz  hamming 32ms ');

subplot(2,2,2)
spectrogram(voz16k,rectwin(nsc),[],nff);
title('Sinal voz retangular 32ms ');

subplot(2,2,3)
spectrogram(voz16k,hamming(nsc128),[],nff128);
title('Sinal voz  hamming 128ms ');

subplot(2,2,4)
spectrogram(voz16k,rectwin(nsc128),[],nff128);
title('Sinal voz  retangular 128ms ');
%%
%% Questao 4
clc;

len = 10;                                       % Length (sec)
f200   = 200;                                     % Frequency (Hz)
f2k =2000;
Fs  = 16000;                                     % Sampling Frequency (Hz)
t   = linspace(0, len, Fs*len);                 % Time Vector
signal200 = sin(2*pi*f200*t)';                         % Signal (10 kHz sine)
signal2k = sin(2*pi*f2k*t)';  
                                                           
ruidoMusica1db = 0.26*(signal200 +signal2k);
ruidoVoz1db = 0.088*(signal200 +signal2k);

ruidoMusica7db = 0.52*(signal200 +signal2k);
ruidoVoz7db = 0.175*(signal200 +signal2k);

SinalComRuidoMusica1db=musica16k + ruidoMusica1db;
SinalComRuidoVoz1db=voz16k + ruidoVoz1db;

SinalComRuidoMusica7db=musica16k + ruidoMusica7db;
SinalComRuidoVoz7db=voz16k + ruidoVoz7db;

% snr(musica16k,ruidoMusica1db)
% snr(voz16k,ruidoVoz1db)
% snr(musica16k,ruidoMusica7db)
% snr(voz16k,ruidoVoz7db)

figure
subplot(3,2,1);
plot(t,musica16k);
title('Música sem ruído');

subplot(3,2,2);
plot(t,voz16k);
title('Voz sem ruído');

subplot(3,2,3);
plot(t,SinalComRuidoMusica1db);
title('Sinal de música com ruído -1db');

subplot(3,2,4);
plot(t,SinalComRuidoVoz1db);
title('Sinal de voz com ruído -1db');

subplot(3,2,5);
plot(t,SinalComRuidoMusica7db);
title('Sinal de música com ruído -7db');

subplot(3,2,6);
plot(t,SinalComRuidoVoz7db);
title('Sinal de voz com ruído -7db');

%sound(SinalComRuidoMusica1db,Fs16);
%sound(SinalComRuidoMusica7db,Fs16);
%sound(SinalComRuidoVoz1db,Fs16);
%sound(SinalComRuidoVoz7db,Fs16);
%%
%% Questao 5
clc;
figure;
subplot(1,2,1);
spectrogram(musica16k,hamming(nsc),[],nff);
title('Sinal de música sem ruído');

subplot(1,2,2);
spectrogram(voz16k,hamming(nsc),[],nff);
title('Sinal de voz sem ruído');

figure;
subplot(2,2,1);
spectrogram(SinalComRuidoMusica1db,hamming(nsc),[],nff);
title('Sinal de musica com ruido de -1db');

subplot(2,2,2);
spectrogram(SinalComRuidoVoz1db,hamming(nsc),[],nff);
title('Ruido de voz com ruido de -1db');

subplot(2,2,3);
spectrogram(SinalComRuidoMusica7db,hamming(nsc),[],nff);
title('Sinal de musica com ruido de -7db');


subplot(2,2,4);
spectrogram(SinalComRuidoVoz7db,hamming(nsc),[],nff);
title('Ruido de voz com ruido de -7db');

%%
%% Questao 6
clc;
W200=2*pi*200/Fs16;
k=1;
a07=[1 -2*0.7*cos(W200) 0.7^2];
a09=[1 -2*0.9*cos(W200) 0.9^2];
b=k*[1 -2*cos(W200) 1];

[h1,w1]=freqz(b,a07,'whole',Fs16);

figure;
subplot(1,2,1);
plot(w1/pi,20*log10(abs(h1)));
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('A=0.7');

[h2,w2]=freqz(b,a09,'whole',Fs16);
subplot(1,2,2);
plot(w2/pi,20*log10(abs(h2)));
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
title('A=0.9');

SinalFiltrado07Musica1db = filter(b,a07,SinalComRuidoMusica1db);
SinalFiltrado07Musica7db = filter(b,a07,SinalComRuidoMusica7db);

SinalFiltrado07Voz1db = filter(b,a07,SinalComRuidoVoz1db);
SinalFiltrado07Voz7db = filter(b,a07,SinalComRuidoVoz7db);

SinalFiltrado09Musica1db = filter(b,a09,SinalComRuidoMusica1db);
SinalFiltrado09Musica7db = filter(b,a09,SinalComRuidoMusica7db);

SinalFiltrado09Voz1db = filter(b,a09,SinalComRuidoVoz1db);
SinalFiltrado09Voz7db = filter(b,a09,SinalComRuidoVoz7db);

figure;

subplot(2,2,1);
spectrogram(SinalComRuidoMusica1db,hamming(nsc),[],nff);
title('Sinal de musica com ruido de -1db');

subplot(2,2,2);
spectrogram(SinalComRuidoMusica7db,hamming(nsc),[],nff);
title('Sinal de musica com ruido -7db');

subplot(2,2,3);
spectrogram(SinalComRuidoVoz1db,hamming(nsc),[],nff);
title('Sinal de voz com ruido -1db');

subplot(2,2,4);
spectrogram(SinalComRuidoVoz7db,hamming(nsc),[],nff);
title('Sinal de voz com ruido -7db');

figure;

subplot(2,2,1);
spectrogram(SinalFiltrado07Musica1db,hamming(nsc),[],nff);
title('Filtro de 200Hz com a=0.7 sinal de música -1db');

subplot(2,2,2);
spectrogram(SinalFiltrado07Musica7db,hamming(nsc),[],nff);
title('Filtro de 200Hz com a=0.7 sinal de música -7db');

subplot(2,2,3);
spectrogram(SinalFiltrado07Voz1db,hamming(nsc),[],nff);
title('Filtro de 200Hz com a=0.7 sinal de voz -1db');

subplot(2,2,4);
spectrogram(SinalFiltrado07Voz7db,hamming(nsc),[],nff);
title('Filtro de 200Hz com a=0.7 sinal de voz -7db');

figure;
subplot(2,2,1);
spectrogram(SinalFiltrado09Musica1db,hamming(nsc),[],nff);
title('Filtro de 200Hz com a=0.9 sinal de música -1db');

subplot(2,2,2);
spectrogram(SinalFiltrado09Musica7db,hamming(nsc),[],nff);
title('Filtro de 200Hz com a=0.9 sinal de música -7db');

subplot(2,2,3);
spectrogram(SinalFiltrado09Voz1db,hamming(nsc),[],nff);
title('Filtro de 200Hz com a=0.9 sinal de voz -1db');

subplot(2,2,4);
spectrogram(SinalFiltrado09Voz7db,hamming(nsc),[],nff);
title('Filtro de 200Hz com a=0.9 sinal de voz -7db');

%sound(SinalFiltrado07Musica1db,Fs16);
%sound(SinalFiltrado07Musica7db,Fs16);
%sound(SinalFiltrado09Musica1db,Fs16);
%sound(SinalFiltrado09Musica7db,Fs16);
%sound(SinalFiltrado07Voz1db,Fs16);
%sound(SinalFiltrado07Voz7db,Fs16);
%sound(SinalFiltrado09Voz1db,Fs16);
%sound(SinalFiltrado09Voz7db,Fs16);

%%
%% Questao 7
clc;

W2k=2*pi*2000/Fs16;
k=1;
a07=[1 -2*0.7*cos(W2k) 0.7^2];
a09=[1 -2*0.9*cos(W2k) 0.9^2];
b=k*[1 -2*cos(W2k) 1];

[h1,w1]=freqz(b,a07,'whole',Fs16);

figure;
subplot(1,2,1);
plot(w1/pi,20*log10(abs(h1)));
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)');
ylabel('Magnitude (dB)');
title('A=0.7');

[h2,w2]=freqz(b,a09,'whole',Fs16);
subplot(1,2,2);
plot(w2/pi,20*log10(abs(h2)));
ax = gca;
ax.YLim = [-100 20];
ax.XTick = 0:.5:2;
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Magnitude (dB)')
title('A=0.9');

SinalFiltrado07Musica1db = filter(b,a07,SinalComRuidoMusica1db);
SinalFiltrado07Musica7db = filter(b,a07,SinalComRuidoMusica7db);

SinalFiltrado07Voz1db = filter(b,a07,SinalComRuidoVoz1db);
SinalFiltrado07Voz7db = filter(b,a07,SinalComRuidoVoz7db);

SinalFiltrado09Musica1db = filter(b,a09,SinalComRuidoMusica1db);
SinalFiltrado09Musica7db = filter(b,a09,SinalComRuidoMusica7db);

SinalFiltrado09Voz1db = filter(b,a09,SinalComRuidoVoz1db);
SinalFiltrado09Voz7db = filter(b,a09,SinalComRuidoVoz7db);

figure;

subplot(2,2,1);
spectrogram(SinalComRuidoMusica1db,hamming(nsc),[],nff);
title('Sinal de musica com ruido de -1db');

subplot(2,2,2);
spectrogram(SinalComRuidoMusica7db,hamming(nsc),[],nff);
title('Sinal de musica com ruido -7db');

subplot(2,2,3);
spectrogram(SinalComRuidoVoz1db,hamming(nsc),[],nff);
title('Sinal de voz com ruido -1db');

subplot(2,2,4);
spectrogram(SinalComRuidoVoz7db,hamming(nsc),[],nff);
title('Sinal de voz com ruido -7db');

figure;

subplot(2,2,1);
spectrogram(SinalFiltrado07Musica1db,hamming(nsc),[],nff);
title('Filtro de 2kHz com a=0.7 sinal de música -1db');

subplot(2,2,2);
spectrogram(SinalFiltrado07Musica7db,hamming(nsc),[],nff);
title('Filtro de 2kHz com a=0.7 sinal de música -7db');

subplot(2,2,3);
spectrogram(SinalFiltrado07Voz1db,hamming(nsc),[],nff);
title('Filtro de 2kHz com a=0.7 sinal de voz -1db');

subplot(2,2,4);
spectrogram(SinalFiltrado07Voz7db,hamming(nsc),[],nff);
title('Filtro de 2kHz com a=0.7 sinal de voz -7db');

figure;
subplot(2,2,1);
spectrogram(SinalFiltrado09Musica1db,hamming(nsc),[],nff);
title('Filtro de 2kHz com a=0.9 sinal de música -1db');

subplot(2,2,2);
spectrogram(SinalFiltrado09Musica7db,hamming(nsc),[],nff);
title('Filtro de 2kHz com a=0.9 sinal de música -7db');

subplot(2,2,3);
spectrogram(SinalFiltrado09Voz1db,hamming(nsc),[],nff);
title('Filtro de 2kHz com a=0.9 sinal de voz -1db');

subplot(2,2,4);
spectrogram(SinalFiltrado09Voz7db,hamming(nsc),[],nff);
title('Filtro de 2kHz com a=0.9 sinal de voz -7db');

%sound(SinalFiltrado07Musica1db,Fs16);
%sound(SinalFiltrado07Musica7db,Fs16);
%sound(SinalFiltrado09Musica1db,Fs16);
%sound(SinalFiltrado09Musica7db,Fs16);
%sound(SinalFiltrado07Voz1db,Fs16);
%sound(SinalFiltrado07Voz7db,Fs16);
%sound(SinalFiltrado09Voz1db,Fs16);
%sound(SinalFiltrado09Voz7db,Fs16);

%%
%% Questão 8
clc;
W200=2*pi*200/Fs16;
W2k=2*pi*2000/Fs16;

k=1;
a7=0.7;
a9=0.9;
a07200=[1 -2*a7*cos(W200) a7^2];
a09200=[1 -2*a7*cos(W200) a7^2];

a072k=[1 -2*a7*cos(W2k) a7^2];
a092k=[1 -2*a7*cos(W2k) a7^2];

b200=k*[1 -2*cos(W200) 1];
b2k=k*[1 -2*cos(W2k) 1];

SinalFiltrado07Musica1db=filter(b2k,a072k,filter(b200,a07200,SinalComRuidoMusica1db));
SinalFiltrado07Musica7db=filter(b2k,a072k,filter(b200,a07200,SinalComRuidoMusica7db));

SinalFiltrado09Musica1db=filter(b2k,a092k,filter(b200,a09200,SinalComRuidoMusica1db));
SinalFiltrado09Musica7db=filter(b2k,a092k,filter(b200,a09200,SinalComRuidoMusica7db));

SinalFiltrado07Voz1db=filter(b2k,a072k,filter(b200,a07200,SinalComRuidoVoz1db));
SinalFiltrado07Voz7db=filter(b2k,a072k,filter(b200,a07200,SinalComRuidoVoz7db));

SinalFiltrado09Voz1db=filter(b2k,a092k,filter(b200,a09200,SinalComRuidoVoz1db));
SinalFiltrado09Voz7db=filter(b2k,a092k,filter(b200,a09200,SinalComRuidoVoz7db));

figure;

subplot(2,2,1);
spectrogram(SinalComRuidoMusica1db,hamming(nsc),[],nff);
title('Sinal de musica com ruido de -1db');

subplot(2,2,2);
spectrogram(SinalComRuidoMusica7db,hamming(nsc),[],nff);
title('Sinal de musica com ruido -7db');

subplot(2,2,3);
spectrogram(SinalComRuidoVoz1db,hamming(nsc),[],nff);
title('Sinal de voz com ruido -1db');

subplot(2,2,4);
spectrogram(SinalComRuidoVoz7db,hamming(nsc),[],nff);
title('Sinal de voz com ruido -7db');

figure;

subplot(2,2,1);
spectrogram(SinalFiltrado07Musica1db,hamming(nsc),[],nff);
title('Sinal de música com -1db filtrado com a=0.7');

subplot(2,2,2);
spectrogram(SinalFiltrado07Musica7db,hamming(nsc),[],nff);
title('Sinal de música com -7db filtrado com a=0.7');

subplot(2,2,3);
spectrogram(SinalFiltrado07Voz1db,hamming(nsc),[],nff);
title('Sinal de voz com -1db filtrado com a=0.7');

subplot(2,2,4);
spectrogram(SinalFiltrado07Voz7db,hamming(nsc),[],nff);
title('Sinal de voz com -7db filtrado com a=0.7');

figure;
subplot(2,2,1);
spectrogram(SinalFiltrado09Musica1db,hamming(nsc),[],nff);
title('Sinal de música com -1db filtrado com a=0.9');

subplot(2,2,2);
spectrogram(SinalFiltrado09Musica7db,hamming(nsc),[],nff);
title('Sinal de música com -7db filtrado com a=0.9');

subplot(2,2,3);
spectrogram(SinalFiltrado09Voz1db,hamming(nsc),[],nff);
title('Sinal de voz com -1db filtrado com a=0.9');

subplot(2,2,4);
spectrogram(SinalFiltrado09Voz7db,hamming(nsc),[],nff);
title('Sinal de voz com -7db filtrado com a=0.9');

%sound(SinalFiltrado07Musica1db,Fs16);
%sound(SinalFiltrado07Musica7db,Fs16);
%sound(SinalFiltrado09Musica1db,Fs16);
%sound(SinalFiltrado09Musica7db,Fs16);
%sound(SinalFiltrado07Voz1db,Fs16);
%sound(SinalFiltrado07Voz7db,Fs16);
%sound(SinalFiltrado09Voz1db,Fs16);
%sound(SinalFiltrado09Voz7db,Fs16);
%%
clc
clear