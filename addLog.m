function p = addLog(time, string)
global VEHICLE_LOG

    if (isempty(VEHICLE_LOG))
        VEHICLE_LOG = {};
    end

    timeIndex = time+1;
    if (timeIndex > length(VEHICLE_LOG))
        VEHICLE_LOG{timeIndex} = {};
    end

    if ~iscell(VEHICLE_LOG{timeIndex}) && VEHICLE_LOG{timeIndex} == 0
        VEHICLE_LOG{timeIndex} = {};
    end
    
    len = length(VEHICLE_LOG{timeIndex});
    VEHICLE_LOG{timeIndex}{len+1} = string;
end