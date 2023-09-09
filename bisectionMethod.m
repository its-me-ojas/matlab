
% Define the function whose root we want to find
f = @(x) x^3 - 7*x^2 + 14*x - 6;

% Define the interval [a, b] where we expect the root to be
a = 0; % Lower bound
b = 4; % Upper bound

% Set the tolerance (the desired accuracy of the root)
tolerance = 1e-6;

% Initialize variables
iteration = 0;
maxIterations = 100; % Maximum number of iterations

% Check if the initial values have different signs
if f(a) * f(b) >= 0
    error('The function does not change sign over the interval [a, b]. Bisection method cannot be applied.');
end

% Bisection method loop
while (b - a) / 2 > tolerance && iteration < maxIterations
    % Calculate the midpoint
    c = (a + b) / 2;
    
    % Evaluate the function at the midpoint
    fc = f(c);
    
    % Check if the root is found (within tolerance)
    if abs(fc) < tolerance
        break;
    end
    
    % Update the interval [a, b] based on the sign of f(a) * f(c)
    if f(a) * fc < 0
        b = c;
    else
        a = c;
    end
    
    % Increment the iteration count
    iteration = iteration + 1;
end

% Display the result
if iteration >= maxIterations
    fprintf('Bisection method reached the maximum number of iterations without converging to a root.\n');
else
    fprintf('Root found after %d iterations: %.6f\n', iteration, c);
end
