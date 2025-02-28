close all; clear all; clc;

viewer = siteviewer("Basemap","satellite","Buildings","ESTG.osm");
load('Hyperlog60100.mat')

freq=2e9;
altura=2;
% power=1e-3;
power=0.0001;  % -10 dbi

tx = txsite(Name="Transmitter", ...
    Latitude=39.735174, ...
    Longitude=-8.820628, ...
    AntennaHeight=altura, ...
    TransmitterPower=power, ...
    TransmitterFrequency=freq, ...
    Antenna = HyperLog60100);
show(tx)

rtpm = propagationModel("raytracing", ...
    Method="sbr", ...
    MaxNumReflections=1, ...
    BuildingsMaterial="perfect-reflector", ...
    TerrainMaterial="perfect-reflector");

rx = rxsite("Name","Receiver", ...
    "Latitude",39.734798, ...
    "Longitude",-8.820859);
show(rx)

tx.AntennaAngle = angle(tx, rx);

coverage(tx,rtpm, ...
    SignalStrengths=-120:-5, ...
    MaxRange=150, ...
    Resolution=3, ...
    Transparency=0.6)
pause;

% pattern(tx);

% RT = propagationModel("raytracing",MaxNumReflections=0);
% rays = raytrace(tx,rx,RT);
% rays = rays{1};
% plot(rays)
% ss = sigstrength(rx,tx,"raytracing");

% tic
% clearMap(viewer)
% raytrace(tx,rx,rtpm)
% ss = sigstrength(rx,tx,"raytracing");
% toc