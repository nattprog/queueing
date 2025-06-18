function r = mlfgRand(seed1, seed2)
    global mlfgBuffer mlfgJ mlfgK;
    mlfgJ = 24;
    mlfgK = 55;

    seed(seed1, seed2);
    mlfgBuffer = floor(4294967295*rand(1,mlfgK+1));
end