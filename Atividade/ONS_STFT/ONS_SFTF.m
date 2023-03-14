%==========================================================================
%
%Aluno : Wellington Barbosa
%Descri��o : Analise da curva da ONS de DADOS HIDROL�GICOS / N�VEIS do periodo de
%           01/01/2022 a 31/12/2022 do reservat�rio Itaipu utilizando
%           Transformada de Fourier de Tempo Curto
%
%==========================================================================
%Limpeza
clc
close all
clear all

tic
%Leitura
%Leitura do arquivo
curva = dlmread("Dados.csv");
x = curva';
%curva(1) = curva(2);
N = length (curva);
%curva(N) = curva(N-1);
fd = 1/N;
fs = fd;

L = length(x);
t = L/fs;
tempo = linspace(1,t,L);
%Defini��o do numero de segmento 
N = 100;

%Defini��o da matriz de transforma��o
line = 0:N-1;
matrix_base = line'*line;
nucleo =  exp(-i*pi*2/N);
matrix_transform = nucleo.^matrix_base;

%Defini��o da matriz de hamming
vetor = linspace(-2,2,N);
w = exp(-vetor.^2/1.5);

%Defini��o da sobreposi��o
Ovelap = N/10;

%Calculo do numero de itera��o
number_it = floor((L-N)/Ovelap);

%Matriz Heinkel
Matrix_H = zeros(N,number_it);
Y2 = zeros(N,number_it);

%Vetor frequencias
frequency  = fs * (1/N)*(0:N-1);

for a=0:1:number_it
        Matrix_H(:,a+1) = (x(1+a*Ovelap:N+a*Ovelap).*w');
end

Y = matrix_transform * Matrix_H;

figure, imagesc(tempo,frequency, log10(abs(Y(1:floor(N/2),:))))
colorbar
%===============================================================================

