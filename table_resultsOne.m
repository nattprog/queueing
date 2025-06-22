function p= table_resultsOne()

global numOfVehicles;

global vehicles__refuelTime__rands vehicles__interArrivalTime__rands vehicles__petrolType__rands vehicles__litres__rands

global vehicles__petrolType vehicles__litres vehicles__totalPrice;

global vehicles__interArrivalTime vehicles__arrivalTime;

global line_nums 

disp('-----------------------------------------------------------------------------------------------------------------------------')
disp('| Vehicle number | RandNum for type of petrol | Type of petrol | RandNum for quantity | Quantity (litre) | Total price (RM) |')
disp('-----------------------------------------------------------------------------------------------------------------------------')
for i = 1:numOfVehicles
    fprintf('| %14.0f | %26.0f | %14s | %20.0f | %16.0f | %16.2f |\n', [i vehicles__petrolType__rands(i)], vehicles__petrolType{i}, [vehicles__litres__rands(i) vehicles__litres(i) vehicles__totalPrice(i)])
end
disp('-----------------------------------------------------------------------------------------------------------------------------')

disp('-------------------------------------------------------------------------------------------------------------------')
disp('| Vehicle number | RandNum for inter-arrival time | Inter-arrival time | Arrival time | Lane | RandNum RefuelTime |')
disp('-------------------------------------------------------------------------------------------------------------------')
for i = 1:numOfVehicles
    fprintf('| %14.0f | %30.0f | %18.0f | %12.0f | %4d | %18.0f |\n', i,  [vehicles__interArrivalTime__rands(i) vehicles__interArrivalTime(i) vehicles__arrivalTime(i) line_nums(i) vehicles__refuelTime__rands(i)])
end
disp('-------------------------------------------------------------------------------------------------------------------')


