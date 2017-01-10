% example regression with two independant inputs, one measured output
% X, Y (independant variables), Dependant_Var are column vectors

% This is the key to the regression - defining the form!!! 
ii = ones(size(X)); % a "constant state"
states = [ii X X.^2 X.^3 X.^4 Y X.*Y];  % create a state variable for an equation of the form:
                        % expected_value = a1 + a2*X + a3*x^2 + a4*X^3 + a5*Y +a6*X*Y 
                        % NOTE:
                  %.^ used for element by element operation instead of matrix power      
numstates = size(states,2);

% backslash operator performs the least square fit to solve the equation
    % Dependant_Var = coeff*states 
    
coeff = states\Dependant_Var;  % determine regression coeficients (a1 - a3 in equation above)

xpected = states * coeff;     % determine expected (regressed) values at each data point

resid = xpected - Dependant_Var; % calculate residuals 
        % difference between expected values from the regression 
        % minus the actual Y values: regressed - actual

resid_sum_sq = sum(resid.*resid);  % sum of squares of residuals
dof = length(X) - length(coeff);    % degrees of freedom
var_err = resid_sum_sq/dof;         % varience of the error
std_dev_err = sqrt(var_err);%  % calculate standard deviation of error

R2 = r_squared(Dependant_Var,resid); % calculate R squared statistic
disp(['R Squared = ',num2str(R2)])

minX = min(X); maxX = max(X); deltaX = (maxX-minX)/20;  % set up mesh parameters for 3 d plot
minY = min(Y); maxY = max(Y); deltaY = (maxY-minY)/20;

[XX YY] = meshgrid([minX:deltaX:maxX], [minY:deltaY:maxY]); % generate grid for surface / mesh plot

ZZ = ones(size(XX)).*coeff(1)+ coeff(2).*XX + coeff(3).*XX.^2 + coeff(4).*XX.^3+...
    coeff(5).*XX.^4 + coeff(6).*YY +coeff(7).*XX.*YY;  % duplicate states from original equation and
                        % calculate expected values. 

figure(2)
mesh(XX,YY,ZZ, 'FaceColor','None')
hold on
plot3(X,Y,Dependant_Var,'*')
hold off
xlabel('X')
ylabel('Y')
zlabel('Dependant Variable')
title(['Example Data Regression R Squared = ', num2str(R2)])
