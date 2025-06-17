function p = calc_totalPrice()
global numOfVehicles;

global petrolType__vals petrolType__valsPrice petrolType__vals__prob__range;
global litres__vals litres__vals__prob__range;

global vehicles__petrolType__rands vehicles__litres__rands

global vehicles__petrolType vehicles__litres vehicles__totalPrice;

for i = 1:numOfVehicles
    pricePerLitre = 0;
    for ii = 1:length(petrolType__vals)
        if (vehicles__petrolType__rands(i) >= petrolType__vals__prob__range{ii}{1} && vehicles__petrolType__rands(i) <= petrolType__vals__prob__range{ii}{2})
            vehicles__petrolType{i} = petrolType__vals{ii};
            pricePerLitre = petrolType__valsPrice{ii};
            break;
        end
    end

    for ii = 1:length(litres__vals)
        if (vehicles__litres__rands(i) >= litres__vals__prob__range{ii}{1} && vehicles__litres__rands(i) <= litres__vals__prob__range{ii}{2})
            vehicles__litres(i) = litres__vals{ii};
            break;
        end
    end
    vehicles__totalPrice(i) = pricePerLitre*vehicles__litres(i);
end