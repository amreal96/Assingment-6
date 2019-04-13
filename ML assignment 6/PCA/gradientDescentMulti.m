function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
m = length(y); 
J_history = zeros(num_iters, 1);
for iter = 1:num_iters
    delta = (1/m)*sum(X.*repmat((X*theta - y), 1, size(X,2))); 
    theta = (theta' - (alpha * delta))';
    J_history(iter) = ComputeCost(X, y, theta);

end

plot(1:num_iters,J_history)
     title('Ietrations vs cost(Js)')
     xlabel('iterations');
     ylabel('Cost(Js)');
end