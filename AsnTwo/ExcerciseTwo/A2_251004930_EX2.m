clear

%Name: David
%Student ID: David George

table =  input_data(); 
%A)
    figure 
    plot_data(table);
    
%B)
       figure 
       plot_normality(table);
       
 %C)
      disp("PART C).."); 
      [rejectBefore p]= Kolmogorv_Smirnov(table(table.game  < 40, :));
      if rejectBefore == 0
          disp("Before the 40th game, it is normal"); 

      else 
          disp("Before the 40th game, it is NOT normal"); 
      end

       [rejectAfter p]= Kolmogorv_Smirnov(table(table.game  >= 40, :));
      if rejectAfter  == 0
          disp("After the 40th game, it is normal"); 

      else 
          disp("After the 40th game, it is NOT normal"); 
      end
      
 %D) 
    % For a Z test to be conducted there are three condidions that must be
    %met. There must be: independance, normaility, and population standard
    %deviation must be known. Their is indepdance as points per game and
    %the game number are independant of eachother, one does not determine
    %the other. I.E, just becasuse it is the fist game, this does not
    %enttail a specifc ppg.
    %
    %There is normality as the qq plots depecit a roughly straight line, 
    %histograms apoximatley follow the over laid nomral distrubtion, 
    %and boxplots are symmetrical. This in conjunciton with
    %Kolmogorov-Smirnov test, which confimed normal distrubtuons before and
    %after the 40th game,makes the normal assumption valid. 
    %
    %
    %Lastly, the population standard deviation is known,as the data given
    %to us is not a sample, and represents the entirity of the last season,
    %thus the entire population. Therefore the standard deviation
    %calucalted is the population standard deviation. 
    
    % Taken together (independance,normality, and known sigma) a Z-test can
    % be conducted. 
    %
    % Null Hypothesis: The Expected PPG is the same as the Expcted PPG
    % before and after the 40th game.

    
  %E)
    disp("PART E)..."); 
    testing(table); 
      
      
    

function table = input_data()

    %Reading table, casting vaaribles to the correct type
    data= readtable("basketball-ppg.csv"); 
    data.game = double(data.game); 
    data.ppg = double(data.ppg); 
    table = data; 
end

function plot_data(table_data)
   
    %Time Series of player's PPF as a funciton of game number 
   plot(table_data.game, table_data.ppg); 
   title(" Points per game (PPG) versus Games");
   xlabel("Game Number");
   ylabel("Points per game (PPG)");
   hold on
   
   %Dashed verticle line at the 40th game
   xline(40,'--r');

end


function plot_normality(table)

      %The following makes a subplot of the qq plots
      % The histograms
      % The boxplots
      % Before and after the 40th game to visually check for normality
      subplot(3, 4 , [1, 2]); 
      qqplot(table.ppg(table.game < 40));
      subplot(3, 4 , [3,4]); 
      qqplot(table.ppg(table.game >= 40));
      subplot(3,4,[5 , 6]); 
      histfit(table.ppg(table.game < 40)); 
      title("Before 40th game"); 
      xlabel("Points per game"); 
      ylabel("frequencey"); 
      subplot(3,4,[7, 8]); 
      histfit(table.ppg(table.game >= 40));
      title("After 40th game"); 
      xlabel("Points per game"); 
      ylabel("frequencey"); 
      
       subplot(3,4,[9 10 11 12]); 
       x1 = table.ppg(table.game < 40); 
        x2 = table.ppg(table.game >= 40);
        x = [x1;x2];
        g = [ones(size(x1)); 2*ones(size(x2))];
        
        boxplot(x,g);
        title("Points per Game before and after 40th game");
        ylabel('Points Per Game');
        xlabel("Games");
        set(gca,'XTickLabel',{'Before 40th Game','After 40th Game'});
     

end

function [reject p] = Kolmogorv_Smirnov(data)

    % H0: "the data is normally distributed"
    x = data.ppg;   

    % Rescale x for Norm(0,1) comparison:
    xx = (x - mean(x)) / sqrt(var(x));
    [reject p] = kstest(xx, 'Alpha', 0.01);

end


function testing(data) 


    %H0: Exptected points per game is the same, before and after the 40th game

    hypothesis_test = ztest(data.ppg(data.game >= 40), mean(data.ppg(data.game < 40)),sqrt(var(data.ppg(data.game >=40))), "Alpha", 0.01); 

    %If 0 then ztest fails to reject null hyptohesis
    %IF 1 then ztest rejects null hypothesis

    if hypothesis_test == 0
        disp("The null hypothesis is not rejected, therefore the average points before and after the 40th game are not signifacltly differnt. This result does NOT suport the league's suspiscion");
        return;
    end
    disp("The null hypothesis is  rejected, therefore the average points before and after the 40th game IS signifacltly differnt. This result DOES suport the league's suspiscion");
        return;
    end

