%Name: David George
%Student Number: 251004930 

%% Part A)

T = readtable("bike_stations.csv");  
tt = readtable("bike_trips.csv");
tweather  = readtable("bike_weather.csv"); 
vnames = [string(T.Properties.VariableNames)];
vnames = string(vnames); 
WeatherNames = [ "Sunny", "Cloudy", "Light Rain", "Storm"]; 

duration  = []; 
station_end = string([]);
station_start =string([]);
weather = zeros(1,2000,'uint32');
weather = string(weather).'; 
s = (tt.station_id_start) .';
e = (tt.station_id_end).';

dayWeather = table2array(tweather); 
weatherCode  = table2array(tweather); 
dayWeather = dayWeather(:, 1); 
weatherCode  = weatherCode(: , 2);
endT = table2array(tt);
startT = table2array(tt);
endT = endT(:,5); 
startT = startT(:,4); 
day = table2array(tt);
day = day(:, 1);
count = 1; 
for idx = 1:length(tt.station_id_start)
     station_start(idx) = vnames(s(idx));
     station_end(idx) = vnames(e(idx));
     duration(idx) = endT(idx) - startT(idx); 
     
     index = find(dayWeather == day(idx)); 
     weather(idx) = WeatherNames(weatherCode(index)); 
  
end 

station_start = station_start.'; 
station_end = station_end.';
duration = duration.'; 
finalTable = table(day, station_start, station_end, duration, weather); 
finalTable   = sortrows(finalTable,1,'ascend', 'ComparisonMethod','abs'); 
 
%% Part B)

%Creating the table with the average durations
AverageDuration = []; ; 
AverageDuration(1) = mean(finalTable.duration(finalTable.weather == "Sunny")); 
AverageDuration(2) = mean(finalTable.duration(finalTable.weather == "Cloudy"));
AverageDuration(3) = mean(finalTable.duration(finalTable.weather == "Light Rain")); 
AverageDuration(4) = mean(finalTable.duration(finalTable.weather == "Storm")); 
AverageDuration = AverageDuration .'; 
WeatherNames = WeatherNames.'; 
AverageDurationTime = table(WeatherNames,AverageDuration); 
disp(AverageDurationTime);

%Creating the well annotated box plots witht the differnt weather durations
      x1 = finalTable.duration(finalTable.weather == "Sunny"); 
      x2 = finalTable.duration(finalTable.weather == "Cloudy");
      x3 = finalTable.duration(finalTable.weather == "Light Rain");
      x4 = finalTable.duration(finalTable.weather == "Storm");
      x = [x1;x2;x3;x4];
      g = [ones(size(x1)); 2*ones(size(x2)) ; 3*ones(size(x3)); 4*ones(size(x4))  ];
      
      figure
      boxplot(x,g);
      title("Boxplots of durations for each Weather Type");
      ylabel('Duration in Minutes');
      xlabel("Weather Types");
      set(gca,'XTickLabel',{'Sunny','Cloudy', 'Light Rain', 'Storm'});




%% Part C) 

%Checking to see if the population is normally distributed on the 12th and 21st day.
%Kolmogorov Smirnov Test:
% H0: "the data is normally distributed"

% Rescale data for Norm(0,1) comparison 12th day:
  
    
    SunnyTest = (finalTable.duration(finalTable.weather == "Sunny")) - mean(finalTable.duration(finalTable.weather == "Sunny")) / (sqrt(var(finalTable.duration(finalTable.weather == "Sunny"))));
    CloudyTest = (finalTable.duration(finalTable.weather == "Cloudy")) - mean(finalTable.duration(finalTable.weather == "Cloudy")) / (sqrt(var(finalTable.duration(finalTable.weather == "Cloudy"))));
    LightRainTest = (finalTable.duration(finalTable.weather == "Light Rain")) - mean(finalTable.duration(finalTable.weather == "Light Rain")) / (sqrt(var(finalTable.duration(finalTable.weather == "Light Rain"))));
    Storm = (finalTable.duration(finalTable.weather == "Storm")) - mean(finalTable.duration(finalTable.weather == "Storm")) / (sqrt(var(finalTable.duration(finalTable.weather == "Storm"))));
    
% H: 0 (cannot reject) or 1 (reject: data unlikely normal)

    [rejectSunny p12D1] = kstest(SunnyTest, 'Alpha', 0.05);
    [rejectCloudy p12D2] = kstest(CloudyTest, 'Alpha', 0.05);
    [rejectRain p12D3] = kstest(LightRainTest, 'Alpha', 0.05);
    [rejectStorm p12D4] = kstest(Storm, 'Alpha', 0.05);
    
    
     if rejectSunny == 0 & rejectCloudy == 0 & rejectRain == 0 & rejectStorm == 0  
       
        disp("Population is normally distriubuted"); 
     end


    %Checking to determine homongenitity of variences between  diets on day 12
    %and 21 using the levene test 

    p12Var = vartestn(finalTable.duration, finalTable.weather, 'TestType','LeveneAbsolute', 'Display', 'off');


     if p12Var > 0.05

            disp("The data, divided by weather types, have homogoenous variences"); 
     end

   


    % The independence assumption holds up because
    % the probaility of one event occuring in no away affects the probaility of
    % another event. In this case, the duration of any given trip in any weather group,
    % has no bearing on the duration of any given trip in another group, nor 
    %does knowing the duration of one trip give insight into the probaility of
    %any other trip beign a certain duration either. Therfore the indepdenace
    %assumption holds.   

    %Since all assumptions (normaility, independence, and homogenity of
    %variences) are held up, anova testing can be performed, with post-hoc
    %testing to determine the the weather types for which the durations
    %of the trips significantly differ.

    %Anova testing and Post Hoc testing:

        [pval12 tab12 stats12] = anova1(finalTable.duration, finalTable.weather, 'off');

        figure 

        [c12,m12,h12,nms12] = multcompare(stats12, 'Alpha', 0.05, 'CType','bonferroni');
        title("Duration of trip based on Weather type");
        xlabel("Duration (min)"); 
        ylabel("Weather Type"); 

    
    %Results:
    %Based on the multiple comparsion figure durations of trips between
    %Sunny and Cloudy days do not signifactly vary in duration to each
    %other. 
    
    %In contrast, there is a signficant differnece in the duration of the
    %trips when comparing the trip durations of either sunny days or cloudu
    %days to days with light rain or storms. Furthermore the differce
    %between trip durations between stormy days and days with light rain is
    %signicant as well. 
    
    %In short, yes the bike trip durations do vary based on the type of
    %weather on a given day. 
    

    x = [1 2 3 4 5 6 7 8];
    y = [166.0, 168.0, 166.8, 167, 164.2, 164.6,164, 163]; 
    figure
    plot(x,y);



