
% ========================================================================
% C. Móveis 2023/24 - AARONIA GPS LOGGER - João R. Reis
% thanks to Tiago Oliveira for making this code available!
% ========================================================================

% ========================================================================
% Get file from measurement file
% ========================================================================
fid = fopen('FicheiroMedicao_Rodrigo_Pedro.txt');
C = textscan(fid, '%f%f%f','Delimiter',',');
Latitude=C{1,1};
Longitude=C{1,2};
signalStrength=C{1,3};
% signalStrength= smoothdata(C{1,3},'gaussian',30);                   % filtered data if need be

% ========================================================================
% Set Transmitter Position and Height 
% ========================================================================
lat = 39.735174;
lon =  -8.820628;
tx = txsite("Latitude",lat,...
            "Longitude",lon,...
            "AntennaHeight",2, 'TransmitterFrequency', 2.4e9);
show(tx);
% ========================================================================
% Process data: arrange for siteViewer format
% ========================================================================

tbl = table(Latitude, Longitude, signalStrength);
pd = propagationData(tbl);

% ========================================================================
% PLOT data in site viewer
% ========================================================================
legendTitle = "RSSI" + newline + "(dBm)";                             % plot legend  

plot(pd, "LegendTitle", legendTitle, "Colormap", 'turbo');            % plot points
contour(pd, "LegendTitle", legendTitle, "Colormap", 'turbo');         % plot countour





