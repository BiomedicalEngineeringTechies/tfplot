%% Time - Frequency plot 
%  by Piyush
clear; close all; clc;

%% Example Data
Fs = 1000;                          
L = 1000;               
t = linspace(0,L*(1/Fs),L);  
x = sin(2*pi*5*t);
t = 1000*t;

%% Wavelet
wname = 'bior1.5';
rr = centfrq(wname)./((1:70)*(1/Fs));
y = cwt(x,(rr(end):0.2:rr(1)),wname);
freq = scal2frq((rr(end):0.2:rr(1)),wname,(1/Fs));

%% Plots 
subplot(211), plot(t,x);
xlabel('Time in milliseconds'); ylabel('Amplitude in units');

subplot(212); contourf(t,freq,abs(y)); colorbar;
xlabel('Time in milliseconds'); ylabel('Frequency in Hz');
