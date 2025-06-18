function r = xorshiftRand()
    % Xorshift random number generator
    global xorshiftX;

    % constants
    max = uint64(4294967295);
    shift13 = uint64(8192);
    shift17 = uint64(131072);
    shift5 = uint64(32);
    
    if isempty(xorshiftX) % handle if not seeded, give default value
        xorshiftX = bitand(12345,max); % default value if unseeded
    end

    xorshiftX = uint64(xorshiftX); % make sure data type is uint64
    
    % Left shift 13
    shifted = xorshiftX * shift13;
    shifted = bitand(shifted,max); % masking
    xorshiftX = bitxor(xorshiftX, shifted);
    
    % Right shift 17
    shifted = uint64(floor(double(xorshiftX) / double(shift17)));
    shifted = bitand(shifted,max); % masking
    xorshiftX = bitxor(xorshiftX, shifted);
    
    % Left shift 5
    shifted = xorshiftX * shift5; 
    shifted = bitand(shifted,max); % masking
    xorshiftX = bitxor(xorshiftX, shifted);
    
    % to [0,1)
    r = double(xorshiftX) / double(max+1);
end