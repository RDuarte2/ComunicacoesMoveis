close all; clear all; clc;

% Define transmitter parameters

fq = 0.9e9; % Carrier frequency (0.9 GHz)
antHeight = 40; % m
txPower = 10; % W

%% Define Cells Location

cell_location;

%% LOS

for i = 1:numCells
    for j = i+1:numCells % Start from i+1 to avoid comparing a site with itself and avoid duplicate comparisons
        los(txs(i), txs(j));
    end
end
disp('Press any key to continue..');
pause;

%% Create Antena Element

Antena_creation;

%% Mapa de Cobertura

Mapa_cobertura;
disp('Press any key to continue..');
pause;

%% interferencia co-canal (SINR)

interferencia_co_canal;
disp('Press any key to continue..');
pause;

%% Handover

handover;
disp('Press any key to continue..');
pause;

%% Best server

best_server;
Mapa_cobertura;
disp('Press any key to continue..');
pause;
