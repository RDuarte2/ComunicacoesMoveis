% Create transmitter sites associated with radars
centerSite = txsite('Name','Centro', ...
    'Latitude',38.8345296,...
    'Longitude',-9.4463247);

% Initialize arrays for distance and angle from center location to each cell site, where
% each site has 3 cells
numCellSites = 7;
siteDistances = zeros(1,numCellSites);
siteAngles = zeros(1,numCellSites);

% Define distance and angle for inner ring of 6 sites (cells 4-21)
isd = 1250; % Inter-site distance
siteDistances(2:7) = isd;
siteAngles(2:7) = 30:60:360;

% Initialize arrays for cell transmitter parameters
numCells = numCellSites*3;
cellLats = zeros(1,numCells);
cellLons = zeros(1,numCells);
cellNames = strings(1,numCells);
cellAngles = zeros(1,numCells);

% Define cell sector angles
cellSectorAngles = [30 150 270];

% For each cell site location, populate data for each cell transmitter
cellInd = 1;
for siteInd = 1:numCellSites
    % Compute site location using distance and angle from center site
    [cellLat,cellLon] = location(centerSite, siteDistances(siteInd), siteAngles(siteInd));

    % Assign values for each cell
    for cellSectorAngle = cellSectorAngles
        cellNames(cellInd) = "Cell " + cellInd;
        cellLats(cellInd) = cellLat;
        cellLons(cellInd) = cellLon;
        cellAngles(cellInd) = cellSectorAngle;
        cellInd = cellInd + 1;
    end
end

% Create cell transmitter sites
txs = txsite('Name',cellNames, ...
    'Latitude',cellLats, ...
    'Longitude',cellLons, ...
    'AntennaAngle',cellAngles, ...
    'AntennaHeight',antHeight, ...
    'TransmitterFrequency',fq, ...
    'TransmitterPower',txPower);

% Adjust Cell Locations
% Cell 16, 17, 18
for i=16:18
    txs(i).Latitude = 38.823125;
    txs(i).Longitude = -9.446035;
end

% Cell 10, 11, 12
for i=10:12
    txs(i).Latitude = 38.839691;
    txs(i).Longitude = -9.458551;
end

% Cell 7, 8, 9
for i=7:9
    txs(i).Latitude = 38.845773;
    txs(i).Longitude = -9.446586;
end

% Launch Site Viewer
viewer = siteviewer("Basemap","satellite","Buildings","Sintra.osm");

% Show sites on a map
show(txs);