function r = xorshift32()
    global xorshiftX;
    
    % Initialize with non-zero seed if empty
    if isempty(xorshiftX)
        xorshiftX = uint32(1000);  % Time-based seed
        if xorshiftX == 0
            xorshiftX = uint32(1);  % Ensure non-zero
        end
    end
    
    % Left shift 13 (multiply by 2^13)
    shifted = xorshiftX * uint32(8192);  % 2^13
    xorshiftX = bitxor(xorshiftX, shifted);
    
    % Right shift 17 (divide by 2^17)
    shifted = floor(double(xorshiftX) / 131072);  % 2^17
    shifted = uint32(shifted);
    xorshiftX = bitxor(xorshiftX, shifted);
    
    % Left shift 5 (multiply by 2^5)
    shifted = xorshiftX * uint32(32);  % 2^5
    xorshiftX = bitxor(xorshiftX, shifted);
    
    % Normalize to [0,1) if desired
    r = double(xorshiftX) / 4294967295;
end