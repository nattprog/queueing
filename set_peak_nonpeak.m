function set_peak_nonpeak()
    % Prompts user to choose peak or non-peak hours and sets global isNonPeak boolean
    global isNonPeak;
    
    % Prompt user for peak or non-peak hours
    disp('Simulate peak hour traffic: [0]')
    disp('Simulate normal traffic: [1]')
    response = input('Enter 0 or 1: ');
    
    % Validate input
    while response ~= 0 && response ~= 1
        fprintf('Invalid input. Please enter 1 for non-peak or 0 for peak.\n');
        response = input('Simulate non-peak hours? (1 for Yes, 0 for No): ');
    end
    
    % Set boolean based on input
    if response == 1
        isNonPeak = true;
        fprintf('Simulation set to non-peak hours.\n');
    else
        isNonPeak = false;
        fprintf('Simulation set to peak hours.\n');
    end
end