function r = mlfgRand()
    % Multiplicative Lagged Fibonacci Generator
    global mlfgBuffer mlfgJ mlfgK;

    if (isempty(mlfgBuffer) || length(mlfgBuffer) ~= mlfgK+1)
        % default j and k offset values
        mlfgJ = 24;
        mlfgK = 55;

        % seed for rand()
        seed(12345, 12345);

        % generating initial values for buffer thing
        mlfgBuffer = floor(4294967295*rand(1,mlfgK+1));
    end

    % get next value
    x = mod(mlfgBuffer(mlfgK+1 - mlfgJ)*mlfgBuffer(mlfgK+1 - mlfgK), 4294967295);

    % shift all values down and add new value to the end of buffer
    for i = 2:(mlfgK+1)
        mlfgBuffer(i-1) = mlfgBuffer(i);
    end
    mlfgBuffer(mlfgK+1) = x;

    % [0,1)
    r = double(x) / double(4294967295);
end