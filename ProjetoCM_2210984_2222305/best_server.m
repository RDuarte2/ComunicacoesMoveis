% Define the receiver site
x=input("Latitude: ");
y=input("Longitude: ");

% Create receiver site
rxs = rxsite("Name", "Recetor", ...
    "Latitude", x, ...
    "Longitude", y);
show(rxs)

% Number of transmitters
numTransmitters = 21;

% Initialize the signal strength matrix
signalStrengthMat = zeros(1, numTransmitters); 

% Calculate signal strengths
for txindex = 1:numTransmitters
    signalStrengthMat(txindex) = sigstrength(rxs, txs(txindex));
end

% Find the index of the maximum signal strength
[pot, bestserver] = max(signalStrengthMat);


% Display the result
result = sprintf("O best server do sitio é o setor nº: %d\n", bestserver);
result2 = sprintf("com uma potência de: %f\n dBm", pot);
disp(result)
disp(result2)