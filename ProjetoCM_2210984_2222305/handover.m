% Coordenates
LON=[-9.451364,-9.451092,-9.450867,-9.450520,-9.450312,-9.450112,-9.449969,-9.449710,-9.449447,-9.449270,-9.448969,-9.448756,-9.448479,-9.448168,-9.447890,-9.447663,-9.447297,-9.447092,-9.446908,-9.446537,-9.446253,-9.445975,-9.445880,-9.446159,-9.446364,-9.446642,-9.446912,-9.447018,-9.447105,-9.447155,-9.447175,-9.447518,-9.447847];
LAT=[38.842966,38.843033,38.843100,38.843184,38.843258,38.843321,38.843374,38.843461,38.843530,38.843577,38.843637,38.843685,38.843749,38.843813,38.843891,38.843956,38.844088,38.844191,38.844251,38.844380,38.844438,38.844529,38.844627,38.844814,38.844971,38.845141,38.845388,38.845643,38.845950,38.846263,38.846451,38.846377,38.846230];

% Create receiver sites
rxs = rxsite("Name","Rx " + (1:length(LON)), ...
    "Latitude",LAT, ...
    "Longitude",LON);

show(rxs)

numReceivers = length(rxs);
numTransmitters = length(txs(8:10));
signalStrengthMatrix = zeros(numReceivers, numTransmitters);

% Calculate signal strengths for each receiver-transmitter pair
for rxIndex = 1:numReceivers
    for txIndex = 1:numTransmitters
        % Calculate signal strength
        signalStrengthMatrix(rxIndex, txIndex) = sigstrength(rxs(rxIndex), txs(txIndex + 7)); % txIndex + 7 to access txs(8:10)
    end
end
signalStrengthMatrixT=signalStrengthMatrix';

% Plot signals
figure
plot(signalStrengthMatrixT(1,1:33),'blue');
hold on
plot(signalStrengthMatrixT(2,1:33),'red');
hold on
plot(signalStrengthMatrixT(3,1:33),'green');
hold on
legend('cell 8','cell 9','cell 10')
ylabel("Potencia (dBm)");
xlabel("posição")
