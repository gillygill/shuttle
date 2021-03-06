% Script to investigate the effectiveness of the `shuttle` function
% with different parameters by brute-force. 

% This did not work and was not a very good idea. 

i=0; 
nx = 11:10:41; 
thick = 0.05; 
tmax = 2000; 
nt = 41:100:1041;
xmax = 0.05;
execTime = zeros(numel(nt), numel(nx));  % execution time
% uInterior = zeros(1, numel(nt)); % temperature in the interior
h = waitbar(0, 'working');
for i = 1:numel(nt);
    for j = 1:numel(nx);
        f = @() shuttle(tmax, nt(i), xmax, nx(j), 'c', false);
        execTime(i, j) = timeit(f);
%         [~, ~, u] = f();
%         uInterior(i) = u(end, 1);
        waitbar(j/ numel(nx));
    end
end
close(h);
surf(execTime);
xlabel('nx');
ylabel('nt');
zlabel('execution time / s');
