function p= set_refuelTimeCDFandRange()
global refuelTime__RANGE__MULTIPLIER;
global refuelTime__vals refuelTime__vals__prob refuelTime__vals__prob__CDF refuelTime__vals_prob__range;

% Creating the distributions for all 4 pumps
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