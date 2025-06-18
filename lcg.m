function r = lcg()
global LCGx LCGa LCGc LCGm % LCGn
    if (isempty(LCGx))
        LCGx = 1337;
        LCGa = 1664525; 
        LCGc = 1013904223; 
        LCGm = 2^32; 
    end
    LCGx = mod(LCGa*LCGx + LCGc, LCGm);
    r = LCGx / LCGm;  % Normalize to [0,1)
end

