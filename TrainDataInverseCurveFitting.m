
% perform a curve fit using polyfit and the inverse of the speed so that
% the equation better matches the first principals expectations.

ISpd = 1./Spd; % inverse of speed data

FitOrd = 1;  %first order fit
Coef = polyfit(ISpd,Tim,FitOrd)  % fit a curve in decending powers of Spd
%example:
% Coef = 445.2452   -2.2389
% then: time =  455*(1/speed) + -2.2
% note: Because rand delivers different results each time the data generation scipt runs,
% don't expect to get the same coefficients as listed here. 

% create a line using the equation from above to show the curve fit.
% create the x axis values for plotting
xx = [30:.5:50]; % set of points that covers the speed range of the original data
                 % that are close enough to get a very nice line
yy = polyval(Coef,1./xx); % generate fitted values of time for each of the 
                % inverse of the speed values
                 % using the coefficients from polyfit
                 
% new graph - add line for curve fit. 
figure(5)
plot(Spd,Tim,'*', [30 35 40 45 50],[Ave30,Ave35,Ave40,Ave45,Ave50],'-o',...
    xx,yy,'k')
grid on
xlabel('Train Cruise Speed MPH')
ylabel('Time from Detroit to Chicago, Hours')
legend('Raw data','Average','Best Fit Line')


% expected run time at 50 mph
Time50x = polyval(Coef,1./50)

% expected time from super train that averages 70 mph
Time70x = polyval(Coef,1./70)

                 
% See what happens when you extrapolate. 

xx = [30:.5:80]; % points with extrapolation
yy = polyval(Coef,1./xx); % generate fitted values of time for each of the speed values
                 % using the coefficients from polyfit

figure(6)
plot(Spd,Tim,'*', [30 35 40 45 50],[Ave30,Ave35,Ave40,Ave45,Ave50],'-o',...
    xx,yy,'k')
grid on
xlabel('Train Cruise Speed MPH')
ylabel('Time from Detroit to Chicago, Hours')
legend('Raw data','Average','Best Inverse Fit Line - extrapolated')
