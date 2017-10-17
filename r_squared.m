function rsqd = r_squared(y_data, residuals)
% return R^2 statistic for results of a regression
%   r_sqd = r_squared(y_data, residuals)
% 
% where "y_data" is a vector with the dependent data in the regression and
% "residuals" is a vector of the residual values (regressed minus actuals)  

mean_y = mean(y_data);
sum_sqr_tot = sum((y_data-mean_y).^2);
sum_sqr_err = sum(residuals.*residuals);

rsqd = 1-(sum_sqr_err/sum_sqr_tot);
