function p= set_vehicles()


global numOfVehicles;
global refuelTime__RANGE__MULTIPLIER interArrivalTime__RANGE__MULTIPLIER petrolType__RANGE__MULTIPLIER litres__RANGE__MULTIPLIER;

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
