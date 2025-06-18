% function r = lcgSeed(seed, a, c, m, n)
function r = lcgSeed(seed)
global LCGx LCGa LCGc LCGm LCGn
    LCGx = seed;
    LCGa = 1664525; 
    LCGc = 1013904223; 
    LCGm = 2^32; 
    % LCGn = n;
end

