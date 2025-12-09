clc;
clear all;
close all;

% Lectura de datos
BMS_data = readtable('p2.csv');

t = table2array(BMS_data(:,1));      % Tiempo (s)
Vel_Veh = table2array(BMS_data(:,2)); % Velocidad lineal (km/h)

%% ------- Gráfica 1: Señal original en el tiempo -------
subplot(4,1,1);
plot(t, Vel_Veh, 'b');
title('Velocidad del vehículo en el dominio del tiempo');
xlabel('Tiempo [s]');
ylabel('Velocidad [km/h]');
legend('Velocidad original del vehículo');
grid on;

%% ------- Gráfica 2: FFT de la señal original -------
Vel_Veh_f = abs(fft(Vel_Veh));

subplot(4,1,2);
plot(Vel_Veh_f, 'r');
title('Espectro de frecuencia de la velocidad (FFT)');
xlabel('Muestras de frecuencia (índice FFT)');
ylabel('Magnitud');
legend('FFT de velocidad original');
grid on;

%% ------- Gráfica 3: Señal filtrada en tiempo -------
Vel_Veh_Ip = lowpass(Vel_Veh, 0.1, 2); % fc = 0.1 Hz, Fs = 2 Hz

subplot(4,1,3);
plot(t, Vel_Veh_Ip, 'k');
title('Velocidad del vehículo filtrada (Pasa-Bajas)');
xlabel('Tiempo [s]');
ylabel('Velocidad [km/h]');
legend('Velocidad filtrada');
grid on;

%% ------- Gráfica 4: FFT de la señal filtrada -------
Vel_Veh_f_Ip = abs(fft(Vel_Veh_Ip));

subplot(4,1,4);
plot(Vel_Veh_f_Ip, 'g');
title('Espectro de velocidad filtrada (FFT)');
xlabel('Muestras de frecuencia (índice FFT)');
ylabel('Magnitud');
legend('FFT de velocidad filtrada');
grid on;

