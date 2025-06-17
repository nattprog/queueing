function p= queue()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting randomiser seed
seed(69, 69);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF GLOBAL VARS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numOfVehicles = 10;


refuelTime__RANGE__MULTIPLIER = 100;
interArrivalTime__RANGE__MULTIPLIER = 1000;
petrolType__RANGE__MULTIPLIER = 100;
litres__RANGE__MULTIPLIER = 100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF GLOBAL VARS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF SETTING DISTRIBUTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

refuelTime__vals = {{1,2,3,4,5,6},
                    {3,4,5,6,7,8},
                    {2,3,4,5,6,7},
                    {4,5,6,7,8,9}};
refuelTime__vals__prob = {{0.1,0.2,0.3,0.25,0.1,0.05},
                            {0.2,0.1,0.25,0.3,0.05,0.1},
                            {0.1,0.1,0.2,0.05,0.3,0.25},
                            {0.2,0.3,0.2,0.1,0.1,0.1}};
refuelTime__vals__prob__CDF = {};
refuelTime__vals_prob__range = {};

for pump = 1:length(refuelTime__vals)
    % Creating: rft__vals, rft__vals__prob, rft__vals__prob__CDF

    % Setting service time
    rft__vals = refuelTime__vals{pump};
    % Setting service time 
    rft__vals__prob = refuelTime__vals__prob{pump};

    rft__vals__prob__CDF = {};

    % Creating probability CDF
    sumProb = 0;
    for i = 1:length(rft__vals__prob)
        sumProb = sumProb + rft__vals__prob{i};
        rft__vals__prob__CDF{i} = sumProb;
    end

    % Creating CDF range
    rft__vals__prob__range = {};
    lower = 0+1;
    higher = floor(refuelTime__RANGE__MULTIPLIER*rft__vals__prob__CDF{1});
    rft__vals__prob__range{1} = {lower, higher};
    for i = 2:length(rft__vals__prob__CDF)
        lower = floor(refuelTime__RANGE__MULTIPLIER*rft__vals__prob__CDF{i-1}) + 1;
        higher = floor(refuelTime__RANGE__MULTIPLIER*rft__vals__prob__CDF{i});
        rft__vals__prob__range{i} = {lower, higher};
    end

    % Checking validity
    if (length(rft__vals) ~= length(rft__vals__prob) || length(rft__vals) ~= length(rft__vals__prob__range))
        rft__vals
        rft__vals__prob
        rft__vals__prob__range
        disp('Error: Mismatched rft__vals, rft__vals__prob, rft__vals__prob__range')
        return
    elseif (abs(sumProb - 1) > 1e-10)
        rft__vals__prob
        disp('Error: rft__vals__prob does not add up to 1')
        return
    end

    refuelTime__vals__prob__CDF{pump} = rft__vals__prob__CDF;
    refuelTime__vals_prob__range{pump} = rft__vals__prob__range;
end

refuelTime__vals{4}
refuelTime__vals__prob{4}
refuelTime__vals__prob__CDF{4}
refuelTime__vals_prob__range{4}{1}

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
elseif (abs(sumProb - 1) > 1e-10)
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
elseif (abs(sumProb - 1) > 1e-10)
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
elseif (abs(sumProb - 1) > 1e-10)
    disp('Error: petrolType__vals__prob does not add up to 1')
    return
end

% petrolType = struct('val',petrolType__vals, 'prob', petrolType__vals__prob, 'CDF', petrolType__vals__prob__CDF, 'CDFRange', petrolType__vals__prob__range);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: litres__vals, litres__vals__prob, litres__vals__prob__CDF



% Setting service time
litres__vals = {10,20,30,40,50};
% Setting service time 
litres__vals__prob = {0.2,0.3,0.3,0.15,0.05};

litres__vals__prob__CDF = {};

% Creating probability CDF
sumProb = 0;
for i = 1:length(litres__vals__prob)
    sumProb = sumProb + litres__vals__prob{i};
    litres__vals__prob__CDF{i} = sumProb;
end

% Creating CDF range
litres__vals__prob__range = {};
lower = 0+1;
higher = floor(litres__RANGE__MULTIPLIER*litres__vals__prob__CDF{1});
litres__vals__prob__range{1} = {lower, higher};
for i = 2:length(litres__vals__prob__CDF)
    lower = floor(litres__RANGE__MULTIPLIER*litres__vals__prob__CDF{i-1}) + 1;
    higher = floor(litres__RANGE__MULTIPLIER*litres__vals__prob__CDF{i});
    litres__vals__prob__range{i} = {lower, higher};
end

% Checking validity
if (length(litres__vals) ~= length(litres__vals__prob) || length(litres__vals) ~= length(litres__vals__prob__range))
    disp('Error: Mismatched litres__vals, litres__vals__prob, litres__vals__prob__range')
    return
elseif (abs(sumProb - 1) > 1e-10)
    disp('Error: litres__vals__prob does not add up to 1')
    return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF SETTING DISTRIBUTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF GENERATING VEHICLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfVehicles, vehicles__refuelTime__rands (list of randomised values for getting service times of the vehicles)


% number of vehicles numOfVehicles declared at start

% randomised service times from 1 to refuelTime__RANGE__MULTIPLIER
vehicles__refuelTime__rands = floor(1+refuelTime__RANGE__MULTIPLIER*rand(1,numOfVehicles));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfInterArrivals, vehicles__interArrivalTime__rands (list of randomised values for getting the inter arrival times)

% randomised inter arrival time from 1 to interArrivalTime__RANGE__MULTIPLIER
vehicles__interArrivalTime__rands = [0, floor(1+interArrivalTime__RANGE__MULTIPLIER*rand(1,numOfVehicles-1))];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: vehicles__petrolType__rands (list of randomised values for getting the petrol types)

% randomised inter arrival time from 1 to petrolType__RANGE__MULTIPLIER
vehicles__petrolType__rands = floor(1+petrolType__RANGE__MULTIPLIER*rand(1,numOfVehicles));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: vehicles__litres__rands (list of randomised values for getting the litres)

% randomised inter arrival time from 1 to petrolType__RANGE__MULTIPLIER
vehicles__litres__rands = floor(1+litres__RANGE__MULTIPLIER*rand(1,numOfVehicles));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF GENERATING VEHICLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



disp('Queue ended successfully')