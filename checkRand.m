function p = checkRand()

lcgSeed(123123,1664525,1013904223,2^32);
mlfgSeed(12345, 12345);
xorshiftSeed(12345);

dividedby = 10;
range = 0:(1/dividedby):1.00;
global RANDOM_SELECTOR;
RANDOM_SELECTOR = 0;

iterations = 100000;

p = zeros(1,dividedby);

for i=1:iterations
    rand = callRand();
    for j = 1:dividedby
        if (rand >= range(j) && rand < range(j+1))
            p(j) = p(j) + 1;
        end
    end
end