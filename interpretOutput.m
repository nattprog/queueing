function p = interpretOutput()
global wait_times spent_times pump_data_all

avg_waitTimes = sum(wait_times)/length(wait_times);
avg_spent_times = sum(spent_times)/length(spent_times);
prob_wait = sum(wait_times > 0)/length(wait_times);

cntr = 0;
pump1servicetime = 0;
for i = 1:length(pump_data_all)
    if (pump_data_all{i}(1,1) > 0)
        cntr = cntr +1;
    pump1servicetime = pump1servicetime + pump_data_all{i}(1,1);
    end
end
pump1servicetimeAVG = pump1servicetime/cntr;
cntr = 0;
pump2servicetime = 0;
for i = 1:length(pump_data_all)
    if (pump_data_all{i}(2,1) > 0)
        cntr = cntr +1;
    pump2servicetime = pump2servicetime + pump_data_all{i}(2,1);
    end
end
pump2servicetimeAVG = pump2servicetime/cntr;
cntr = 0;
pump3servicetime = 0;
for i = 1:length(pump_data_all)
    if (pump_data_all{i}(3,1) > 0)
        cntr = cntr +1;
    pump3servicetime = pump3servicetime + pump_data_all{i}(3,1);
    end
end
pump3servicetimeAVG = pump3servicetime/cntr;
cntr = 0;
pump4servicetime = 0;
for i = 1:length(pump_data_all)
    if (pump_data_all{i}(4,1) > 0)
        cntr = cntr +1;
    pump4servicetime = pump4servicetime + pump_data_all{i}(4,1);
    end
end
pump4servicetimeAVG = pump4servicetime/cntr;
disp('-------------------------------------------------------------------------------------------')
disp('| Avg waiting times in system | Avg time spent in system | Probability of needing to wait |')
disp('-------------------------------------------------------------------------------------------')
fprintf('| %27.6f | %24.6f | %30.6f |\n', [avg_waitTimes avg_spent_times prob_wait])
disp('-------------------------------------------------------------------------------------------')


disp('---------------------------------------------------------------------------------------------------------------------')
disp('| Avg service time at Pump 1 | Avg service time at Pump 2 | Avg service time at Pump 3 | Avg service time at Pump 4 |')
disp('---------------------------------------------------------------------------------------------------------------------')
fprintf('| %26.6f | %26.6f | %26.6f | %26.6f |\n', [pump1servicetimeAVG pump2servicetimeAVG pump3servicetimeAVG pump4servicetimeAVG])
disp('---------------------------------------------------------------------------------------------------------------------')
end