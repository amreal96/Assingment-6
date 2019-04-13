clc;
clear all;
close all;

Data_Set= readtable('house_prices_data_training_data.csv');
Data = table2array(Data_Set(1:17999,4:21));
[a,v]=size(Data);
Normalized_Data=var_Normalise(Data);
number_of_ietrations=10;

% Finding closest centroids
% Selecting an initial set of centroids
%  K = 5;
 
for K=2:10


for i=1:K
    for j=1:v
   Intial_centroids(i,j)=rand;
    end
end



for i=1:number_of_ietrations
    

    
 %Finding the closest centroids for the examples using the initial_centroids
 
 Index_of_closest_array_of_centroid=ClosestCentroids(Normalized_Data, Intial_centroids);
 
%  plotDataPoints(Normalized_Data, Index_of_closest_array_of_centroid, K);
%  hold on
%  plot(Intial_centroids(:,1), Intial_centroids(:,2), 'x', ...
%      'MarkerEdgeColor','k', ...
%      'MarkerSize', 10, 'LineWidth', 3);
%  hold off
 
 %Adjusting the Centroids
 [Adjusting_centroids,error]=computeCentroids(Normalized_Data, Index_of_closest_array_of_centroid, K);


 Intial_centroids = Adjusting_centroids;
 
 
end

Error_per_Ietration(K)=error;
end

plot(1:10,Error_per_Ietration);
xlabel('number of clusters')
ylabel('Error')
axis([2,8, 1, 10])
