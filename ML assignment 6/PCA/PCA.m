clc;
clear all;
close all;


Data_Set= readtable('house_prices_data_training_data.csv');
Data = table2array(Data_Set(1:17999,4:21));
Normalized_Data=var_Normalise(Data);

%Correlation
 Corr_Data = corr(Normalized_Data);   %Output shows that the features are Correlated with each other 
 
%Covariance
 Cov_Data=cov(Normalized_Data);
 
 
 [U S V] = svd( Cov_Data);
 
  Eigen_Vector= U;
  
  Eigen_Values=diag(S)';
    
[rows,Number_of_features]=size(Normalized_Data);
  
for k=1:Number_of_features 
alpha=1-(sum(Eigen_Values(1:k))/sum(Eigen_Values));
if alpha<=0.001
    break
end
end

K=k;
Reduced_Data=(transpose(U(:,1:K))* transpose(Normalized_Data))';


approximate_Data=Reduced_Data* Eigen_Vector(:,1:K)';


error = (1/Number_of_features)*(sum((Normalized_Data - approximate_Data).^2))/sum(Normalized_Data.^2);



 


%Linear regression

X = approximate_Data;
y = table2array(Data_Set(1:17999, 3));
m = length(y);
[a,b]=size(approximate_Data);
% initial weights
theta = zeros(b+1, 1);
%randomizing the thetas 
for i=1:b+1
   theta(i)=rand;
end

iterations = 1000;      % Iterations needed for Gradient Descent
alpha = 0.001;          % Learning Rate

theta_normal= normalEq(X,y);
% Compute the Cost Function
Xa = [ones(m, 1), X];

[theta, Js1] = gradientDescentMulti(Xa, y, theta , alpha, iterations);


Predicted_price=[ones(length(y), 1), X]*theta;



