function p = table_petrolType()
global petrolType__vals petrolType__valsPrice petrolType__vals__prob petrolType__vals__prob__CDF petrolType__vals__prob__range

disp('--------------------------------------------------------------------------------')
disp('|  Type of Petrol | Probability |      CDF | Random number range | Price/litre |')
disp('--------------------------------------------------------------------------------')
for i = 1:length(petrolType__vals)
fprintf('| %15s | %11.6f | %8.6f | %8.0f - %-8.0f | %11.2f |\n', petrolType__vals{i}, [petrolType__vals__prob{i} petrolType__vals__prob__CDF{i} petrolType__vals__prob__range{i}{1} petrolType__vals__prob__range{i}{2} petrolType__valsPrice{i}]);
end
disp('--------------------------------------------------------------------------------')
