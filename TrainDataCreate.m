% curve fit : train from Detoit to Chicago;
% Generate trip times for trains of various maximum speeds assuming
% that the average speed could be 10 mph less than the maximum speed and
% assuming that it is 300 rail miles from Detroit to Chicago. 

% generate a set of 10 data points of time for the trip at each of several
% train speeds.
% 30 mph train (20 min speed, 30 max)
Tim = 300./(20 + (10).*rand(10,1));
Ave30 = mean(Tim)
Spd = 30*ones(size(Tim));
% 35 mph train
Tim(11:20) = 300./(25 + 10.*rand(10,1));
Ave35 = mean(Tim(11:20))
Spd(11:20) = 35*ones(10,1);
% 40 mph train
Tim(21:30) = 300./(30 + 10.*rand(10,1));
Ave40 = mean(Tim(21:30))
Spd(21:30) = 40*ones(10,1);
%etc...
Tim(31:40) = 300./(35 + 10.*rand(10,1));
Spd(31:40) = 45*ones(10,1);
Ave45 = mean(Tim(31:40))
Tim(41:50) = 300./(40 + 10.*rand(10,1));
Ave50 = mean(Tim(41:50))
Spd(41:50) = 50*ones(10,1);

% graph the data. 
figure(1)
plot(Spd,Tim,'*', [30 35 40 45 50],[Ave30,Ave35,Ave40,Ave45,Ave50],'-o')
grid on
xlabel('Train Cruise Speed MPH')
ylabel('Time from Detroit to Chicago, Hours')
legend('Raw data','Average')
title('Time for Train to Travel from Detroit to Chicago vs. Average Train Speed')
