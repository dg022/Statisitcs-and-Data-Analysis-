clear; 

dat = readtable("patients.csv");

close all;
figure;
H = dat.Height
histogram(H, 58:2:80 );
m0 = mean(H)
sd0 = sqrt(var(H))
n01 = randn(1,1e4);

m  = 100;
sd = 2.5; % <-- vary that...


% N(m,s) = m + s * N(0,1)
x = m + n01 * sd;

figure
hold on
histogram(H, 58:1.5:100, "Normalization", "probability" );
histogram(x, 58:1.5:100, "Normalization", "probability"  );
hold off


