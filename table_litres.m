function p = table_litres()

global litres__vals litres__vals__prob litres__vals__prob__CDF litres__vals__prob__range;

disp('---------------------------------------------------------')
disp('| Litres | Probability |      CDF | Random number range |')
disp('---------------------------------------------------------')
for i = 1:length(litres__vals)
fprintf('| %6.0f | %11.6f | %8.6f | %8.0f - %-8.0f |\n', [litres__vals{i} litres__vals__prob{i} litres__vals__prob__CDF{i} litres__vals__prob__range{i}{1} litres__vals__prob__range{i}{2}]);
end
disp('---------------------------------------------------------')