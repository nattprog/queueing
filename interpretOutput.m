function p = interpretOutput()
global wait_times spent_times pump_data_all

avg_waitTimes = sum(wait_times)/length(wait_times);
avg_spent_times = sum(spent_times)/length(spent_times);
prob_wait = sum(wait_times > 0)/length(wait_times);

pump1servicetime = 0;
for i = 1:length(pump_data_all)
    pump1servicetime = pump1servicetime + pump_data_all{i}(1,1);
end

pump2servicetime = 0;
for i = 1:length(pump_data_all)
    pump2servicetime = pump2servicetime + pump_data_all{i}(2,1);
end

pump3servicetime = 0;
for i = 1:length(pump_data_all)
    pump3servicetime = pump3servicetime + pump_data_all{i}(3,1);
end

pump4servicetime = 0;
for i = 1:length(pump_data_all)
    pump4servicetime = pump4servicetime + pump_data_all{i}(4,1);
end

disp('-------------------------------------------------------------------------------------------')
disp('| Avg waiting times in system | Avg time spent in system | Probability of needing to wait |')
disp('-------------------------------------------------------------------------------------------')
fprintf('| %27.6f | %24.6f | %30.6f |\n', [avg_waitTimes avg_spent_times prob_wait])
disp('-------------------------------------------------------------------------------------------')


disp('-----------------------------------------------------------------------------------------------------')
disp('| Service time at Pump 1 | Service time at Pump 2 | Service time at Pump 3 | Service time at Pump 4 |')
disp('-----------------------------------------------------------------------------------------------------')
fprintf('| %22.0f | %22.0f | %22.0f | %22.0f |\n', [pump1servicetime pump2servicetime pump3servicetime pump4servicetime])
disp('-----------------------------------------------------------------------------------------------------')
end