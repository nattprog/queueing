function p= queue()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting randomiser seed
seed(69, 69);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numOfVehicles = 10;
numOfPetrolTypes = 10;

refuelTime__RANGE__MULTIPLIER = 100;
interArrivalTime__RANGE__MULTIPLIER = 100;
petrolType__RANGE__MULTIPLIER = 10;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: refuelTime__vals, refuelTime__vals__prob, refuelTime__vals__prob__CDF



% Setting service time
refuelTime__vals = [1,2,3,4,5,6;];
% Setting service time 
refuelTime__vals__prob = [0.1,0.2,0.3,0.25,0.1,0.05;];

refuelTime__vals__prob__CDF = [];

% Setting probability CDF
sumProb = 0;
for i = 1:length(refuelTime__vals__prob)
    sumProb = sumProb + refuelTime__vals__prob(i);
    refuelTime__vals__prob__CDF(i) = sumProb;
end

% Checking validity
if (length(refuelTime__vals) ~= length(refuelTime__vals__prob))
    disp('Error: Mismatched refuelTime__vals and refuelTime__vals__prob')
    return
elseif (sumProb ~= 1)
    disp('Error: refuelTime__vals__prob does not add up to 1')
    return
end

refuelTime__vals__prob__range = []
lower = 1;
higher = refuelTime__vals__prob__CDF(1);
refuelTime__vals__prob__range(1) = [lower, higher];

for i = 2:length(refuelTime__vals__prob__CDF)
    lower = refuelTime__vals__prob__CDF(i-1);
    higher = refuelTime__vals__prob__CDF(i);
    refuelTime__vals__prob__range(i) = [lower, higher]
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: interArrivalTime__vals, interArrivalTime__vals__prob, interArrivalTime__vals__prob__CDF


% Setting service time
interArrivalTime__vals = [1,2,3,4,5,6,7,8;];
% Setting service time 
interArrivalTime__vals__prob = [0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125,;];

interArrivalTime__vals__prob__CDF = [];

% Setting probability CDF
sumProb = 0;
for i = 1:length(interArrivalTime__vals__prob)
    sumProb = sumProb + interArrivalTime__vals__prob(i);
    interArrivalTime__vals__prob__CDF(i) = sumProb;
end

% Checking validity
if (length(interArrivalTime__vals) ~= length(interArrivalTime__vals__prob))
    disp('Error: Mismatched interArrivalTime__vals and interArrivalTime__vals__prob')
    return
elseif (sumProb ~= 1)
    disp('Error: interArrivalTime__vals__prob does not add up to 1')
    return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: petrolType__vals, petrolType__vals__prob, petrolType__vals__prob__CDF

% Primax95, Primax97, Dynamic Diesel

% Setting petrol types
petrolType__vals = [1,2,3;]; % ['Primax95', 'Primax97', 'Dynamic Diesel';];

% Setting petrol types prob distribution
petrolType__vals__prob = [0.4, 0.3, 0.3;];

petrolType__vals__prob__CDF = [];

% Setting probability CDF
sumProb = 0;
for i = 1:length(petrolType__vals__prob)
    sumProb = sumProb + petrolType__vals__prob(i);
    petrolType__vals__prob__CDF(i) = sumProb;
end

% Checking validity
if (length(petrolType__vals) ~= length(petrolType__vals__prob))
    disp('Error: Mismatched petrolType__vals and petrolType__vals__prob')
    return
elseif (sumProb ~= 1)
    disp('Error: petrolType__vals__prob does not add up to 1')
    return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfVehicles, vehicles__refuelTime__rands (list of randomised values for getting service times of the vehicles)


% number of vehicles
numOfVehicles = 20;

% randomised service times from 1 to 100
vehicles__refuelTime__rands = floor(1+refuelTime__RANGE__MULTIPLIER*rand(1,numOfVehicles));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfInterArrivals, vehicles__interArrivalTime__rands (list of randomised values for getting the inter arrival times)

% numOfInterArrivals
numOfInterArrivals = numOfVehicles-1;

% randomised inter arrival time from 1 to 100
vehicles__interArrivalTime__rands = floor(1+interArrivalTime__RANGE__MULTIPLIER*rand(1,numOfInterArrivals));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp('Queue ended successfully')