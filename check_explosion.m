function check_explosion(pump_idx, begin_time)
    % Checks for explosion event during refueling or simulation start
    global VEHICLE_LOG;
    global station_exploded;

    % Only proceed if no explosion has occurred yet
    if ~station_exploded
        % Define explosion probability (1% chance with callRand(0,1000))
        explosion_prob = 0.3; % 1% of 1000
        
        % Check for explosion (use pump_idx = 0 as sentinel for initial check)
        if callRand(0, 1) < explosion_prob
            fprintf('Explosion occurred at Pump %d at minute %.2f! Simulation stopped.\n', ...
                    pump_idx, begin_time);
            fprintf('                              ____\n');
            fprintf('                     __,-~~/~    `---.\n');
            fprintf('                   _/_,---(      ,    )\n');
            fprintf('               __ /        <    /   )  \\___\n');
            fprintf('- ------===;;;''====------------------===;;;===----- -  -\n');
            fprintf('                  \\/  ~"~"~"~"~"~\\~"~)~"/\n');
            fprintf('                  (_ (   \\  (     >    \\)\n');
            fprintf('                   \\_( _ <         >_>''\n');
            fprintf('                      ~ `-i'' ::>|--"\n');
            fprintf('                          I;|.|.|\n');
            fprintf('                         <|i::|i|.\n');
            fprintf('                        (` ^\\"''`-'' \\"")\n');
            fprintf(' _  __    _    ____   ___   ___  __  __ \n');
            fprintf('| |/ /   / \\  | __ ) / _ \\ / _ \\|  \\/  |\n');
            fprintf('| '' /   / _ \\ |  _ \\| | | | | | | |\\/| |\n');
            fprintf('| . \\  / ___ \\| |_) | |_| | |_| | |  | |\n');
            fprintf('|_|\\/_/   \\_\\____/ \\___/ \\___/|_|  |_| \n');
            addLog(begin_time, sprintf('Explosion occurred at Pump %d at minute %.2f! Simulation stopped.\n', ...
                    pump_idx, begin_time));
            addLog(begin_time, '                              ____\n                     __,-~~/~    `---.\n                   _/_,---(      ,    )\n               __ /        <    /   )  \\___\n- ------===;;;''====------------------===;;;===----- -  -\n                  \\/  ~"~"~"~"~"~\\~"~)~"/\n                  (_ (   \\  (     >    \\)\n                   \\_( _ <         >_>''\n                      ~ `-i'' ::>|--"\n                          I;|.|.|\n                         <|i::|i|.\n                        (` ^\\"''`-'' \\"")\n _  __    _    ____   ___   ___  __  __ \n| |/ /   / \\  | __ ) / _ \\ / _ \\|  \\/  |\n| '' /   / _ \\ |  _ \\| | | | | | | |\\/| |\n| . \\  / ___ \\| |_) | |_| | |_| | |  | |\n|_|\\/_/   \\_\\____/ \\___/ \\___/|_|  |_| ');
            station_exploded = true; % Set flag to prevent further explosions
            return; % Stop simulation
        end
    end
end