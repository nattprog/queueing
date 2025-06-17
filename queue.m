function p= queue()

% Setting randomiser seed
seed(69, 69);

% Setting service time
servicetime = [1,2,3,4,5,6;];
% Setting service time 
STprobability = [0.1,0.2,0.3,0.25,0.1,0.05;];

% Checking validity of service time and ST probability
sumProb = 0;
for i = 1:length(STprobability)
    sumProb = sumProb + STprobability(i);
end
if (length(servicetime) ~= length(STprobability))
    disp('Error: Mismatched ST and ST probability')
    return
elseif (sumProb ~= 1)
    disp('Error: ST probability does not add up to 1')
    return
end

disp('Queue end')