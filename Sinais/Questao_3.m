clc, clear all, close all
%Alunos: Alan Fernandes Soares da Silva e Wellington Barbosa

% Implemente o filtro Integrador com Vazamento dado pela equa��o de diferen�as:
%y[n] = a.y[n-1]+(1-a).x[n]
%Serie de Exerc�cios sobre Matlab


%============================================================================================%
%a. Utilize a=0,80 e aplique o filtro ao �udio do link.

[audio,fs] = audioread("audio_1.wav");% Leitura do audio
a = 0.8;

%Por ser um sistema causal, tem-se que para n<0, y[n] = 0. Portanto, y[0] = a.y[-1] +(1-a).x[0] = (1-a).x[0]. 
%Como o octave come�a o vetor no 1, tem-se que y[1] = (1-a).x[1]
Y(1) = (1-a)*audio(1);

%Aplica��o do filtro Integrador com Vazamento 
for i = 1:length(audio)-1
  Y(i+1) = a*Y(i) + (1-a)*audio(i+1);
end

%============================================================================================%

%b. Reprodu��o do �udio com e sem filtro.
sound(Y,fs) % �udio com filtro.
sound(audio,fs)% �udio sem filtro.
%============================================================================================%

%c. Apresenta��o grafica das amostras  de 1000 a 1200 do �udio filtrado e do �udio n�o filtrado.
figure
subplot(2,1,1), plot(Y(1000:1200)),title("�udio filtrado com a = 0.8")
subplot(2,1,2), plot(audio(1000:1200)),title("�udio n�o filtrado")

%============================================================================================%
%d.  Utilize a=0,98 e aplique o filtro ao �udio do link.
[audio,fs] = audioread("audio_2.wav"); % Leitura do audio
a = 0.98;

Z(1) = (1-a)*audio(1); %

%Aplica��o do filtro Integrador com Vazamento 
for i = 1:length(audio)-1
  Z(i+1) = a*Z(i) + (1-a)*audio(i+1);
end

%============================================================================================%
%e. Reprodu��o do com e sem filtro.
sound(Z,fs) % �udio com filtro.
sound(audio,fs) % �udio sem filtro.

%============================================================================================%
%f. Apresenta��o grafica das amostras de 1000 a 1200 do �udio filtrado e do �udio n�o filtrado.
figure
subplot(2,1,1), plot(Z(1000:1200)),title("�udio filtrado com a = 0.98")
subplot(2,1,2), plot(audio(1000:1200)),title("�udio n�o filtrado")
