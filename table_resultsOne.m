function p= table_resultsOne()

global numOfVehicles;

global vehicles__refuelTime__rands vehicles__interArrivalTime__rands vehicles__petrolType__rands vehicles__litres__rands

global vehicles__petrolType vehicles__litres vehicles__totalPrice;

global vehicles__interArrivalTime vehicles__arrivalTime;

disp('----------------------------------------------------------------------------------------------------------------------------------------------------')
disp('| Vehicle number | Type of petrol | Quantity (litre) | Total price (RM) | Random number for inter-arrival time | Inter-arrival time | Arrival time |')
disp('----------------------------------------------------------------------------------------------------------------------------------------------------')
for i = 1:numOfVehicles
    fprintf('| %14.0f | %14s | %16.0f | %16.2f | %36.0f | %18.0f | %12.0f |\n', i, vehicles__petrolType{i}, [vehicles__litres(i) vehicles__totalPrice(i) vehicles__interArrivalTime__rands(i) vehicles__interArrivalTime(i) vehicles__arrivalTime(i)])
end
disp('----------------------------------------------------------------------------------------------------------------------------------------------------')
