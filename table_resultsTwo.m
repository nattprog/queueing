function p = table_resultTwo()
global numOfVehicles vehicles__petrolType vehicles__litres vehicles__totalPrice;
global vehicles__arrivalTime begin_times end_times wait_times spent_times;
global line_nums pump_nums vehicles__interArrivalTime__rands vehicles__refuelTime__rands;

% Table 1: Vehicle Information
disp('-----------------------------------------------------------------------------------------------------------------------')
disp('| Vehicle | Type of petrol | Litres | Total Price | RandNum InterarrivalTime | InterarrivalTime | ArrivalTime | LineNumber | RandNum RefuelTime |')
disp('-----------------------------------------------------------------------------------------------------------------------')
for i = 1:numOfVehicles
    if i > 1
        inter_arrival = vehicles__arrivalTime(i) - vehicles__arrivalTime(i-1);
    else
        inter_arrival = 0;
    end
    
    fprintf('| %-7d | %-14s | %6.0f | %11.2f | %24.0f | %16.0f | %11.1f | %10d | %18.0f |\n', i, vehicles__petrolType{i}, vehicles__litres(i), vehicles__totalPrice(i), vehicles__interArrivalTime__rands(i), inter_arrival, vehicles__arrivalTime(i), line_nums(i), vehicles__refuelTime__rands(i));
end
disp('-----------------------------------------------------------------------------------------------------------------------')

% Table 2: Pump and Timing Information
disp(' ')
disp('-----------------------------------------------------------------------------------------------------------------------------------------------------')
disp('| Vehicle | Pump1Refuel | Begin |  End | Pump2Refuel | Begin |  End | Pump3Refuel | Begin |  End | Pump4Refuel | Begin |  End | Waiting | TimeSpent |')
disp('-----------------------------------------------------------------------------------------------------------------------------------------------------')
for i = 1:numOfVehicles
    % Initialize all pump times
    pump_data = zeros(4,3); % [refuel, begin, end] for each pump
    
    % Set data for assigned pump
    current_pump = pump_nums(i);
    if current_pump >= 1 && current_pump <= 4
        pump_data(current_pump,:) = [end_times(i)-begin_times(i), begin_times(i), end_times(i)];
    end
    
    fprintf('| %-7d ', i);
    % Print all pump columns
    for p = 1:4
        fprintf('| %11.1f | %5.1f | %4.1f ', pump_data(p,1), pump_data(p,2), pump_data(p,3));
    end
    fprintf('| %7.1f | %9.1f |\n', wait_times(i), spent_times(i));
end
disp('-----------------------------------------------------------------------------------------------------------------------------------------------------')
end