function p = calc_refuelTime(vehicleId, pumpidx)

    global refuelTime__vals refuelTime__vals_prob__range
    global vehicles__refuelTime__rands 
    global vehicles__refuelTime 

    for i = 1:length(refuelTime__vals{pumpidx})
        if (vehicles__refuelTime__rands(vehicleId) >= refuelTime__vals_prob__range{pumpidx}{i}{1} && vehicles__refuelTime__rands(vehicleId) <= refuelTime__vals_prob__range{pumpidx}{i}{2})
            vehicles__refuelTime(vehicleId) = refuelTime__vals{pumpidx}{i};
            % fprintf('Car: %1.0f pump: %1.0f rand: %10.6f lower: %10.6f upper: %10.6f refueltime: %10.6f\n', [vehicleId, pumpidx, vehicles__refuelTime__rands(vehicleId), refuelTime__vals_prob__range{pumpidx}{i}{1}, refuelTime__vals_prob__range{pumpidx}{i}{2}, refuelTime__vals{pumpidx}{i}])
            break;
        end
    end