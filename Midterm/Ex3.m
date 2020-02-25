


%Excercise A)
    table = readtable("diamonds.csv"); 

%Excercise B) 
    table.carat = double(table.carat); 
    table.cut = string(table.cut); 
    table.color =  string(table.color);
    table.clarity = string(table.clarity); 
    table.depth = double(table.depth); 
    table.table =  uint32(table.table); 
    table.price = double(table.price); 
    table.ppc = table.price./ table.carat; 

%Excercise C)

    figure
    h = histogram(table.ppc, 500);
    h.Normalization = "probability";
    h.BinWidth = 500;
    title("Price in USD per carat", "FontSize", 20)
    xlabel("USD", "FontSize", 18);


%Excercise D)

dat_f = table ( table.cut == "Fair", :);
dat_p = table ( table.cut == "Premium", :);

figure;
hold on
scatter(dat_p.carat, dat_p.price, "MarkerFaceColor",[0.7 0 0], "MarkerEdgeColor","none");
scatter(dat_f.carat, dat_f.price,  "d", "MarkerFaceColor",[0 0.6 0], "MarkerEdgeColor","none");
alpha(0.3);
xlabel("Carat", "FontSize", 20);
ylabel("Price (USD)", "FontSize", 20);
grid()
yline(10000, "LineStyle","--", "LineWidth", 3);
legend("Premium", "Fair")



