function p = table_refuelTime()

global refuelTime__vals refuelTime__vals__prob refuelTime__vals__prob__CDF refuelTime__vals_prob__range;

for pump = 1:length(refuelTime__vals)
    disp('-----------------------------------------------------------------')
    fprintf('| Pump %1.0f                                                        |\n', pump)
    disp('-----------------------------------------------------------------')
    disp('| Refueling time | Probability |      CDF | Random number range |')
    disp('-----------------------------------------------------------------')
    for i = 1:length(refuelTime__vals)
    fprintf('| %14.0f | %11.6f | %8.6f | %8.0f - %-8.0f |\n', [refuelTime__vals{pump}{i} refuelTime__vals__prob{pump}{i} refuelTime__vals__prob__CDF{pump}{i} refuelTime__vals_prob__range{pump}{i}{1} refuelTime__vals_prob__range{pump}{i}{2}]);
    end
    disp('-----------------------------------------------------------------')
end