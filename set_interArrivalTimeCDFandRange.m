function p= set_interArrivalTimeCDFandRange()
global interArrivalTime__RANGE__MULTIPLIER;
global interArrivalTime__vals interArrivalTime__vals__prob interArrivalTime__vals__prob__CDF interArrivalTime__vals__prob__range;

% Setting probability CDF
sumProb = 0;
for i = 1:length(interArrivalTime__vals__prob)
    sumProb = sumProb + interArrivalTime__vals__prob{i};
    interArrivalTime__vals__prob__CDF{i} = sumProb;
end

% Creating CDF range
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