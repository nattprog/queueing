function p= queue()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting randomiser seed
seed(69, 69);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numOfVehicles = 10;


refuelTime__RANGE__MULTIPLIER = 100;
interArrivalTime__RANGE__MULTIPLIER = 1000;
petrolType__RANGE__MULTIPLIER = 100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: refuelTime__vals, refuelTime__vals__prob, refuelTime__vals__prob__CDF



% Setting service time
refuelTime__vals = {1,2,3,4,5,6};
% Setting service time 
refuelTime__vals__prob = {0.1,0.2,0.3,0.25,0.1,0.05};

refuelTime__vals__prob__CDF = {};

% Creating probability CDF
sumProb = 0;
for i = 1:length(refuelTime__vals__prob)
    sumProb = sumProb + refuelTime__vals__prob{i};
    refuelTime__vals__prob__CDF{i} = sumProb;
end

% Creating CDF range
refuelTime__vals__prob__range = {};
lower = 0+1;
higher = floor(refuelTime__RANGE__MULTIPLIER*refuelTime__vals__prob__CDF{1});
refuelTime__vals__prob__range{1} = {lower, higher};
for i = 2:length(refuelTime__vals__prob__CDF)
    lower = floor(refuelTime__RANGE__MULTIPLIER*refuelTime__vals__prob__CDF{i-1}) + 1;
    higher = floor(refuelTime__RANGE__MULTIPLIER*refuelTime__vals__prob__CDF{i});
    refuelTime__vals__prob__range{i} = {lower, higher};
end

% Checking validity
if (length(refuelTime__vals) ~= length(refuelTime__vals__prob) || length(refuelTime__vals) ~= length(refuelTime__vals__prob__range))
    disp('Error: Mismatched refuelTime__vals, refuelTime__vals__prob, refuelTime__vals__prob__range')
    return
elseif (sumProb ~= 1)
    disp('Error: refuelTime__vals__prob does not add up to 1')
    return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: interArrivalTime__vals, interArrivalTime__vals__prob, interArrivalTime__vals__prob__CDF


% Setting service time
interArrivalTime__vals = {1,2,3,4,5,6,7,8};
% Setting service time 
interArrivalTime__vals__prob = {0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125};

interArrivalTime__vals__prob__CDF = {};

% Setting probability CDF
sumProb = 0;
for i = 1:length(interArrivalTime__vals__prob)
    sumProb = sumProb + interArrivalTime__vals__prob{i};
    interArrivalTime__vals__prob__CDF{i} = sumProb;
end

% Creating CDF range
interArrivalTime__vals__prob__range = {};
lower = 0+1;
higher = floor(interArrivalTime__RANGE__MULTIPLIER*interArrivalTime__vals__prob__CDF{1});
interArrivalTime__vals__prob__range{1} = {lower, higher};
for i = 2:length(interArrivalTime__vals__prob__CDF)
    lower = floor(interArrivalTime__RANGE__MULTIPLIER*interArrivalTime__vals__prob__CDF{i-1}) + 1;
    higher = floor(interArrivalTime__RANGE__MULTIPLIER*interArrivalTime__vals__prob__CDF{i});
    interArrivalTime__vals__prob__range{i} = {lower, higher};
end

% Checking validity
if (length(interArrivalTime__vals) ~= length(interArrivalTime__vals__prob) || length(interArrivalTime__vals) ~= length(interArrivalTime__vals__prob__range))
    disp('Error: Mismatched interArrivalTime__vals, interArrivalTime__vals__prob, interArrivalTime__vals__prob__range')
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
petrolType__vals = {'Primax95', 'Primax97', 'Dynamic Diesel'};
petrolType__valsPrice = {2.50, 3.10, 4.10};

% Setting petrol types prob distribution
petrolType__vals__prob = {0.4, 0.3, 0.3};

petrolType__vals__prob__CDF = {};

% Setting probability CDF
sumProb = 0;
for i = 1:length(petrolType__vals__prob)
    sumProb = sumProb + petrolType__vals__prob{i};
    petrolType__vals__prob__CDF{i} = sumProb;
end

% Checking validity
if (length(petrolType__vals) ~= length(petrolType__vals__prob))
    disp('Error: Mismatched petrolType__vals and petrolType__vals__prob')
    return
elseif (sumProb ~= 1)
    disp('Error: petrolType__vals__prob does not add up to 1')
    return
end

% Creating CDF range
petrolType__vals__prob__range = {};
lower = 0+1;
higher = floor(petrolType__RANGE__MULTIPLIER*petrolType__vals__prob__CDF{1});
petrolType__vals__prob__range{1} = {lower, higher};
for i = 2:length(petrolType__vals__prob__CDF)
    lower = floor(petrolType__RANGE__MULTIPLIER*petrolType__vals__prob__CDF{i-1}) + 1;
    higher = floor(petrolType__RANGE__MULTIPLIER*petrolType__vals__prob__CDF{i});
    petrolType__vals__prob__range{i} = {lower, higher};
end

% Checking validity
if (length(petrolType__vals) ~= length(petrolType__vals__prob) || length(petrolType__vals) ~= length(petrolType__vals__prob__range))
    disp('Error: Mismatched petrolType__vals, petrolType__vals__prob, petrolType__vals__prob__range')
    return
elseif (sumProb ~= 1)
    disp('Error: petrolType__vals__prob does not add up to 1')
    return
end

% petrolType = struct('val',petrolType__vals, 'prob', petrolType__vals__prob, 'CDF', petrolType__vals__prob__CDF, 'CDFRange', petrolType__vals__prob__range);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfVehicles, vehicles__refuelTime__rands (list of randomised values for getting service times of the vehicles)


% number of vehicles numOfVehicles declared at start

% randomised service times from 1 to refuelTime__RANGE__MULTIPLIER
vehicles__refuelTime__rands = floor(1+refuelTime__RANGE__MULTIPLIER*rand(1,numOfVehicles));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfInterArrivals, vehicles__interArrivalTime__rands (list of randomised values for getting the inter arrival times)

% numOfInterArrivals
numOfInterArrivals = numOfVehicles-1;

% randomised inter arrival time from 1 to interArrivalTime__RANGE__MULTIPLIER
vehicles__interArrivalTime__rands = floor(1+interArrivalTime__RANGE__MULTIPLIER*rand(1,numOfInterArrivals));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfInterArrivals, vehicles__interArrivalTime__rands (list of randomised values for getting the inter arrival times)

% randomised inter arrival time from 1 to petrolType__RANGE__MULTIPLIER
vehicles__interArrivalTime__rands = floor(1+petrolType__RANGE__MULTIPLIER*rand(1,numOfVehicles));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



disp('Queue ended successfully')