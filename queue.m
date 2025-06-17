function p= queue()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setting randomiser seed
seed(69, 69);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF GLOBAL VARS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global refuelTime__RANGE__MULTIPLIER interArrivalTime__RANGE__MULTIPLIER petrolType__RANGE__MULTIPLIER litres__RANGE__MULTIPLIER;

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

global refuelTime__vals refuelTime__vals__prob refuelTime__vals__prob__CDF refuelTime__vals_prob__range;

refuelTime__vals = {{1,2,3,4,5,6},
                    {3,4,5,6,7,8},
                    {2,3,4,5,6,7},
                    {4,5,6,7,8,9}};

refuelTime__vals__prob = {{0.1,0.2,0.3,0.25,0.1,0.05},
                            {0.2,0.1,0.25,0.3,0.05,0.1},
                            {0.1,0.1,0.2,0.05,0.3,0.25},
                            {0.2,0.3,0.2,0.1,0.1,0.1}};

set_refuelTimeCDFandRange();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: interArrivalTime__vals, interArrivalTime__vals__prob, interArrivalTime__vals__prob__CDF, interArrivalTime__vals__prob__range

global interArrivalTime__vals interArrivalTime__vals__prob interArrivalTime__vals__prob__CDF interArrivalTime__vals__prob__range;

% Setting service time
interArrivalTime__vals = {1,2,3,4,5,6,7,8};
% Setting service time 
interArrivalTime__vals__prob = {0.125,0.125,0.125,0.125,0.125,0.125,0.125,0.125};

set_interArrivalTimeCDFandRange();


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: petrolType__vals, petrolType__valsPrice, petrolType__vals__prob, petrolType__vals__prob__CDF, petrolType__vals__prob__range

global petrolType__vals petrolType__valsPrice petrolType__vals__prob petrolType__vals__prob__CDF petrolType__vals__prob__range

% Setting petrol types
petrolType__vals = {'Primax95', 'Primax97', 'Dynamic Diesel'};
% Setting petrol price for types
petrolType__valsPrice = {2.50, 3.10, 4.10};
% Setting petrol types prob distribution
petrolType__vals__prob = {0.4, 0.3, 0.3};

set_petrolTypeCDFandRange();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Creating: litres__vals, litres__vals__prob, litres__vals__prob__CDF

global litres__vals litres__vals__prob litres__vals__prob__CDF litres__vals__prob__range;

% Setting service time
litres__vals = {10,20,30,40,50};
% Setting service time 
litres__vals__prob = {0.2,0.3,0.3,0.15,0.05};

set_litresCDFandRange();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF SETTING DISTRIBUTION
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF GENERATING VEHICLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

global numOfVehicles;
global vehicles__refuelTime__rands vehicles__interArrivalTime__rands vehicles__petrolType__rands vehicles__litres__rands

numOfVehicles = 10;
set_vehicles();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF GENERATING VEHICLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

table_interArrivalTime()
table_petrolType()
table_refuelTime()
table_litres()
disp('vehicles__refuelTime__rands')
vehicles__refuelTime__rands
disp('vehicles__interArrivalTime__rands')
vehicles__interArrivalTime__rands
disp('vehicles__petrolType__rands')
vehicles__petrolType__rands
disp('vehicles__litres__rands')
vehicles__litres__rands

disp('Queue ended successfully')