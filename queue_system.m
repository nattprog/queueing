function queue_system()
    % FIFO Queueing System for Petrol Station Simulator
    global numOfVehicles vehicles__arrivalTime vehicles__refuelTime vehicles__petrolType vehicles__litres;
    global begin_times end_times wait_times spent_times line_nums pump_nums;
    
    % Declare new variables for queueing
    line_nums = zeros(1, numOfVehicles); % Lane assignments (1 or 2)
    pump_nums = zeros(1, numOfVehicles); % Pump assignments (1, 2, 3, or 4)
    pump_free = [0, 0, 0, 0]; % Time when each pump is free (P1, P2, P3, P4)
    lane1_queue = []; % FIFO queue for Lane 1: [vehicle_num, arrival_time, refuel_time, petrol_type]
    lane2_queue = []; % FIFO queue for Lane 2
    
    % Initialize timing arrays
    begin_times = zeros(1, numOfVehicles); % Begin times for each vehicle
    end_times = zeros(1, numOfVehicles);   % End times for each vehicle
    wait_times = zeros(1, numOfVehicles);  % Wait times for each vehicle
    spent_times = zeros(1, numOfVehicles); % Spent times for each vehicle
    
    % Initialize refuel_time if not provided (using litres as proxy)
    if isempty(vehicles__refuelTime)
        vehicles__refuelTime = vehicles__litres * 0.1; % Example: 1 minute per 10 litres
    end
    
    % Process vehicles in chronological order
    for i = 1:numOfVehicles
        vehicle_num = i;
        arrival_time = vehicles__arrivalTime(i);
        refuel_time = vehicles__refuelTime(i);
        petrol_type = vehicles__petrolType{i};
        
        % Assign to Lane 1 or 2 (random, using main program's randomizer)
        rand_val = rand(); % Replace with M1�s randomizer
        line_num = (rand_val < 0.5) + 1; % Lane 1 or 2
        line_nums(i) = line_num;
        
        % Display arrival message
        fprintf('Vehicle %d arrived at minute %.2f and joined Lane %d\n', ...
                vehicle_num, arrival_time, line_num);
        
        % Assign to pump or queue
        if line_num == 1
            % Lane 1: Check Pump 1 or 2
            if isempty(lane1_queue)
                earliest_pump = min(pump_free(1:2));
                pump_idx = find(pump_free(1:2) == earliest_pump, 1);
                begin_time = max(arrival_time, earliest_pump);
                wait_time = begin_time - arrival_time;
                end_time = begin_time + refuel_time;
                pump_free(pump_idx) = end_time;
                
                % Store timing variables
                begin_times(i) = begin_time;
                end_times(i) = end_time;
                wait_times(i) = wait_time;
                spent_times(i) = end_time - arrival_time;
                pump_nums(i) = pump_idx;
                
                fprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                        vehicle_num, petrol_type, pump_idx, begin_time);
            else
                % Add to Lane 1 queue
                lane1_queue = [lane1_queue; vehicle_num, arrival_time, refuel_time, petrol_type];
            end
        else
            % Lane 2: Check Pump 3 or 4
            if isempty(lane2_queue)
                earliest_pump = min(pump_free(3:4));
                pump_idx = find(pump_free(3:4) == earliest_pump, 1) + 2;
                begin_time = max(arrival_time, earliest_pump);
                wait_time = begin_time - arrival_time;
                end_time = begin_time + refuel_time;
                pump_free(pump_idx) = end_time;
                
                % Store timing variables
                begin_times(i) = begin_time;
                end_times(i) = end_time;
                wait_times(i) = wait_time;
                spent_times(i) = end_time - arrival_time;
                pump_nums(i) = pump_idx;
                
                fprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                        vehicle_num, petrol_type, pump_idx, begin_time);
            else
                % Add to Lane 2 queue
                lane2_queue = [lane2_queue; vehicle_num, arrival_time, refuel_time, petrol_type];
            end
        end
        
        % Display departure
        if begin_times(i) > 0 % Check if begin_time was set
            fprintf('Vehicle %d finished refueling and departed at minute %.2f\n', ...
                    vehicle_num, end_times(i));
        end
        
        % Process Lane 1 queue
        while ~isempty(lane1_queue)
            earliest_pump = min(pump_free(1:2)); 
            if earliest_pump <= max(end_times) % Use latest end time
                vehicle = lane1_queue(1, :); % 1 is the first row, and : means all the colums of it.
                lane1_queue = lane1_queue(2:end, :);% "2:end" means from the second row until the last row
                vehicle_num = vehicle(1);
                arrival_time = vehicle(2);
                refuel_time = vehicle(3);
                petrol_type = vehicle(4); % Assuming string from vehicles__petrolType
                pump_idx = find(pump_free(1:2) == earliest_pump, 1);
                begin_time = max(arrival_time, earliest_pump);
                wait_time = begin_time - arrival_time;
                end_time = begin_time + refuel_time;
                pump_free(pump_idx) = end_time;
                
                % Store timing variables
                idx = find([1:numOfVehicles] == vehicle_num); % Find index
                begin_times(idx) = begin_time;
                end_times(idx) = end_time;
                wait_times(idx) = wait_time;
                spent_times(idx) = end_time - arrival_time;
                pump_nums(idx) = pump_idx;
                
                fprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                        vehicle_num, petrol_type, pump_idx, begin_time);
                fprintf('Vehicle %d finished refueling and departed at minute %.2f\n', ...
                        vehicle_num, end_time);
            else
                break;
            end
        end
        
        % Process Lane 2 queue
        while ~isempty(lane2_queue)
            earliest_pump = min(pump_free(3:4));
            if earliest_pump <= max(end_times) % Use latest end time
                vehicle = lane2_queue(1, :);
                lane2_queue = lane2_queue(2:end, :);
                vehicle_num = vehicle(1);
                arrival_time = vehicle(2);
                refuel_time = vehicle(3);
                petrol_type = vehicle(4); % Assuming string from vehicles__petrolType
                pump_idx = find(pump_free(3:4) == earliest_pump, 1) + 2;
                begin_time = max(arrival_time, earliest_pump);
                wait_time = begin_time - arrival_time;
                end_time = begin_time + refuel_time;
                pump_free(pump_idx) = end_time;
                
                % Store timing variables
                idx = find([1:numOfVehicles] == vehicle_num); % Find index
                begin_times(idx) = begin_time;
                end_times(idx) = end_time;
                wait_times(idx) = wait_time;
                spent_times(idx) = end_time - arrival_time;
                pump_nums(idx) = pump_idx;
                
                fprintf('Vehicle %d began refueling with %s at Pump %d at minute %.2f\n', ...
                        vehicle_num, petrol_type, pump_idx, begin_time);
                fprintf('Vehicle %d finished refueling and departed at minute %.2f\n', ...
                        vehicle_num, end_time);
            else
                break;
            end
        end
    end
end
