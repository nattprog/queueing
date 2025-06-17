function p= queue()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting randomiser seed
seed(69, 69);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: refuelTime__vals, refuelTime__vals__prob, refuelTime__vals__prob__CDF


% Setting service time
refuelTime__vals = [1,2,3,4,5,6;];
% Setting service time 
refuelTime__vals__prob = [0.1,0.2,0.3,0.25,0.1,0.05;];

refuelTime__vals__prob__CDF = [];

% Checking validity of service time and ST probability
sumProb = 0;
for i = 1:length(refuelTime__vals__prob)
    sumProb = sumProb + refuelTime__vals__prob(i);
    refuelTime__vals__prob__CDF(i) = sumProb;
end
if (length(refuelTime__vals) ~= length(refuelTime__vals__prob))
    disp('Error: Mismatched ST and ST probability')
    return
elseif (sumProb ~= 1)
    disp('Error: ST probability does not add up to 1')
    return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: interArrivalTime__vals, interArrivalTime__vals__prob, interArrivalTime__vals__prob__CDF


% Setting service time
interArrivalTime__vals = [1,2,3,4,5,6;];
% Setting service time 
interArrivalTime__vals__prob = [0.1,0.2,0.3,0.25,0.1,0.05;];

interArrivalTime__vals__prob__CDF = [];

% Checking validity of service time and ST probability
sumProb = 0;
for i = 1:length(interArrivalTime__vals__prob)
    sumProb = sumProb + interArrivalTime__vals__prob(i);
    interArrivalTime__vals__prob__CDF(i) = sumProb;
end
if (length(interArrivalTime__vals) ~= length(interArrivalTime__vals__prob))
    disp('Error: Mismatched ST and ST probability')
    return
elseif (sumProb ~= 1)
    disp('Error: ST probability does not add up to 1')
    return
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfVehicles, vehicles__refuelTime__rands (list of randomised values for getting service times of the vehicles)


% number of patrons
numOfVehicles = 20;

% randomised service times from 1 to 100
vehicles__refuelTime__rands = floor(1+100*rand(1,numOfVehicles));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: numOfInterArrivals, vehicles__interArrivalTime__rands (list of randomised values for getting the inter arrival times)

% numOfInterArrivals
numOfInterArrivals = numOfVehicles-1;

% randomised inter arrival time from 1 to 100
vehicles__interArrivalTime__rands = floor(1+100*rand(1,numOfInterArrivals));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vehicles__refuelTime__rands
vehicles__interArrivalTime__rands

disp('Queue end')