function p= set_litresCDFandRange()
global litres__RANGE__MULTIPLIER;

global litres__vals litres__vals__prob litres__vals__prob__CDF litres__vals__prob__range;




% Creating probability CDF
sumProb = 0;
for i = 1:length(litres__vals__prob)
    sumProb = sumProb + litres__vals__prob{i};
    litres__vals__prob__CDF{i} = sumProb;
end

% Creating CDF range
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