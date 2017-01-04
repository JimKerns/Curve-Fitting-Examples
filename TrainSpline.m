% fit splines to average value at each speed point. 

AvE = [Ave30 Ave35 Ave40 Ave45 Ave50]; % put average speeds in one vector for convience.
Xspd = [30 35 40 45 50];  % speeds where average values were calculated

% fit with splines
PSpline = spline(Xspd,AvE);
% show fields in Pspline struct
fieldnames(PSpline)

xx = [25:.5:55]; %points to evaluate spline and draw a line

% plot it (evaluate the spline data inside the plot commanad)
figure(7)
 plot(Spd,Tim,'*',Xspd,AvE,'-o',xx,ppval(PSpline,xx),'k-');
 grid on
xlabel('Train Cruise Speed MPH')
ylabel('Time from Detroit to Chicago, Hours')
legend('Raw data','Average','Spline')
