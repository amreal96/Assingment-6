function index = ClosestCentroids(X, centroids)
K = size(centroids, 1);
index = zeros(size(X,1), 1);
m = size(X,1);

for i = 1:m
    
      Eucledian_Distance = zeros(1,K);
    for j = 1:K
        Eucledian_Distance(1,j) = norm(X(i,:)-centroids(j,:), 2);
    end
    [d, d_idx] = min(Eucledian_Distance);
    index(i,1) = d_idx;
end

%  plotDataPoints(X, index, K)
  
end
