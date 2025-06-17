function p = table_interArrivalTime()
global interArrivalTime__vals interArrivalTime__vals__prob interArrivalTime__vals__prob__CDF interArrivalTime__vals__prob__range;

disp('---------------------------------------------------------------------')
disp('| Inter-arrival time | Probability |      CDF | Random number range |')
disp('---------------------------------------------------------------------')
for i = 1:length(interArrivalTime__vals)
fprintf('| %18.0f | %11.6f | %8.6f | %8.0f - %-8.0f |\n', [interArrivalTime__vals{i} interArrivalTime__vals__prob{i} interArrivalTime__vals__prob__CDF{i} interArrivalTime__vals__prob__range{i}{1} interArrivalTime__vals__prob__range{i}{2}]);
end
disp('---------------------------------------------------------------------')