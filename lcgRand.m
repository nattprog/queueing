function r = lcgRand()
    % Linear congruential generator
global LCGx LCGa LCGc LCGm % global to be used in seeder
    if (isempty(LCGx))
        % LCGx = 123123;
        % LCGa = 1664525; 
        % LCGc = 1013904223; 
        % LCGm = 2^32;
        lcgSeed(123123,1664525,1013904223,2^32);
    end
    LCGx = mod(LCGa*LCGx + LCGc, LCGm); % perform LCG on pref x value to get next value, store current X value in global var
    r = LCGx / LCGm;  % to [0,1)
end

