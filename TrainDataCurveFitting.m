
FitOrd = 2;  % second order fit
Coef = polyfit(Spd,Tim,FitOrd)  % fit a curve in decending powers of Spd
%example:
% Coef = 0.0044   -0.6039   25.8721
% then: time = 0.0044*speed^2  -0.6039*speed + 25.8721

% expected run time at 48 mph
Time48x = polyval(Coef,48)

% create a line using the equation from above to show the curve fit.
% create the x axis values for plotting
xx = [30:.5:50]; % set of points that covers the speed range of the original data
                 % that are close enough to get a very nice line
yy = polyval(Coef,xx); % generate fitted values of time for each of the speed values
                 % using the coefficients from polyfit
                 
% new graph - add line for curve fit. 
figure(2)
plot(Spd,Tim,'*', xx,yy,'k' ,...
   [30 35 40 45 50],[Ave30,Ave35,Ave40,Ave45,Ave50],'-o')
grid on
xlabel('Train Cruise Speed MPH')
ylabel('Time from Detroit to Chicago, Hours')
legend('Raw data','Average','Best Fit Line')

% expected run time at 50 mph
Time50x = polyval(Coef,50)
% expected time from super train that averages 70 mph
Time75x = polyval(Coef,75)

               
% See what happens when you extrapolate. 

xx = [30:.5:80]; % points with extrapolation
yy = polyval(Coef,xx); % generate fitted values of time for each of the speed values
                 % using the coefficients from polyfit

figure(4)
plot(Spd,Tim,'*', [30 35 40 45 50],[Ave30,Ave35,Ave40,Ave45,Ave50],'-o',...
    xx,yy,'k')
grid on
xlabel('Train Cruise Speed MPH')
ylabel('Time from Detroit to Chicago, Hours')
legend('Raw data','Average','Best Fit Line - extrapolated')
