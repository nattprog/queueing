function p = calc_arrivalTime()
global numOfVehicles;

global interArrivalTime__vals interArrivalTime__vals__prob interArrivalTime__vals__prob__CDF interArrivalTime__vals__prob__range;

global vehicles__interArrivalTime__rands;

global vehicles__interArrivalTime vehicles__arrivalTime;

vehicles__interArrivalTime(1) = 0;
vehicles__arrivalTime(1) = 0;

sumArrival = 0;
for i = 2:numOfVehicles
    for ii = 1:length(interArrivalTime__vals)
        if (vehicles__interArrivalTime__rands(i) >= interArrivalTime__vals__prob__range{ii}{1} && vehicles__interArrivalTime__rands(i) <= interArrivalTime__vals__prob__range{ii}{2})
            vehicles__interArrivalTime(i) = interArrivalTime__vals{ii};
            break;
        end
    end

    vehicles__arrivalTime(i) = vehicles__arrivalTime(i-1) + vehicles__interArrivalTime(i);
end