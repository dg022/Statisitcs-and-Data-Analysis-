

%Name: David George
%Student ID: 251004930
%A)
    %t1 - t4 calls a helper function to cast the data to the correct type
    %before joinining them
    disp("PART A)...");
    t1 = input_data_country(); 
    t2 = input_data_orders(); 
    t3 = input_data_ref(); 
    t4 = input_data_price(); 
    %Joining the first two tables
    T1 = outerjoin(t1, t2,'MergeKeys',true); 
    %Joining the second two tables
    T2 = join(t3,t4,'Keys','ref_id');
    %final table
    T = innerjoin(T1,T2);



%B)
    disp("PART B.."); 
    breakDownTable = breakdown(T); 
    disp("This is the breakdown of revenue per country"); 
    disp(breakDownTable); 
    figure
    X = [breakDownTable.Austria breakDownTable.Canada breakDownTable.Germany breakDownTable.Mexico breakDownTable.USA]; 
    label = {'Austria', 'Canada', 'Germany', 'Mexico', 'USA'};
    pie(X);
    title("Break-down of reveunue per country"); 
    legend(label);
    
    
 %C)
    disp("PART C.."); 
    fiveMostandLeast(T); 
  
function t1 = input_data_country()

    data = readtable("db_cust_country.csv");
    data.cust_id = uint32(data.cust_id); 
    data.country = string(data.country);
    t1 = data; 
end

function t2 = input_data_orders()

    data = readtable("db_cust_orders.csv");
    data.cust_id = uint32(data.cust_id);
    data.order_id = uint64(data.order_id);
    t2 = data; 
end


function t3 = input_data_price()

    data = readtable('db_ref_price.csv');
    data.ref_id = string(data.ref_id);
    data.unit_price = uint32(data.unit_price);
    t3 = data;
end

function t4 = input_data_ref()

    data = readtable('db_order_ref.csv');
    data.order_id= uint64(data.order_id);
    data.ref_id =string(data.ref_id);
    data.qty = uint32(data.qty);
    t4 = data; 

end


function T = breakdown(data)

    V = unique(string(data.country)); 
    disp(V);
    N = length(V); 
    Austria= [1];
    Canada = [1]; 
    Germany = [1];
    Mexico = [1]; 
    USA = [1]; 
    
    %Creating a table with sentinel values, that will filled in later
    Tout =table(Austria, Canada, Germany, Mexico, USA);
           for i = 1:N
               
             % All rows with specfic country name v(i)
            rows_selected  = data.country ==V(i); 
           
            %temporary table with only the selcted country name
            tmp = data(rows_selected, :); 
            
            %Calcualting the revenue as a per row basis
            tmp.revenue = tmp.qty.*tmp.unit_price; 
            
            %Summing up renvnue for each country, adding to correct table 
            %spot
            summation = sum(tmp.revenue);   
            Tout.(V(i)) = summation; 
           end
    T =Tout; 
end


function  fiveMostandLeast(data)
    Sold = [];
    
    %list of all the unique names
    items = unique(data.ref_id);
    N =1;
    Number = length(items); 
    if Number < 0
       disp("Error:");  
    end    
    while N <= Number
        %Sum up all quantites of items with a given ID
        %Store in appopreiate spot in list
        Sold(N) = sum(data.qty(data.ref_id == items(N)));
        N = N+1;
    end
    %Creating table with each unqiue id and quantity
    Sales = table(items,Sold','VariableNames',{'ReferenceNumber','Quantity'});
    
    %Sorting table from greates  to least
    Sorted = sortrows(Sales,2);
    
    % dispalying the head and tail, the five freatest and smallest items
    disp('Five most popular items are:');
    disp(head(Sorted,5));
    disp('Five least popular items are:');
    disp(tail(Sorted,5)) 
end


