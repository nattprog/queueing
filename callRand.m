function r = callRand(a,b,c)
    global RANDOM_SELECTOR

    if (isempty(RANDOM_SELECTOR)) % handling no ramdomiser selected
        RANDOM_SELECTOR = 1;
    end

    % handling diff number of arguments given
    if (nargin == 2)
        c = 1;
    elseif (nargin == 1)
        b = a;
        c = 1;
    elseif (nargin == 0)
        a = 1;
        b = a;
        c = a;
    end

    % handling invalid values
    if (a <= 0)
        a = 1;
    end
    if (b <= 0)
        b = 1;
    end
    if (c <= 0)
        c = 1;
    end

    r = zeros(a,b,c);

    switch(RANDOM_SELECTOR) % 1 is lcg, 2 is mlfg, 3 is xorshift
    case 1
        disp()
        for i = 1:a
            for j = 1:b
                for k = 1:c
                    r(i,j,k) = lcgRand();
                end
            end
        end
    case 2
        for i = 1:a
            for j = 1:b
                for k = 1:c
                    r(i,j,k) = mlfgRand();
                end
            end
        end
    case 3
        for i = 1:a
            for j = 1:b
                for k = 1:c
                    r(i,j,k) = xorshiftRand();
                end
            end
        end
    otherwise
        r = rand(a,b,c); % fallback to rand lmao
    end

end