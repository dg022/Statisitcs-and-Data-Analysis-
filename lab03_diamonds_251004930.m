dat = readtable("diamonds.csv"); 

string(dat.cut); 
string(dat.clarity); 
string(dat.color); 


%This is me calcualting the price per unit, you take the dat, reach in then
%go thats equal to colums dived by eachother

unique(dat.cut)
 dat.ppc = dat.price ./ dat.carat;

figure;
h = histogram(dat.ppc);
h.Normalization = "probability";
h.BinWidth = 500;
