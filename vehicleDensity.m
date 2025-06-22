function p= vehicleDensity()
    
    global numOfVehicles isNonPeak interArrivalTime__vals interArrivalTime__vals__prob;
    
    if isNonPeak == false % Peak hours, more vehicles, faster arrival times
        numOfVehicles = 15;
        interArrivalTime__vals = {0,1,2,3,4};
        interArrivalTime__vals__prob = {0.2,0.4,0.3,0.05,0.05};
        return
    elseif isNonPeak == true % Non-peak hours, less vehicles, more even arrival times
        numOfVehicles = 7;
        interArrivalTime__vals = {2,3,4,5,6,7,8,9};
        interArrivalTime__vals__prob = {0.05,0.12,0.15,0.18,0.18,0.15,0.12,0.05};
        return
    end