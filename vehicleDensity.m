function p= vehicleDensity()
    
    global numOfVehicles isNonPeak;
    
    if isNonPeak == false % peak hours
        numOfVehicles = 10;
        
        return
    elseif isNonPeak == true % non-peak hours
        numOfVehicles = 5
        return
    end