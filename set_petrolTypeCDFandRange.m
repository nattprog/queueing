function p= set_petrolTypeCDFandRange()
global petrolType__RANGE__MULTIPLIER;

global petrolType__vals petrolType__valsPrice petrolType__vals__prob petrolType__vals__prob__CDF petrolType__vals__prob__range

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