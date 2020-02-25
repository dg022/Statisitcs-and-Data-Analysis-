

%% 
% Raw plot:

% Make up some data:
x = linspace(0,4,1000);  % create vector `x`
y = exp(-x) .* sin(10*x);           % calculate the associated vector y = f(x) 
z = exp(-x) .* 1; 
w = -1*exp(-x) .* 1; 

figure; 

plot(x,y, 'color','black', "LineWidth", 3);
hold on
plot(x,z, 'color','blue', "LineWidth", 3, 'LineStyle', '- -');
plot(x,w, 'color','blue', "LineWidth", 3, 'LineStyle', ':');
hold off; 

title("Amortization Profile");
xlabel('Time in seconds'); 
ylabel('Height from initial posiition (cm)') 









