

clear; close all;

pat = readtable("patients_typos.csv");

pat.LastName  = string(pat.LastName);
pat.Location  = string(pat.Location);

pat.Age       = uint32(pat.Age);
pat.Diastolic = single(pat.Diastolic); % not integer because no NaN for this type!!!
pat.Systolic  = single(pat.Systolic);

pat.Gender    = categorical(pat.Gender);
pat.Smoker    = categorical(pat.Smoker);
pat.SelfAssessedHealthStatus  = categorical(pat.SelfAssessedHealthStatus);

pat.Height    = double(pat.Height);
pat.Weight    = double(pat.Weight);


summary(pat)
histogram(pat.Systolic)
issing data" (or ask data provider)


pat_outlier = pat( pat.Systolic > 1000, :);


pat.Systolic( pat.Systolic > 1000, :) = missing;


% https://www.mathworks.com/help/matlab/ref/ismissing.html
% Since integer variables cannot store NaN, 
% use a special integer value (otherwise unused) to indicate missing integer data, such as -99.


% Let's look more closely at 
% the self assessed health status (SAHS):

summary(pat.SelfAssessedHealthStatus)

unique(pat.Location)




pat1 = pat;

%  SAHS (categorical):
pat1.SelfAssessedHealthStatus(pat1.SelfAssessedHealthStatus == "Exellent") = "Excellent";

% Need to remove unused category... 
pat1.SelfAssessedHealthStatus = removecats(pat1.SelfAssessedHealthStatus );

summary(pat1.SelfAssessedHealthStatus)



pat2 = pat;


stmary = "St. Mary's Medical Center";
vahosp = "VA Hospital";

pat2.Location(pat2.Location == "St Mary's Medical Center") = stmary;
pat2.Location(pat2.Location == "St. Marys Medical Center") = stmary;

pat2.Location(pat2.Location == "V.A. Hospital") = vahosp;

unique(pat2.Location)




stmary     = "St. Mary's Medical Center";
vahosp     = "VA Hospital";
countyhosp = "County General Hospital";

% incorrect spellings:

stmary_found = [stmary ; ...
                "St Mary's Medical Center" ; ...
                "St. Marys Medical Center"; ...
                "St Marys Medical Center"; ...
                "St Mary Medical Center"];

vahosp_found = [vahosp ; ...
                "V.A. Hospital" ; ...
                "VA. Hospital"];
            
county_found = [countyhosp];


Location = stmary_found;


Loc      = repmat(stmary, length(stmary_found),1);

T_stmary = table(Location, Loc)



Location = vahosp_found;
Loc      = repmat(vahosp, length(vahosp_found),1);
T_vahosp = table(Location, Loc)


T_countyhosp = table(county_found, countyhosp, ...
    'VariableNames', {'Location', 'Loc'});



dictionary = vertcat(T_stmary,T_vahosp, T_countyhosp)



pat3 = outerjoin(pat, dictionary, ...
                'MergeKeys',true, ...
                'Type','left');


unique(pat3.Location)
unique(pat3.Loc)






