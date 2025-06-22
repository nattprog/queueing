function queue_system()
    global VEHICLE_LOG
    global numOfVehicles vehicles__arrivalTime vehicles__refuelTime vehicles__petrolType vehicles__litres;
    global begin_times end_times wait_times spent_times line_nums pump_nums;
    global station_exploded;
    global vehicle_data;
    
    line_nums = zeros(1, numOfVehicles);
    pump_nums = zeros(1, numOfVehicles);
    pump_free = [0, 0, 0, 0];
    lane1_queue = [];
    lane2_queue = [];
    
    begin_times = zeros(1, numOfVehicles);
    end_times = zeros(1, numOfVehicles);
    wait_times = zeros(1, numOfVehicles);
    spent_times = zeros(1, numOfVehicles);
    
    vehicles__refuelTime = zeros(1, numOfVehicles);
    
    VEHICLE_LOG = {};
    
    vehicle_data = cell(numOfVehicles, 9); % 9 columns: vehicle_num, arrival_time, refuel_time, petrol_type, line_num, pump_num, begin_time, end_time, spent_time
    
    for i = 1:numOfVehicles
        vehicle_num = i;
        arrival_time = vehicles__arrivalTime(i);
        petrol_type = vehicles__petrolType{i};
        
        rand_val = rand();
        line_num = (rand_val < 0.5) + 1;
        line_nums(i) = line_num;
        
        % Display arrival message
        % fprintf('Vehicle %d arrived at minute %.2f and joined Lane %d\n', ...
        %         vehicle_num, arrival_time, line_num);
        addLog(arrival_time,sprintf('Vehicle %d arrived at minute %.2f and joined Lane %d\n', ...
                vehicle_num, arrival_time, line_num));
        
        if line_num == 1
            if isempty(lane1_queue)
                earliest_pump = min(pump_free(1:2));
                pump_idx = find(pump_free(1:2) == earliest_pump, 1);
                calc_refuelTime(vehicle_num, pump_idx);
                begin_time = max(arrival_time, earliest_pump);
                wait_time = begin_time - arrival_time;
                
                if station_exploded
                    return;
                end
                check_explosion(pump_idx, begin_time);
                if station_exploded
                    return;
                end
                
                end_time = begin_time + vehicles__refuelTime(vehicle_num);
                pump_free(pump_idx) = end_time;
                
                begin_times(i) = begin_time;
                end_times(i) = end_time;
                wait_times(i) = wait_time;
                spent_times(i) = end_time - arrival_time;
                pump_nums(i) = pump_idx;
                
                % fprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                %         vehicle_num, petrol_type, pump_idx, begin_time);
                addLog(begin_time, sprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                        vehicle_num, petrol_type, pump_idx, begin_time));
                
                spent_time = end_time - arrival_time;
                vehicle_data{i, 1} = vehicle_num;
                vehicle_data{i, 2} = arrival_time;
                vehicle_data{i, 3} = vehicles__refuelTime(vehicle_num);
                vehicle_data{i, 4} = petrol_type;
                vehicle_data{i, 5} = line_num;
                vehicle_data{i, 6} = pump_idx;
                vehicle_data{i, 7} = begin_time;
                vehicle_data{i, 8} = end_time;
                vehicle_data{i, 9} = spent_time;
            else
                lane1_queue = [lane1_queue; vehicle_num, arrival_time, vehicles__refuelTime(vehicle_num), petrol_type];
            end
        else
            if isempty(lane2_queue)
                earliest_pump = min(pump_free(3:4));
                pump_idx = find(pump_free(3:4) == earliest_pump, 1) + 2;
                
                calc_refuelTime(vehicle_num, pump_idx);
                
                begin_time = max(arrival_time, earliest_pump);
                wait_time = begin_time - arrival_time;
                
                if station_exploded
                    return;
                end
                check_explosion(pump_idx, begin_time);
                if station_exploded
                    return;
                end
                
                end_time = begin_time + vehicles__refuelTime(vehicle_num);
                pump_free(pump_idx) = end_time;
                
                begin_times(i) = begin_time;
                end_times(i) = end_time;
                wait_times(i) = wait_time;
                spent_times(i) = end_time - arrival_time;
                pump_nums(i) = pump_idx;
                
                % fprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                %         vehicle_num, petrol_type, pump_idx, begin_time);
                addLog(begin_time, sprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                        vehicle_num, petrol_type, pump_idx, begin_time));
                
                spent_time = end_time - arrival_time;
                vehicle_data{i, 1} = vehicle_num;
                vehicle_data{i, 2} = arrival_time;
                vehicle_data{i, 3} = vehicles__refuelTime(vehicle_num);
                vehicle_data{i, 4} = petrol_type;
                vehicle_data{i, 5} = line_num;
                vehicle_data{i, 6} = pump_idx;
                vehicle_data{i, 7} = begin_time;
                vehicle_data{i, 8} = end_time;
                vehicle_data{i, 9} = spent_time;
            else
                lane2_queue = [lane2_queue; vehicle_num, arrival_time, vehicles__refuelTime(vehicle_num), petrol_type];
            end
        end
        
        % Display departure
        if begin_times(i) > 0 || vehicle_num == 1 % Check if begin_time was set OR if vehicle is first vehicle
            % fprintf('Vehicle %d finished refueling and departed Pump %d at minute %.2f\n', ...
            %         vehicle_num, pump_idx, end_times(i));
            addLog(end_times(i), sprintf('Vehicle %d finished refueling and departed Pump %d at minute %.2f\n', ...
                    vehicle_num, pump_idx, end_times(i)));
        end
        
        while ~isempty(lane1_queue)
            earliest_pump = min(pump_free(1:2));
            if earliest_pump <= max(end_times)
                vehicle = lane1_queue(1, :);
                lane1_queue = lane1_queue(2:end, :);
                vehicle_num = vehicle(1);
                arrival_time = vehicle(2);
                refuel_time = vehicle(3);
                petrol_type = vehicle(4);
                pump_idx = find(pump_free(1:2) == earliest_pump, 1);
                begin_time = max(arrival_time, earliest_pump);
                wait_time = begin_time - arrival_time;
                end_time = begin_time + refuel_time;
                pump_free(pump_idx) = end_time;
                
                if station_exploded
                    return;
                end
                check_explosion(pump_idx, begin_time);
                if station_exploded
                    return;
                end
                
                idx = find([1:numOfVehicles] == vehicle_num);
                begin_times(idx) = begin_time;
                end_times(idx) = end_time;
                wait_times(idx) = wait_time;
                spent_times(idx) = end_time - arrival_time;
                pump_nums(idx) = pump_idx;
                
                % fprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                %         vehicle_num, petrol_type, pump_idx, begin_time);
                addLog(begin_time, sprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                        vehicle_num, petrol_type, pump_idx, begin_time));
                % fprintf('Vehicle %d finished refueling and departed Pump %d at minute %.2f\n', ...
                %         vehicle_num, pump_idx, end_time);
                addLog(end_time, sprintf('Vehicle %d finished refueling and departed Pump %d at minute %.2f\n', ...
                        vehicle_num, pump_idx, end_time));
                
                spent_time = end_time - arrival_time;
                vehicle_data{idx, 1} = vehicle_num;
                vehicle_data{idx, 2} = arrival_time;
                vehicle_data{idx, 3} = refuel_time;
                vehicle_data{idx, 4} = petrol_type;
                vehicle_data{idx, 5} = line_nums(idx);
                vehicle_data{idx, 6} = pump_idx;
                vehicle_data{idx, 7} = begin_time;
                vehicle_data{idx, 8} = end_time;
                vehicle_data{idx, 9} = spent_time;
            else
                break;
            end
        end
        
        while ~isempty(lane2_queue)
            earliest_pump = min(pump_free(3:4));
            if earliest_pump <= max(end_times)
                vehicle = lane2_queue(1, :);
                lane2_queue = lane2_queue(2:end, :);
                vehicle_num = vehicle(1);
                arrival_time = vehicle(2);
                refuel_time = vehicle(3);
                petrol_type = vehicle(4);
                pump_idx = find(pump_free(3:4) == earliest_pump, 1) + 2;
                begin_time = max(arrival_time, earliest_pump);
                wait_time = begin_time - arrival_time;
                end_time = begin_time + refuel_time;
                pump_free(pump_idx) = end_time;
                
                if station_exploded
                    return;
                end
                check_explosion(pump_idx, begin_time);
                if station_exploded
                    return;
                end
                
                idx = find([1:numOfVehicles] == vehicle_num);
                begin_times(idx) = begin_time;
                end_times(idx) = end_time;
                wait_times(idx) = wait_time;
                spent_times(idx) = end_time - arrival_time;
                pump_nums(idx) = pump_idx;
                
                % fprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                %         vehicle_num, petrol_type, pump_idx, begin_time);
                addLog(begin_time, sprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                        vehicle_num, petrol_type, pump_idx, begin_time));
                % fprintf('Vehicle %d finished refueling and departed Pump %d at minute %.2f\n', ...
                %         vehicle_num, pump_idx, end_time);
                addLog(end_time, sprintf('Vehicle %d finished refueling and departed Pump %d at minute %.2f\n', ...
                        vehicle_num, pump_idx, end_time));
                
                spent_time = end_time - arrival_time;
                vehicle_data{idx, 1} = vehicle_num;
                vehicle_data{idx, 2} = arrival_time;
                vehicle_data{idx, 3} = refuel_time;
                vehicle_data{idx, 4} = petrol_type;
                vehicle_data{idx, 5} = line_nums(idx);
                vehicle_data{idx, 6} = pump_idx;
                vehicle_data{idx, 7} = begin_time;
                vehicle_data{idx, 8} = end_time;
                vehicle_data{idx, 9} = spent_time;
            else
                break;
            end
        end
    end
    
    % Print ordered version
    for i = 1:length(VEHICLE_LOG)
        if ~iscell(VEHICLE_LOG{i})
            continue
        end
        for j = 1:length(VEHICLE_LOG{i})
            fprintf(VEHICLE_LOG{i}{j})
        end
    end

    % FreeMat-compatible display, we can comment this out in the final version
    if exist('vehicle_data', 'var')
        fprintf('VehicleNum\tArrivalTime\tRefuelTime\tPetrolType\tLineNum\tPumpNum\tBeginTime\tEndTime\tSpentTime\n');
        for i = 1:numOfVehicles
            if ~all(cellfun(@isempty, vehicle_data(i, :))) % Use function handle @isempty
                fprintf('%.0f\t\t%.2f\t\t%.2f\t\t%s\t\t%.0f\t\t%.0f\t\t%.2f\t\t%.2f\t\t%.2f\n', ...
                        vehicle_data{i, 1}, vehicle_data{i, 2}, vehicle_data{i, 3}, vehicle_data{i, 4}, ...
                        vehicle_data{i, 5}, vehicle_data{i, 6}, vehicle_data{i, 7}, vehicle_data{i, 8}, vehicle_data{i, 9});
            end
        end
    end



end
