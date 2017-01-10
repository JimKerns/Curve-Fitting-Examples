clear all
close all
clc

% create some fake data for regression of a surface 
 rand('twister',3223111); % initialize random number generator to get same results each time
 X = rand(100,1);
 Y = rand(100,1);
 err = 1+0.3.*rand(100,1); % add some random noise just for the fun if it
 act_coef = [.82, .45, 1.33, .5];
Dependant_Var = (act_coef(1) + act_coef(2).*log(X)+ act_coef(3).*Y +act_coef(4).*X.*Y).*err; % resultant data 

figure(1)
plot3(X,Y,Dependant_Var,'*')
xlabel('X')
ylabel('Y')
zlabel('Dependant Variable')
grid on


