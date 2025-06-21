function r = xorshiftSeed(seed)
global xorshiftX;
% set the seed
    seed = bitand(uint64(seed), uint64(4294967295));
    xorshiftX = uint64(seed);
end