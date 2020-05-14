%Name: David George
%Student Number: 251004930

%% Part A) 
    
 ts = readtable("sales.csv"); 
 tw =  readtable("weather.csv"); 
 
 %Joining the tables based on the days that the icetuck actually operated
 T = join(ts, tw); 
 data = table2array(rmmissing(T(:,[3:4])));
 
 %Since
 qqplot(T.sales); 
 xx = (T.sales - mean(T.sales)) / sqrt(var(T.sales));

% H: 0 (cannot reject) or 1 (reject: data unlikely normal)
[reject p] = kstest(xx, 'Alpha', 0.01)
%Since reject is 0, the sales are normally distriubted, therefore to
%perform the multi-variate linear regression, a normal distribution will be
%used
 
 mod = glmfit(data,T.sales, 'normal');
 RainTestData =  linspace(min(T.rain)  ,max(T.rain) , max(T.rain) -min(T.rain) +1);
 TempTestData =  linspace(min(T.temp)  ,max(T.temp) , max(T.temp) -min(T.temp) +1);
 
 
mdl = fitlm(T, 'sales~temp+rain');
coef  = mdl.Coefficients
cl = coefCI(mdl, 0.1); 

% build the regression line (for the plot):
y0    = table2array(coef(1,1));
slope1 = table2array(coef(2,1));
slope2 = table2array(coef(3,1));
x1     = linspace(0, 40,100);
x2     = linspace(0,40,100);
y     = y0 + slope1 .* x1 + slope2 .*x2; 

figure
subplot(1 , 2, 1);
scatter(T.temp, T.sales, "MarkerFaceColor" , 'blue')
xlabel("temp (c)");
ylabel("Revenue ($)");
title("Revenue ($) versus temp (c)"); 
axis([0 40 0 1000])
hold on
plot(x1,y,'LineWidth',3);
hold off
subplot(1 , 2, 2);
scatter(T.rain, T.sales, "MarkerFaceColor" , 'blue');
xlabel("rain (mm)");
ylabel("Revenue ($)")
title("Revenue ($) versus rain(mm)");
axis([0 40 0 1000])
hold on
plot(x1,y,'LineWidth',3);

%% Part B

    %Calculating the revenue based on the regression equation 
    
    
    %slope1 is temp
    %sleop 2 is rain
    
    Monday = (slope1*32) + y0; 
    Tuesday = (slope1*31) + (slope2*5)    +y0; 
    Wednesday = (slope1*26) + (slope2*10)    +y0; 
    Thursday = (slope1*23) + (slope2*15)    +y0;
    Friday = (slope1*23) + (slope2*2)    +y0;
    
    %Total expected revneue
    Total = Monday + Tuesday + Wednesday + Thursday +Friday; 
    disp(Total);
    %Lower Revenue estimation 
    LowMonday =   32*cl(3)   + cl(1);
    %High Revenue estimation 
    HighMonday =   32*cl(5)   + cl(4);
    
    %Lower Revenue estimation 
    LowTuesday =   31*cl(2) +  5*cl(3) + cl(1);
    %High Revenue estimation 
    HighTuesday =   31*cl(5) +  5*cl(6) + cl(4);
    
      %Lower Revenue estimation 
    LowWednesday =    26*cl(2) +  10*cl(3) + cl(1);
    %High Revenue estimation 
    HighWednesday =    26*cl(5) +  10*cl(6) + cl(4);
    
    
         %Lower Revenue estimation 
    LowThursday =    23*cl(2) +  15*cl(3) + cl(1);
    %High Revenue estimation 
    HighThursday =    23*cl(5) +  15*cl(6) + cl(4);
    
    
     %Lower Revenue estimation 
    LowFriday =    23*cl(2) +  2*cl(3) + cl(1);
    %High Revenue estimation 
    HighFriday =    23*cl(5) +  2*cl(6) + cl(4);
    
    TotalLower =  LowMonday + LowTuesday + LowWednesday + LowThursday + LowFriday; 
    TotalUpper = HighMonday + HighTuesday +  HighWednesday +  HighThursday +  HighFriday; 
    disp("confidence interval is"); 
    disp(TotalLower); 
    disp("to..."); 
    disp(TotalUpper);






