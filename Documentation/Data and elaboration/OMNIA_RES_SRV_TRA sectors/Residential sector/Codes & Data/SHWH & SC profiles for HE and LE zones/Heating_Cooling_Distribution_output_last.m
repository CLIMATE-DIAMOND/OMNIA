% Copyright July 2024 Maria Ioanna Malliaroudaki
% Imperial College London
%Program for the EU project DIAMOND

close all
clc
clear all
format long

% Data taken from the supplementary material of: "Clustered spatially and
% temporally resolved global heat and cooling energy demand in the
% residential sector" https://doi.org/10.1016/j.apenergy.2019.05.011

OMNIA_regions_tab = readtable('OMNIA_regions_adopted.xlsx'); %Here I have all the names as are in the database below. (E.g. United States of America became United states). The original regions are in the file name "OMNIA_regions".  
SHWH_DIST_tab = readtable('SHWH_distribution.xlsx'); 
SC_DIST_tab = readtable('SC_distribution.xlsx'); 

%Creating tables with useful  input data for the OMNIA regions
Countires_per_region =  table2cell(OMNIA_regions_tab(:,3:end));
Region_accronym =  table2array(OMNIA_regions_tab(1:end,1));
Region_name =  table2array(OMNIA_regions_tab(1:end,2));
Region_number= 1:height(OMNIA_regions_tab);

%Creating tables with useful  input data for the SCSHWH distributions
list_of_countries_data =   table2array(SHWH_DIST_tab(:,1));
Total_energy_Data_SHWH =   table2array(SHWH_DIST_tab(:,6));
zone =   table2array(SHWH_DIST_tab(:,4));
h = 1;
a = 7; % Posssition of first 1 for SC of the 24 hour data (they are correct)



%Zero tables
Only_countries_per_region_energy = zeros(830,length(Region_number));
Group_countries_Profiles24h_SC_S1 = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SC_S2 = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SC_S3 = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SC_S4 = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SH_S1  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SH_S2  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SH_S3  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SH_S4  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_WH_S1  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_WH_S2  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_WH_S3  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_WH_S4  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SHWH_S1  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SHWH_S2  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SHWH_S3  = zeros(830,24,length(Region_number));
Group_countries_Profiles24h_SHWH_S4  = zeros(830,24,length(Region_number));
Only_countries_per_region_SC_S1 = zeros(830,length(Region_number));
Only_countries_per_region_SC_S2 = zeros(830,length(Region_number));
Only_countries_per_region_SC_S3 = zeros(830,length(Region_number));
Only_countries_per_region_SC_S4 = zeros(830,length(Region_number));
Only_countries_per_region_SH_S1 = zeros(830,length(Region_number)); 
Only_countries_per_region_SH_S2 = zeros(830,length(Region_number));
Only_countries_per_region_SH_S3 = zeros(830,length(Region_number));
Only_countries_per_region_SH_S4 = zeros(830,length(Region_number));
Only_countries_per_region_WH_S1 = zeros(830,length(Region_number));
Only_countries_per_region_WH_S2 = zeros(830,length(Region_number));
Only_countries_per_region_WH_S3 = zeros(830,length(Region_number));
Only_countries_per_region_WH_S4 = zeros(830,length(Region_number));
Only_countries_per_region_SHWH_S1 = zeros(830,length(Region_number));
Only_countries_per_region_SHWH_S2 = zeros(830,length(Region_number));
Only_countries_per_region_SHWH_S3 = zeros(830,length(Region_number));
Only_countries_per_region_SHWH_S4 = zeros(830,length(Region_number));
Only_countries_per_region_SC = zeros(830,length(Region_number));
Only_countries_per_region_SH = zeros(830,length(Region_number));
Only_countries_per_region_WH = zeros(830,length(Region_number));
Only_countries_per_region_SHWH = zeros(830,length(Region_number));
Only_countries_per_region_energy_check = zeros(830,length(Region_number));
Error = zeros(830,length(Region_number));

LE_Only_countries_per_region_energy = zeros(830,length(Region_number));
LE_Group_countries_Profiles24h_SC_S1 =  zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SC_S2 = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SC_S3  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SC_S4 = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SH_S1  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SH_S2  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SH_S3  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SH_S4  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_WH_S1  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_WH_S2  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_WH_S3 = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_WH_S4  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SHWH_S1  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SHWH_S2  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SHWH_S3  = zeros(830,24,length(Region_number));
LE_Group_countries_Profiles24h_SHWH_S4  = zeros(830,24,length(Region_number));
LE_Only_countries_per_region_SC_S1 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SC_S2 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SC_S3 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SC_S4 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SH_S1 = zeros(830,length(Region_number)); 
LE_Only_countries_per_region_SH_S2 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SH_S3 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SH_S4 = zeros(830,length(Region_number));
LE_Only_countries_per_region_WH_S1 = zeros(830,length(Region_number));
LE_Only_countries_per_region_WH_S2 = zeros(830,length(Region_number));
LE_Only_countries_per_region_WH_S3 = zeros(830,length(Region_number));
LE_Only_countries_per_region_WH_S4 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SHWH_S1 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SHWH_S2 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SHWH_S3 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SHWH_S4 = zeros(830,length(Region_number));
LE_Only_countries_per_region_SC = zeros(830,length(Region_number));
LE_Only_countries_per_region_SH = zeros(830,length(Region_number));
LE_Only_countries_per_region_WH = zeros(830,length(Region_number));
LE_Only_countries_per_region_SHWH = zeros(830,length(Region_number));


HE_Only_countries_per_region_energy = zeros(830,length(Region_number));
HE_Group_countries_Profiles24h_SC_S1  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SC_S2  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SC_S3  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SC_S4 = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SH_S1  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SH_S2  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SH_S3  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SH_S4  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_WH_S1  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_WH_S2 = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_WH_S3  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_WH_S4  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SHWH_S1  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SHWH_S2 = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SHWH_S3  = zeros(830,24,length(Region_number));
HE_Group_countries_Profiles24h_SHWH_S4  = zeros(830,24,length(Region_number));
HE_Only_countries_per_region_SC_S1 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SC_S2 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SC_S3 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SC_S4 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SH_S1 = zeros(830,length(Region_number)); 
HE_Only_countries_per_region_SH_S2 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SH_S3 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SH_S4 = zeros(830,length(Region_number));
HE_Only_countries_per_region_WH_S1 = zeros(830,length(Region_number));
HE_Only_countries_per_region_WH_S2 = zeros(830,length(Region_number));
HE_Only_countries_per_region_WH_S3 = zeros(830,length(Region_number));
HE_Only_countries_per_region_WH_S4 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SHWH_S1 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SHWH_S2 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SHWH_S3 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SHWH_S4 = zeros(830,length(Region_number));
HE_Only_countries_per_region_SC = zeros(830,length(Region_number));
HE_Only_countries_per_region_SH = zeros(830,length(Region_number));
HE_Only_countries_per_region_WH = zeros(830,length(Region_number));
HE_Only_countries_per_region_SHWH = zeros(830,length(Region_number));

% Region_Profiles24h_SC_S1 (:,i)= sum(Group_countries_Profiles24h_SC_S1) ; %
Total_energy_per_Region = zeros(length(Region_number),1);
HE_SC_S1_energy_per_Region = zeros(length(Region_number),1);
HE_SC_S2_energy_per_Region = zeros(length(Region_number),1);
HE_SC_S3_energy_per_Region = zeros(length(Region_number),1);
HE_SC_S4_energy_per_Region = zeros(length(Region_number),1);
HE_SH_S1_energy_per_Region = zeros(length(Region_number),1);
HE_SH_S2_energy_per_Region = zeros(length(Region_number),1);
HE_SH_S3_energy_per_Region = zeros(length(Region_number),1);
HE_SH_S4_energy_per_Region = zeros(length(Region_number),1);
HE_WH_S1_energy_per_Region = zeros(length(Region_number),1);
HE_WH_S2_energy_per_Region = zeros(length(Region_number),1);
HE_WH_S3_energy_per_Region = zeros(length(Region_number),1);
HE_WH_S4_energy_per_Region = zeros(length(Region_number),1);
HE_SHWH_S1_energy_per_Region = zeros(length(Region_number),1);
HE_SHWH_S2_energy_per_Region = zeros(length(Region_number),1);
HE_SHWH_S3_energy_per_Region = zeros(length(Region_number),1);
HE_SHWH_S4_energy_per_Region = zeros(length(Region_number),1);
SC_energy_per_Region  = zeros(length(Region_number),1);
SH_energy_per_Region  = zeros(length(Region_number),1);
WH_energy_per_Region  = zeros(length(Region_number),1);
SHWH_energy_per_Region  = zeros(length(Region_number),1);
RegionProfiles24h_SC_S1 = zeros(length(Region_number),24);
RegionProfiles24h_SC_S2 = zeros(length(Region_number),24);
RegionProfiles24h_SC_S3 = zeros(length(Region_number),24);
RegionProfiles24h_SC_S4 = zeros(length(Region_number),24);
RegionProfiles24h_SH_S1 = zeros(length(Region_number),24);
RegionProfiles24h_SH_S2 = zeros(length(Region_number),24);
RegionProfiles24h_SH_S3 = zeros(length(Region_number),24);
RegionProfiles24h_SH_S4 = zeros(length(Region_number),24);
RegionProfiles24h_WH_S1 = zeros(length(Region_number),24);
RegionProfiles24h_WH_S2 = zeros(length(Region_number),24);
RegionProfiles24h_WH_S3 = zeros(length(Region_number),24);
RegionProfiles24h_WH_S4 = zeros(length(Region_number),24);
RegionProfiles24h_SHWH_S1 = zeros(length(Region_number),24);
RegionProfiles24h_SHWH_S2 = zeros(length(Region_number),24);
RegionProfiles24h_SHWH_S3 = zeros(length(Region_number),24);
RegionProfiles24h_SHWH_S4 = zeros(length(Region_number),24);

LE_Total_energy_per_Region  = zeros(length(Region_number),1);
LE_SC_S1_energy_per_Region = zeros(length(Region_number),1);
LE_SC_S2_energy_per_Region = zeros(length(Region_number),1);
LE_SC_S3_energy_per_Region = zeros(length(Region_number),1);
LE_SC_S4_energy_per_Region = zeros(length(Region_number),1);
LE_SH_S1_energy_per_Region = zeros(length(Region_number),1);
LE_SH_S2_energy_per_Region = zeros(length(Region_number),1);
LE_SH_S3_energy_per_Region = zeros(length(Region_number),1);
LE_SH_S4_energy_per_Region = zeros(length(Region_number),1);
LE_WH_S1_energy_per_Region = zeros(length(Region_number),1);
LE_WH_S2_energy_per_Region = zeros(length(Region_number),1);
LE_WH_S3_energy_per_Region = zeros(length(Region_number),1);
LE_WH_S4_energy_per_Region = zeros(length(Region_number),1);
LE_SHWH_S1_energy_per_Region = zeros(length(Region_number),1);
LE_SHWH_S2_energy_per_Region = zeros(length(Region_number),1);
LE_SHWH_S3_energy_per_Region = zeros(length(Region_number),1);
LE_SHWH_S4_energy_per_Region = zeros(length(Region_number),1);
LE_SC_energy_per_Region  = zeros(length(Region_number),1);
LE_SH_energy_per_Region  = zeros(length(Region_number),1);
LE_WH_energy_per_Region  = zeros(length(Region_number),1);
LE_SHWH_energy_per_Region  = zeros(length(Region_number),1);
LE_RegionProfiles24h_SC_S1  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SC_S2  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SC_S3  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SC_S4  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SH_S1  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SH_S2  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SH_S3  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SH_S4  = zeros(length(Region_number),24);
LE_RegionProfiles24h_WH_S1  = zeros(length(Region_number),24);
LE_RegionProfiles24h_WH_S2  = zeros(length(Region_number),24);
LE_RegionProfiles24h_WH_S3  = zeros(length(Region_number),24);
LE_RegionProfiles24h_WH_S4  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SHWH_S1  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SHWH_S2  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SHWH_S3  = zeros(length(Region_number),24);
LE_RegionProfiles24h_SHWH_S4  = zeros(length(Region_number),24);
LE_RegionRate_SC_S1 = zeros(length(Region_number),24);
LE_RegionRate_SC_S2 = zeros(length(Region_number),24);
LE_RegionRate_SC_S3 = zeros(length(Region_number),24);
LE_RegionRate_SC_S4 = zeros(length(Region_number),24);
LE_RegionRate_SC_average = zeros(length(Region_number),1);
LE_RegionRate_SH_S1 = zeros(length(Region_number),24);
LE_RegionRate_SH_S2 = zeros(length(Region_number),24);
LE_RegionRate_SH_S3 = zeros(length(Region_number),24);
LE_RegionRate_SH_S4 = zeros(length(Region_number),24);
LE_RegionRate_SH_average = zeros(length(Region_number),1);
LE_RegionRate_WH_S1 = zeros(length(Region_number),24);
LE_RegionRate_WH_S2 = zeros(length(Region_number),24);
LE_RegionRate_WH_S3 = zeros(length(Region_number),24);
LE_RegionRate_WH_S4 = zeros(length(Region_number),24);
LE_RegionRate_WH_average = zeros(length(Region_number),1);
LE_RegionRate_SHWH_S1 = zeros(length(Region_number),24);
LE_RegionRate_SHWH_S2 = zeros(length(Region_number),24);
LE_RegionRate_SHWH_S3 = zeros(length(Region_number),24);
LE_RegionRate_SHWH_S4 = zeros(length(Region_number),24);
LE_RegionRate_SHWH_average = zeros(length(Region_number),1);

HE_Total_energy_per_Region  = zeros(length(Region_number),1);
SC_S1_energy_per_Region = zeros(length(Region_number),1);
SC_S2_energy_per_Region = zeros(length(Region_number),1);
SC_S3_energy_per_Region = zeros(length(Region_number),1);
SC_S4_energy_per_Region = zeros(length(Region_number),1);
SH_S1_energy_per_Region = zeros(length(Region_number),1);
SH_S2_energy_per_Region = zeros(length(Region_number),1);
SH_S3_energy_per_Region = zeros(length(Region_number),1);
SH_S4_energy_per_Region = zeros(length(Region_number),1);
WH_S1_energy_per_Region = zeros(length(Region_number),1);
WH_S2_energy_per_Region = zeros(length(Region_number),1);
WH_S3_energy_per_Region = zeros(length(Region_number),1);
WH_S4_energy_per_Region = zeros(length(Region_number),1);
SHWH_S1_energy_per_Region = zeros(length(Region_number),1);
SHWH_S2_energy_per_Region = zeros(length(Region_number),1);
SHWH_S3_energy_per_Region = zeros(length(Region_number),1);
SHWH_S4_energy_per_Region = zeros(length(Region_number),1);
HE_SC_energy_per_Region  = zeros(length(Region_number),1);
HE_SH_energy_per_Region  = zeros(length(Region_number),1);
HE_WH_energy_per_Region  = zeros(length(Region_number),1);
HE_SHWH_energy_per_Region  = zeros(length(Region_number),1);
HE_RegionProfiles24h_SC_S1  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SC_S2  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SC_S3  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SC_S4  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SH_S1  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SH_S2  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SH_S3  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SH_S4  = zeros(length(Region_number),24);
HE_RegionProfiles24h_WH_S1  = zeros(length(Region_number),24);
HE_RegionProfiles24h_WH_S2  = zeros(length(Region_number),24);
HE_RegionProfiles24h_WH_S3  = zeros(length(Region_number),24);
HE_RegionProfiles24h_WH_S4  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SHWH_S1  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SHWH_S2  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SHWH_S3  = zeros(length(Region_number),24);
HE_RegionProfiles24h_SHWH_S4  = zeros(length(Region_number),24);
HE_RegionRate_SC_S1 = zeros(length(Region_number),24);
HE_RegionRate_SC_S2 = zeros(length(Region_number),24);
HE_RegionRate_SC_S3 = zeros(length(Region_number),24);
HE_RegionRate_SC_S4 = zeros(length(Region_number),24);
HE_RegionRate_SC_average = zeros(length(Region_number),1);
HE_RegionRate_SH_S1 = zeros(length(Region_number),24);
HE_RegionRate_SH_S2 = zeros(length(Region_number),24);
HE_RegionRate_SH_S3 = zeros(length(Region_number),24);
HE_RegionRate_SH_S4 = zeros(length(Region_number),24);
HE_RegionRate_SH_average = zeros(length(Region_number),1);
HE_RegionRate_WH_S1 = zeros(length(Region_number),24);
HE_RegionRate_WH_S2 = zeros(length(Region_number),24);
HE_RegionRate_WH_S3 = zeros(length(Region_number),24);
HE_RegionRate_WH_S4 = zeros(length(Region_number),24);
HE_RegionRate_WH_average = zeros(length(Region_number),1);
HE_RegionRate_SHWH_S1 = zeros(length(Region_number),24);
HE_RegionRate_SHWH_S2 = zeros(length(Region_number),24);
HE_RegionRate_SHWH_S3 = zeros(length(Region_number),24);
HE_RegionRate_SHWH_S4 = zeros(length(Region_number),24);
HE_RegionRate_SHWH_average = zeros(length(Region_number),1);


AB = table2array(SHWH_DIST_tab(:,a:a + 23));
AD = repmat(sum(SHWH_DIST_tab(:,a:a + 23),2),1,24);

% %Normalised profiles for each country. Not useful
% Profile24h_SC_S1 = table2array(table2array(SHWH_DIST_tab(:,a:a + 23))./repmat(sum(SHWH_DIST_tab(:,a:a + 23),2)+ 0.00001,1,24));
% Profile24h_SH_S1 = table2array(table2array(SHWH_DIST_tab(:,a + 1*24:a + 1*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 1*24:a + 1*24 + 23),2)+0.00001,1,24));
% Profile24h_WH_S1 = table2array(table2array(SHWH_DIST_tab(:,a + 2*24:a + 2*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 2*24:a + 2*24 + 23),2)+0.00001,1,24));
% Profile24h_SC_S2 = table2array(table2array(SHWH_DIST_tab(:,a + 3*24:a + 3*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 3*24:a + 3*24 + 23),2)+0.00001,1,24));
% Profile24h_SH_S2 = table2array(table2array(SHWH_DIST_tab(:,a + 4*24:a + 4*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 4*24:a + 4*24 + 23),2)+0.00001,1,24));
% Profile24h_WH_S2 = table2array(table2array(SHWH_DIST_tab(:,a + 5*24:a + 5*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 5*24:a + 5*24 + 23),2)+0.00001,1,24));
% Profile24h_SC_S3 = table2array(table2array(SHWH_DIST_tab(:,a + 6*24:a + 6*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 6*24:a + 6*24 + 23),2)+0.00001,1,24));
% Profile24h_SH_S3 = table2array(table2array(SHWH_DIST_tab(:,a + 7*24:a + 7*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 7*24:a + 7*24 + 23),2)+0.00001,1,24));
% Profile24h_WH_S3 = table2array(table2array(SHWH_DIST_tab(:,a + 8*24:a + 8*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 8*24:a + 8*24 + 23),2)+0.00001,1,24));
% Profile24h_SC_S4 = table2array(table2array(SHWH_DIST_tab(:,a + 9*24:a + 9*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 9*24:a + 9*24 + 23),2)+0.00001,1,24));
% Profile24h_SH_S4 = table2array(table2array(SHWH_DIST_tab(:,a + 10*24:a + 10*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 10*24:a + 10*24 + 23)+0.00001,2),1,24));
% Profile24h_WH_S4 = table2array(table2array(SHWH_DIST_tab(:,a + 11*24:a + 11*24 + 23))./repmat(sum(SHWH_DIST_tab(:,a + 11*24:a + 11*24 + 23)+0.00001,2),1,24));

Profile24h_SC_S1 = table2array(SHWH_DIST_tab(:,a:a + 23)); % Check if I better be using the cooling dataset instead of the heating. 
Profile24h_SH_S1 = table2array(SHWH_DIST_tab(:,a + 1*24:a + 1*24 + 23));
Profile24h_WH_S1 = table2array(SHWH_DIST_tab(:,a + 2*24:a + 2*24 + 23));
Profile24h_SHWH_S1 = Profile24h_SH_S1 + Profile24h_WH_S1; 
Profile24h_SC_S2 = table2array(SHWH_DIST_tab(:,a + 3*24:a + 3*24 + 23));
Profile24h_SH_S2 = table2array(SHWH_DIST_tab(:,a + 4*24:a + 4*24 + 23));
Profile24h_WH_S2 = table2array(SHWH_DIST_tab(:,a + 5*24:a + 5*24 + 23));
Profile24h_SHWH_S2 = Profile24h_SH_S2 + Profile24h_WH_S2;
Profile24h_SC_S3 = table2array(SHWH_DIST_tab(:,a + 6*24:a + 6*24 + 23));
Profile24h_SH_S3 = table2array(SHWH_DIST_tab(:,a + 7*24:a + 7*24 + 23));
Profile24h_WH_S3 = table2array(SHWH_DIST_tab(:,a + 8*24:a + 8*24 + 23));
Profile24h_SHWH_S3 = Profile24h_SH_S3 + Profile24h_WH_S3;
Profile24h_SC_S4 = table2array(SHWH_DIST_tab(:,a + 9*24:a + 9*24 + 23));
Profile24h_SH_S4 = table2array(SHWH_DIST_tab(:,a + 10*24:a + 10*24 + 23));
Profile24h_WH_S4 = table2array(SHWH_DIST_tab(:,a + 11*24:a + 11*24 + 23));
Profile24h_SHWH_S4 = Profile24h_SH_S4 + Profile24h_WH_S4;

%Profile24h_SC_S1(X,:) indicates the data in the row of the country X. 
for i = 1:length(Region_number) %for every region
    C= intersect((Countires_per_region(i,:)'),(list_of_countries_data));
    for j = 1:width(Countires_per_region(i,:)) %for every country
            % disp('country:');
            % disp(Countires_per_region(i,j));
          
for l = 1: height(list_of_countries_data(:,1))
tf= strcmp(list_of_countries_data(l,1), Countires_per_region(i,j));


      if tf == 1
          %A(l,:) = list_of_countries_data(l,:) %This is to check which
          %coutries are not recognised. 
          Only_countries_per_region_energy (l,i)   = Total_energy_Data_SHWH(l,:); %          
          Group_countries_Profiles24h_SC_S1 (l,:,i)= Profile24h_SC_S1(l,:); %
          Group_countries_Profiles24h_SC_S2 (l,:,i)= Profile24h_SC_S2(l,:); %
          Group_countries_Profiles24h_SC_S3 (l,:,i)= Profile24h_SC_S3(l,:); %
          Group_countries_Profiles24h_SC_S4 (l,:,i)= Profile24h_SC_S4(l,:); %
          Group_countries_Profiles24h_SH_S1 (l,:,i)= Profile24h_SH_S1(l,:); %
          Group_countries_Profiles24h_SH_S2 (l,:,i)= Profile24h_SH_S2(l,:); %
          Group_countries_Profiles24h_SH_S3 (l,:,i)= Profile24h_SH_S3(l,:); %
          Group_countries_Profiles24h_SH_S4 (l,:,i)= Profile24h_SH_S4(l,:); %
          Group_countries_Profiles24h_WH_S1 (l,:,i)= Profile24h_WH_S1(l,:); %
          Group_countries_Profiles24h_WH_S2 (l,:,i)= Profile24h_WH_S2(l,:); %
          Group_countries_Profiles24h_WH_S3 (l,:,i)= Profile24h_WH_S3(l,:); %
          Group_countries_Profiles24h_WH_S4 (l,:,i)= Profile24h_WH_S4(l,:); %
          Group_countries_Profiles24h_SHWH_S1 (l,:,i)= Profile24h_SHWH_S1(l,:); %
          Group_countries_Profiles24h_SHWH_S2 (l,:,i)= Profile24h_SHWH_S2(l,:); %
          Group_countries_Profiles24h_SHWH_S3 (l,:,i)= Profile24h_SHWH_S3(l,:); %
          Group_countries_Profiles24h_SHWH_S4 (l,:,i)= Profile24h_SHWH_S4(l,:); %
          Only_countries_per_region_SC_S1 (l,i)= sum(Profile24h_SC_S1(l,:));
          Only_countries_per_region_SC_S2 (l,i)= sum(Profile24h_SC_S2(l,:));
          Only_countries_per_region_SC_S3 (l,i)= sum(Profile24h_SC_S3(l,:));
          Only_countries_per_region_SC_S4 (l,i)= sum(Profile24h_SC_S4(l,:));
          Only_countries_per_region_SH_S1 (l,i)= sum(Profile24h_SH_S1(l,:));
          Only_countries_per_region_SH_S2 (l,i)= sum(Profile24h_SH_S2(l,:));
          Only_countries_per_region_SH_S3 (l,i)= sum(Profile24h_SH_S3(l,:));
          Only_countries_per_region_SH_S4 (l,i)= sum(Profile24h_SH_S4(l,:));
          Only_countries_per_region_WH_S1 (l,i)= sum(Profile24h_WH_S1(l,:));
          Only_countries_per_region_WH_S2 (l,i)= sum(Profile24h_WH_S2(l,:));
          Only_countries_per_region_WH_S3 (l,i)= sum(Profile24h_WH_S3(l,:));
          Only_countries_per_region_WH_S4 (l,i)= sum(Profile24h_WH_S4(1,:));
          Only_countries_per_region_SHWH_S1 (l,i)= sum(Profile24h_SHWH_S1(l,:));
          Only_countries_per_region_SHWH_S2 (l,i)= sum(Profile24h_SHWH_S2(l,:));
          Only_countries_per_region_SHWH_S3 (l,i)= sum(Profile24h_SHWH_S3(l,:));
          Only_countries_per_region_SHWH_S4 (l,i)= sum(Profile24h_SHWH_S4(1,:));
          Only_countries_per_region_SC (l,i)= sum(Profile24h_SC_S1(l,:)+Profile24h_SC_S2(l,:)+Profile24h_SC_S3(l,:)+ Profile24h_SC_S4(l,:));
          Only_countries_per_region_SH (l,i)= sum(Profile24h_SH_S1(l,:)+Profile24h_SH_S2(l,:)+Profile24h_SH_S3(l,:)+ Profile24h_SH_S4(l,:));
          Only_countries_per_region_WH (l,i)= sum(Profile24h_WH_S1(l,:)+Profile24h_WH_S2(l,:)+Profile24h_WH_S3(l,:)+ Profile24h_WH_S4(1,:));
          Only_countries_per_region_SHWH (l,i)= sum(Profile24h_SHWH_S1(l,:)+Profile24h_SHWH_S2(l,:)+Profile24h_SHWH_S3(l,:)+ Profile24h_SHWH_S4(1,:));
          Only_countries_per_region_energy_check (l,i)= sum(Profile24h_SC_S1(l,:)+Profile24h_SC_S2(l,:)+Profile24h_SC_S3(l,:)+Profile24h_SC_S4(l,:)+Profile24h_SH_S1(l,:)+Profile24h_SH_S2(l,:)+Profile24h_SH_S3(l,:)+Profile24h_SH_S4(l,:) +Profile24h_WH_S1(l,:)+Profile24h_WH_S2(l,:)+Profile24h_WH_S3(l,:)+Profile24h_WH_S4(l,:));
          Error(l,i) = Only_countries_per_region_energy_check (l,i)-Only_countries_per_region_energy(l,i)  ; % pick p from here these do not agree. Why?                                         
         
 
      if  (zone(l) < 4)  

          LE_Only_countries_per_region_energy (l,i)   = Total_energy_Data_SHWH(l,:); %
          LE_Group_countries_Profiles24h_SC_S1 (l,:,i)= Profile24h_SC_S1(l,:); %
          LE_Group_countries_Profiles24h_SC_S2 (l,:,i)= Profile24h_SC_S2(l,:); %
          LE_Group_countries_Profiles24h_SC_S3 (l,:,i)= Profile24h_SC_S3(l,:); %
          LE_Group_countries_Profiles24h_SC_S4 (l,:,i)= Profile24h_SC_S4(l,:); %
          LE_Group_countries_Profiles24h_SH_S1 (l,:,i)= Profile24h_SH_S1(l,:); %
          LE_Group_countries_Profiles24h_SH_S2 (l,:,i)= Profile24h_SH_S2(l,:); %
          LE_Group_countries_Profiles24h_SH_S3 (l,:,i)= Profile24h_SH_S3(l,:); %
          LE_Group_countries_Profiles24h_SH_S4 (l,:,i)= Profile24h_SH_S4(l,:); %
          LE_Group_countries_Profiles24h_WH_S1 (l,:,i)= Profile24h_WH_S1(l,:); %
          LE_Group_countries_Profiles24h_WH_S2 (l,:,i)= Profile24h_WH_S2(l,:); %
          LE_Group_countries_Profiles24h_WH_S3 (l,:,i)= Profile24h_WH_S3(l,:); %
          LE_Group_countries_Profiles24h_WH_S4 (l,:,i)= Profile24h_WH_S4(l,:); %
          LE_Group_countries_Profiles24h_SHWH_S1 (l,:,i)= Profile24h_SHWH_S1(l,:); %
          LE_Group_countries_Profiles24h_SHWH_S2 (l,:,i)= Profile24h_SHWH_S2(l,:); %
          LE_Group_countries_Profiles24h_SHWH_S3 (l,:,i)= Profile24h_SHWH_S3(l,:); %
          LE_Group_countries_Profiles24h_SHWH_S4 (l,:,i)= Profile24h_SHWH_S4(l,:); %
          LE_Only_countries_per_region_SC_S1 (l,i)= sum(Profile24h_SC_S1(l,:));
          LE_Only_countries_per_region_SC_S2 (l,i)= sum(Profile24h_SC_S2(l,:));
          LE_Only_countries_per_region_SC_S3 (l,i)= sum(Profile24h_SC_S3(l,:));
          LE_Only_countries_per_region_SC_S4 (l,i)= sum(Profile24h_SC_S4(l,:));
          LE_Only_countries_per_region_SH_S1 (l,i)= sum(Profile24h_SH_S1(l,:));
          LE_Only_countries_per_region_SH_S2 (l,i)= sum(Profile24h_SH_S2(l,:));
          LE_Only_countries_per_region_SH_S3 (l,i)= sum(Profile24h_SH_S3(l,:));
          LE_Only_countries_per_region_SH_S4 (l,i)= sum(Profile24h_SH_S4(l,:));
          LE_Only_countries_per_region_WH_S1 (l,i)= sum(Profile24h_WH_S1(l,:));
          LE_Only_countries_per_region_WH_S2 (l,i)= sum(Profile24h_WH_S2(l,:));
          LE_Only_countries_per_region_WH_S3 (l,i)= sum(Profile24h_WH_S3(l,:));
          LE_Only_countries_per_region_WH_S4 (l,i)= sum(Profile24h_WH_S4(1,:));
          LE_Only_countries_per_region_SHWH_S1 (l,i)= sum(Profile24h_SHWH_S1(l,:));
          LE_Only_countries_per_region_SHWH_S2 (l,i)= sum(Profile24h_SHWH_S2(l,:));
          LE_Only_countries_per_region_SHWH_S3 (l,i)= sum(Profile24h_SHWH_S3(l,:));
          LE_Only_countries_per_region_SHWH_S4 (l,i)= sum(Profile24h_SHWH_S4(1,:));
          LE_Only_countries_per_region_SC (l,i)= sum(Profile24h_SC_S1(l,:)+Profile24h_SC_S2(l,:)+Profile24h_SC_S3(l,:)+Profile24h_SC_S4(l,:));
          LE_Only_countries_per_region_SH (l,i)= sum(Profile24h_SH_S1(l,:)+Profile24h_SH_S2(l,:)+Profile24h_SH_S3(l,:)+Profile24h_SH_S4(l,:));
          LE_Only_countries_per_region_WH (l,i)= sum(Profile24h_WH_S1(l,:)+Profile24h_WH_S2(l,:)+Profile24h_WH_S3(l,:)+Profile24h_WH_S4(1,:));
          LE_Only_countries_per_region_SHWH (l,i)= sum(Profile24h_SHWH_S1(l,:)+Profile24h_SHWH_S2(l,:)+Profile24h_SHWH_S3(l,:)+Profile24h_SHWH_S4(1,:));
          
          else %(zone(l) == 1 || zone(l) == 2 || zone(l) == 3 || zone(l) == 4 ||  zone(l) == 4 || zone(l) == 5 || zone(l) == 6);

          HE_Only_countries_per_region_energy (l,i)= Total_energy_Data_SHWH(l,:); %
          HE_Group_countries_Profiles24h_SC_S1 (l,:,i)= Profile24h_SC_S1(l,:); %
          HE_Group_countries_Profiles24h_SC_S2 (l,:,i)= Profile24h_SC_S2(l,:); %
          HE_Group_countries_Profiles24h_SC_S3 (l,:,i)= Profile24h_SC_S3(l,:); %
          HE_Group_countries_Profiles24h_SC_S4 (l,:,i)= Profile24h_SC_S4(l,:); %
          HE_Group_countries_Profiles24h_SH_S1 (l,:,i)= Profile24h_SH_S1(l,:); %
          HE_Group_countries_Profiles24h_SH_S2 (l,:,i)= Profile24h_SH_S2(l,:); %
          HE_Group_countries_Profiles24h_SH_S3 (l,:,i)= Profile24h_SH_S3(l,:); %
          HE_Group_countries_Profiles24h_SH_S4 (l,:,i)= Profile24h_SH_S4(l,:); %
          HE_Group_countries_Profiles24h_WH_S1 (l,:,i)= Profile24h_WH_S1(l,:); %
          HE_Group_countries_Profiles24h_WH_S2 (l,:,i)= Profile24h_WH_S2(l,:); %
          HE_Group_countries_Profiles24h_WH_S3 (l,:,i)= Profile24h_WH_S3(l,:); %
          HE_Group_countries_Profiles24h_WH_S4 (l,:,i)= Profile24h_WH_S4(l,:); %
          HE_Group_countries_Profiles24h_SHWH_S1 (l,:,i)= Profile24h_SHWH_S1(l,:); %
          HE_Group_countries_Profiles24h_SHWH_S2 (l,:,i)= Profile24h_SHWH_S2(l,:); %
          HE_Group_countries_Profiles24h_SHWH_S3 (l,:,i)= Profile24h_SHWH_S3(l,:); %
          HE_Group_countries_Profiles24h_SHWH_S4 (l,:,i)= Profile24h_SHWH_S4(l,:); %
          HE_Only_countries_per_region_SC_S1 (l,i)= sum(Profile24h_SC_S1(l,:));
          HE_Only_countries_per_region_SC_S2 (l,i)= sum(Profile24h_SC_S2(l,:));
          HE_Only_countries_per_region_SC_S3 (l,i)= sum(Profile24h_SC_S3(l,:));
          HE_Only_countries_per_region_SC_S4 (l,i)= sum(Profile24h_SC_S4(l,:));
          HE_Only_countries_per_region_SH_S1 (l,i)= sum(Profile24h_SH_S1(l,:));
          HE_Only_countries_per_region_SH_S2 (l,i)= sum(Profile24h_SH_S2(l,:));
          HE_Only_countries_per_region_SH_S3 (l,i)= sum(Profile24h_SH_S3(l,:));
          HE_Only_countries_per_region_SH_S4 (l,i)= sum(Profile24h_SH_S4(l,:));
          HE_Only_countries_per_region_WH_S1 (l,i)= sum(Profile24h_WH_S1(l,:));
          HE_Only_countries_per_region_WH_S2 (l,i)= sum(Profile24h_WH_S2(l,:));
          HE_Only_countries_per_region_WH_S3 (l,i)= sum(Profile24h_WH_S3(l,:));
          HE_Only_countries_per_region_WH_S4 (l,i)= sum(Profile24h_WH_S4(1,:));
          HE_Only_countries_per_region_SHWH_S1 (l,i)= sum(Profile24h_SHWH_S1(l,:));
          HE_Only_countries_per_region_SHWH_S2 (l,i)= sum(Profile24h_SHWH_S2(l,:));
          HE_Only_countries_per_region_SHWH_S3 (l,i)= sum(Profile24h_SHWH_S3(l,:));
          HE_Only_countries_per_region_SHWH_S4 (l,i)= sum(Profile24h_SHWH_S4(1,:));
          HE_Only_countries_per_region_SC (l,i)= sum(Profile24h_SC_S1(l,:)+Profile24h_SC_S2(l,:)+Profile24h_SC_S3(l,:)+Profile24h_SC_S4(l,:));
          HE_Only_countries_per_region_SH (l,i)= sum(Profile24h_SH_S1(l,:)+Profile24h_SH_S2(l,:)+Profile24h_SH_S3(l,:)+Profile24h_SH_S4(l,:));
          HE_Only_countries_per_region_WH (l,i)= sum(Profile24h_WH_S1(l,:)+Profile24h_WH_S2(l,:)+Profile24h_WH_S3(l,:)+Profile24h_WH_S4(1,:));
          HE_Only_countries_per_region_WH (l,i)= sum(Profile24h_SHWH_S1(l,:)+Profile24h_SHWH_S2(l,:)+Profile24h_SHWH_S3(l,:)+Profile24h_SHWH_S4(1,:));
          end
      end

    
end
end
%Total, seasonal, and 24h profiles 
Total_energy_per_Region (i)  = sum(Only_countries_per_region_energy(:,i));
SC_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S1(:,i));
SC_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S2(:,i));
SC_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S3(:,i));
SC_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S4(:,i));
SH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S1(:,i));
SH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S2(:,i));
SH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S3(:,i));
SH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S4(:,i));
WH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S1(:,i));
WH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S2(:,i));
WH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S3(:,i));
WH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S4(:,i));
SHWH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S1(:,i));
SHWH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S2(:,i));
SHWH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S3(:,i));
SHWH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S4(:,i));
SC_energy_per_Region (i)  = sum(Only_countries_per_region_SC(:,i));
SH_energy_per_Region (i)  = sum(Only_countries_per_region_SH(:,i));
WH_energy_per_Region (i)  = sum(Only_countries_per_region_WH(:,i));
SHWH_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH(:,i));
RegionProfiles24h_SC_S1 (i,:)= sum(Group_countries_Profiles24h_SC_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
RegionProfiles24h_SC_S2 (i,:)= sum(Group_countries_Profiles24h_SC_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
RegionProfiles24h_SC_S3 (i,:)= sum(Group_countries_Profiles24h_SC_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
RegionProfiles24h_SC_S4 (i,:)= sum(Group_countries_Profiles24h_SC_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
RegionProfiles24h_SH_S1 (i,:)= sum(Group_countries_Profiles24h_SH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
RegionProfiles24h_SH_S2 (i,:)= sum(Group_countries_Profiles24h_SH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
RegionProfiles24h_SH_S3 (i,:)= sum(Group_countries_Profiles24h_SH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
RegionProfiles24h_SH_S4 (i,:)= sum(Group_countries_Profiles24h_SH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
RegionProfiles24h_WH_S1 (i,:)= sum(Group_countries_Profiles24h_WH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
RegionProfiles24h_WH_S2 (i,:)= sum(Group_countries_Profiles24h_WH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
RegionProfiles24h_WH_S3 (i,:)= sum(Group_countries_Profiles24h_WH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
RegionProfiles24h_WH_S4 (i,:)= sum(Group_countries_Profiles24h_WH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
RegionProfiles24h_SHWH_S1 (i,:)= sum(Group_countries_Profiles24h_SHWH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
RegionProfiles24h_SHWH_S2 (i,:)= sum(Group_countries_Profiles24h_SHWH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
RegionProfiles24h_SHWH_S3 (i,:)= sum(Group_countries_Profiles24h_SHWH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
RegionProfiles24h_SHWH_S4 (i,:)= sum(Group_countries_Profiles24h_SHWH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));


%Total, seasonal, and 24h profiles for LE zone
LE_Total_energy_per_Region (i)  = sum(LE_Only_countries_per_region_energy(:,i));
LE_SC_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S1(:,i));
LE_SC_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S2(:,i));
LE_SC_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S3(:,i));
LE_SC_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S4(:,i));
LE_SH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S1(:,i));
LE_SH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S2(:,i));
LE_SH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S3(:,i));
LE_SH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S4(:,i));
LE_WH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S1(:,i));
LE_WH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S2(:,i));
LE_WH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S3(:,i));
LE_WH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S4(:,i));
LE_SHWH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S1(:,i));
LE_SHWH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S2(:,i));
LE_SHWH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S3(:,i));
LE_SHWH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S4(:,i));
LE_SC_energy_per_Region (i)  = sum(LE_Only_countries_per_region_SC(:,i));
LE_SH_energy_per_Region (i)  = sum(LE_Only_countries_per_region_SH(:,i));
LE_WH_energy_per_Region (i)  = sum(LE_Only_countries_per_region_WH(:,i));
LE_SHWH_energy_per_Region (i)  = sum(LE_Only_countries_per_region_SHWH(:,i));
LE_RegionProfiles24h_SC_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S1 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SC_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S4(:,:,i)));
LE_RegionProfiles24h_SC_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S2 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SC_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S4(:,:,i)));
LE_RegionProfiles24h_SC_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S3 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SC_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S4(:,:,i)));
LE_RegionProfiles24h_SC_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S4 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SC_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SC_S4(:,:,i)));
LE_RegionProfiles24h_SH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S1 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S4(:,:,i)));
LE_RegionProfiles24h_SH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S2 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S4(:,:,i)));
LE_RegionProfiles24h_SH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S3 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S4(:,:,i)));
LE_RegionProfiles24h_SH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S4 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SH_S4(:,:,i)));
LE_RegionProfiles24h_WH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S1 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_WH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S4(:,:,i)));
LE_RegionProfiles24h_WH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S2 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_WH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S4(:,:,i)));
LE_RegionProfiles24h_WH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S3 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_WH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S4(:,:,i)));
LE_RegionProfiles24h_WH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S4 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_WH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_WH_S4(:,:,i)));
LE_RegionProfiles24h_SHWH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S1 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SHWH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionProfiles24h_SHWH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S2 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SHWH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionProfiles24h_SHWH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S3 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SHWH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionProfiles24h_SHWH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S4 (:,:,i))./sum(sum(LE_Group_countries_Profiles24h_SHWH_S1(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S2(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(LE_Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionRate_SC_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
LE_RegionRate_SC_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
LE_RegionRate_SC_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
LE_RegionRate_SC_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
LE_RegionRate_SC_average(i) = sum((LE_RegionRate_SC_S1(i,:)) + (LE_RegionRate_SC_S2(i,:)) + (LE_RegionRate_SC_S3(i,:)) + (LE_RegionRate_SC_S4(i,:)));
LE_RegionRate_SH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
LE_RegionRate_SH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
LE_RegionRate_SH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
LE_RegionRate_SH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
LE_RegionRate_SH_average(i) = sum((LE_RegionRate_SH_S1(i,:)) + (LE_RegionRate_SH_S2(i,:)) + (LE_RegionRate_SH_S3(i,:)) + (LE_RegionRate_SH_S4(i,:)));
LE_RegionRate_SHWH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionRate_WH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
LE_RegionRate_WH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
LE_RegionRate_WH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
LE_RegionRate_WH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
LE_RegionRate_WH_average(i) = sum((LE_RegionRate_WH_S1(i,:)) + (LE_RegionRate_WH_S2(i,:)) + (LE_RegionRate_WH_S3(i,:)) + (LE_RegionRate_WH_S4(i,:)));
LE_RegionRate_SHWH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionRate_SHWH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionRate_SHWH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionRate_SHWH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
LE_RegionRate_SHWH_average(i) = sum((LE_RegionRate_SHWH_S1(i,:)) + (LE_RegionRate_SHWH_S2(i,:)) + (LE_RegionRate_SHWH_S3(i,:)) + (LE_RegionRate_SHWH_S4(i,:)));
% LE_RegionRate_SC_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i)));
% LE_RegionRate_SC_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S2(:,:,i)));
% LE_RegionRate_SC_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S3(:,:,i)));
% LE_RegionRate_SC_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SC_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
% LE_RegionRate_SC_average(i) = mean((LE_RegionRate_SC_S1(i,:)) + (LE_RegionRate_SC_S2(i,:)) + (LE_RegionRate_SC_S3(i,:)) + (LE_RegionRate_SC_S4(i,:)));
% LE_RegionRate_SH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i)));
% LE_RegionRate_SH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S2(:,:,i)));
% LE_RegionRate_SH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S3(:,:,i)));
% LE_RegionRate_SH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
% LE_RegionRate_SH_average(i) = mean((LE_RegionRate_SH_S1(i,:)) + (LE_RegionRate_SH_S2(i,:)) + (LE_RegionRate_SH_S3(i,:)) + (LE_RegionRate_SH_S4(i,:)));
% LE_RegionRate_WH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i)));
% LE_RegionRate_WH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S2(:,:,i)));
% LE_RegionRate_WH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S3(:,:,i)));
% LE_RegionRate_WH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_WH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
% LE_RegionRate_WH_average(i) = mean((LE_RegionRate_WH_S1(i,:)) + (LE_RegionRate_WH_S2(i,:)) + (LE_RegionRate_WH_S3(i,:)) + (LE_RegionRate_WH_S4(i,:)));
% LE_RegionRate_SHWH_S1 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i)));
% LE_RegionRate_SHWH_S2 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S2(:,:,i)));
% LE_RegionRate_SHWH_S3 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S3(:,:,i)));
% LE_RegionRate_SHWH_S4 (i,:)= sum(LE_Group_countries_Profiles24h_SHWH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
% LE_RegionRate_SHWH_average(i) = mean((LE_RegionRate_SHWH_S1(i,:)) + (LE_RegionRate_SHWH_S2(i,:)) + (LE_RegionRate_SHWH_S3(i,:)) + (LE_RegionRate_SHWH_S4(i,:)));
%Total, seasonal, and 24h profiles for HE zone
HE_Total_energy_per_Region (i)  = sum(HE_Only_countries_per_region_energy(:,i));
HE_SC_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S1(:,i));
HE_SC_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S2(:,i));
HE_SC_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S3(:,i));
HE_SC_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SC_S4(:,i));
HE_SH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S1(:,i));
HE_SH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S2(:,i));
HE_SH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S3(:,i));
HE_SH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SH_S4(:,i));
HE_WH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S1(:,i));
HE_WH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S2(:,i));
HE_WH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S3(:,i));
HE_WH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_WH_S4(:,i));
HE_SHWH_S1_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S1(:,i));
HE_SHWH_S2_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S2(:,i));
HE_SHWH_S3_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S3(:,i));
HE_SHWH_S4_energy_per_Region (i)  = sum(Only_countries_per_region_SHWH_S4(:,i));
HE_SC_energy_per_Region (i)  = sum(HE_Only_countries_per_region_SC(:,i));
HE_SH_energy_per_Region (i)  = sum(HE_Only_countries_per_region_SH(:,i));
HE_WH_energy_per_Region (i)  = sum(HE_Only_countries_per_region_WH(:,i));
HE_SHWH_energy_per_Region (i)  = sum(HE_Only_countries_per_region_SHWH(:,i));
HE_RegionProfiles24h_SC_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S1 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SC_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S4(:,:,i)));
HE_RegionProfiles24h_SC_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S2 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SC_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S4(:,:,i)));
HE_RegionProfiles24h_SC_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S3 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SC_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S4(:,:,i)));
HE_RegionProfiles24h_SC_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S4 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SC_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SC_S4(:,:,i)));
HE_RegionProfiles24h_SH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S1 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S4(:,:,i)));
HE_RegionProfiles24h_SH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S2 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S4(:,:,i)));
HE_RegionProfiles24h_SH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S3 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S4(:,:,i)));
HE_RegionProfiles24h_SH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S4 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SH_S4(:,:,i)));
HE_RegionProfiles24h_WH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S1 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_WH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S4(:,:,i)));
HE_RegionProfiles24h_WH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S2 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_WH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S4(:,:,i)));
HE_RegionProfiles24h_WH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S3 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_WH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S4(:,:,i)));
HE_RegionProfiles24h_WH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S4 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_WH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_WH_S4(:,:,i)));
HE_RegionProfiles24h_SHWH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S1 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SHWH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S4(:,:,i)));
HE_RegionProfiles24h_SHWH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S2 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SHWH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S4(:,:,i)));
HE_RegionProfiles24h_SHWH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S3 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SHWH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S4(:,:,i)));
HE_RegionProfiles24h_SHWH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S4 (:,:,i))./sum(sum(HE_Group_countries_Profiles24h_SHWH_S1(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S2(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(HE_Group_countries_Profiles24h_SHWH_S4(:,:,i)));
HE_RegionRate_SC_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
HE_RegionRate_SC_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
HE_RegionRate_SC_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
HE_RegionRate_SC_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i))+sum(Group_countries_Profiles24h_SC_S2(:,:,i))+sum(Group_countries_Profiles24h_SC_S3(:,:,i))+ sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
HE_RegionRate_SC_average(i) = sum((HE_RegionRate_SC_S1(i,:)) + (HE_RegionRate_SC_S2(i,:)) + (HE_RegionRate_SC_S3(i,:)) + (HE_RegionRate_SC_S4(i,:)));
HE_RegionRate_SH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
HE_RegionRate_SH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
HE_RegionRate_SH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
HE_RegionRate_SH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i))+sum(Group_countries_Profiles24h_SH_S2(:,:,i))+sum(Group_countries_Profiles24h_SH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
HE_RegionRate_SH_average(i) = sum((HE_RegionRate_SH_S1(i,:)) + (HE_RegionRate_SH_S2(i,:)) + (HE_RegionRate_SH_S3(i,:)) + (HE_RegionRate_SH_S4(i,:)));
HE_RegionRate_WH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
HE_RegionRate_WH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
HE_RegionRate_WH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
HE_RegionRate_WH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i))+sum(Group_countries_Profiles24h_WH_S2(:,:,i))+sum(Group_countries_Profiles24h_WH_S3(:,:,i))+ sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
HE_RegionRate_WH_average(i) = sum((HE_RegionRate_WH_S1(i,:)) + (HE_RegionRate_WH_S2(i,:)) + (HE_RegionRate_WH_S3(i,:)) + (HE_RegionRate_WH_S4(i,:)));
HE_RegionRate_SHWH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
HE_RegionRate_SHWH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
HE_RegionRate_SHWH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
HE_RegionRate_SHWH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S2(:,:,i))+sum(Group_countries_Profiles24h_SHWH_S3(:,:,i))+ sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
HE_RegionRate_SHWH_average(i) = sum((HE_RegionRate_SHWH_S1(i,:)) + (HE_RegionRate_SHWH_S2(i,:)) + (HE_RegionRate_SHWH_S3(i,:)) + (HE_RegionRate_SHWH_S4(i,:)));
% HE_RegionRate_SC_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S1(:,:,i)));
% HE_RegionRate_SC_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S2(:,:,i)));
% HE_RegionRate_SC_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S3(:,:,i)));
% HE_RegionRate_SC_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SC_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SC_S4(:,:,i)));
% HE_RegionRate_SC_average(i) = mean((HE_RegionRate_SC_S1(i,:)) + (HE_RegionRate_SC_S2(i,:)) + (HE_RegionRate_SC_S3(i,:)) + (HE_RegionRate_SC_S4(i,:)));
% HE_RegionRate_SH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S1(:,:,i)));
% HE_RegionRate_SH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S2(:,:,i)));
% HE_RegionRate_SH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S3(:,:,i)));
% HE_RegionRate_SH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SH_S4(:,:,i)));
% HE_RegionRate_SH_average(i) = mean((HE_RegionRate_SH_S1(i,:)) + (HE_RegionRate_SH_S2(i,:)) + (HE_RegionRate_SH_S3(i,:)) + (HE_RegionRate_SH_S4(i,:)));
% HE_RegionRate_WH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S1(:,:,i)));
% HE_RegionRate_WH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S2(:,:,i)));
% HE_RegionRate_WH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S3(:,:,i)));
% HE_RegionRate_WH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_WH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_WH_S4(:,:,i)));
% HE_RegionRate_WH_average(i) = mean((HE_RegionRate_WH_S1(i,:)) + (HE_RegionRate_WH_S2(i,:)) + (HE_RegionRate_WH_S3(i,:)) + (HE_RegionRate_WH_S4(i,:)));
% HE_RegionRate_SHWH_S1 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S1 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S1(:,:,i)));
% HE_RegionRate_SHWH_S2 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S2 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S2(:,:,i)));
% HE_RegionRate_SHWH_S3 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S3 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S3(:,:,i)));
% HE_RegionRate_SHWH_S4 (i,:)= sum(HE_Group_countries_Profiles24h_SHWH_S4 (:,:,i))./sum(sum(Group_countries_Profiles24h_SHWH_S4(:,:,i)));
% HE_RegionRate_SHWH_average(i) = mean((HE_RegionRate_SHWH_S1(i,:)) + (HE_RegionRate_SHWH_S2(i,:)) + (HE_RegionRate_SHWH_S3(i,:)) + (HE_RegionRate_SHWH_S4(i,:)));
end

for k = 1:length(Region_number) %for every region
disp('Region:');
disp(OMNIA_regions_tab(k,1));
disp(OMNIA_regions_tab(k,2));
disp(Total_energy_per_Region(k))
end

Rate_low_to_high_energy_intensity  = 100 * LE_Total_energy_per_Region./HE_Total_energy_per_Region;
Rate_SH_thermal_uses = [SH_energy_per_Region./ (SH_energy_per_Region  + WH_energy_per_Region)]';
Energy_per_region = table(Region_accronym ,Region_name, Total_energy_per_Region)
figure('Name','Total_energy_per_Region')
bar(Region_accronym ,Total_energy_per_Region)
figure('Name','24 h profiles GMT per region space heating S1 (Winter)')
bar(Region_accronym ,RegionProfiles24h_SH_S1(:,:))
figure('Name','24 h profiles GMT per region space heating S3 (Summer)')
bar(Region_accronym ,RegionProfiles24h_SH_S3(:,:))
figure('Name','24 h profiles GMT per region space cooling S1 (Winter)')
bar(Region_accronym ,RegionProfiles24h_SC_S1(:,:))
figure('Name','24 h profiles GMT per region sspace cooling S3 (Summer)')
bar(Region_accronym ,RegionProfiles24h_SC_S3(:,:))
figure('Name','Total Energy in high energy intensity zone')
bar(Region_accronym,HE_Total_energy_per_Region)
figure('Name','Total Energy in low energy intensity zone')
bar(Region_accronym,LE_Total_energy_per_Region)
figure('Name','Rate low to high energy intensity')
bar(Region_accronym,Rate_low_to_high_energy_intensity)
figure('Name','Share of energy between LE and HE')
bar(Region_accronym,[LE_Total_energy_per_Region, HE_Total_energy_per_Region],'stacked')
figure('Name','Share of energy between SH, SC, WH')
bar(Region_accronym,[SC_energy_per_Region, SH_energy_per_Region,WH_energy_per_Region],'stacked')

% data = repmat(Countires_per_region(i,j) ,size(list_of_countries_data))
% T = cell2table(data);


% 
% 
% % Find the position of the target country
% 
% % for i = 1 : height(list_of_countries_data)
% % A = strcmp(list_of_countries_data(i,1), targetCountry);
% % if A == tf;
% %     i
% % end
% % end
% data = repmat({'Greece'},size(list_of_countries_data))
% T = cell2table(data);
% 
% tableString = evalc('disp(list_of_countries_data)');

% Apply the function to slice and average the data


Slc_RegionProfiles24h_SC_S1 = sliceaveragetable(RegionProfiles24h_SC_S1,Region_accronym');
Slc_RegionProfiles24h_SC_S2 = sliceaveragetable(RegionProfiles24h_SC_S2,Region_accronym');
Slc_RegionProfiles24h_SC_S3 = sliceaveragetable(RegionProfiles24h_SC_S3,Region_accronym');
Slc_RegionProfiles24h_SC_S4 = sliceaveragetable(RegionProfiles24h_SC_S4,Region_accronym');
Slc_RegionProfiles24h_SH_S1 = sliceaveragetable(RegionProfiles24h_SH_S1,Region_accronym');
Slc_RegionProfiles24h_SH_S2 = sliceaveragetable(RegionProfiles24h_SH_S2,Region_accronym');
Slc_RegionProfiles24h_SH_S3 = sliceaveragetable(RegionProfiles24h_SH_S3,Region_accronym');
Slc_RegionProfiles24h_SH_S4 = sliceaveragetable(RegionProfiles24h_SH_S4,Region_accronym');
Slc_RegionProfiles24h_WH_S1 = sliceaveragetable(RegionProfiles24h_WH_S1,Region_accronym');
Slc_RegionProfiles24h_WH_S2 = sliceaveragetable(RegionProfiles24h_WH_S2,Region_accronym');
Slc_RegionProfiles24h_WH_S3 = sliceaveragetable(RegionProfiles24h_WH_S3,Region_accronym');
Slc_RegionProfiles24h_WH_S4 = sliceaveragetable(RegionProfiles24h_WH_S4,Region_accronym');
Slc_RegionProfiles24h_SHWH_S1 = sliceaveragetable(RegionProfiles24h_SHWH_S1,Region_accronym');
Slc_RegionProfiles24h_SHWH_S2 = sliceaveragetable(RegionProfiles24h_SHWH_S2,Region_accronym');
Slc_RegionProfiles24h_SHWH_S3 = sliceaveragetable(RegionProfiles24h_SHWH_S3,Region_accronym');
Slc_RegionProfiles24h_SHWH_S4 = sliceaveragetable(RegionProfiles24h_SHWH_S4,Region_accronym');

Slc_LE_RegionProfiles24h_SC_S1 = sliceaveragetable(LE_RegionProfiles24h_SC_S1,Region_accronym');
Slc_LE_RegionProfiles24h_SC_S2 = sliceaveragetable(LE_RegionProfiles24h_SC_S2,Region_accronym');
Slc_LE_RegionProfiles24h_SC_S3 = sliceaveragetable(LE_RegionProfiles24h_SC_S3,Region_accronym');
Slc_LE_RegionProfiles24h_SC_S4 = sliceaveragetable(LE_RegionProfiles24h_SC_S4,Region_accronym');
Slc_LE_RegionProfiles24h_SH_S1 = sliceaveragetable(LE_RegionProfiles24h_SH_S1,Region_accronym');
Slc_LE_RegionProfiles24h_SH_S2 = sliceaveragetable(LE_RegionProfiles24h_SH_S2,Region_accronym');
Slc_LE_RegionProfiles24h_SH_S3 = sliceaveragetable(LE_RegionProfiles24h_SH_S3,Region_accronym');
Slc_LE_RegionProfiles24h_SH_S4 = sliceaveragetable(LE_RegionProfiles24h_SH_S4,Region_accronym');
Slc_LE_RegionProfiles24h_WH_S1 = sliceaveragetable(LE_RegionProfiles24h_WH_S1,Region_accronym');
Slc_LE_RegionProfiles24h_WH_S2 = sliceaveragetable(LE_RegionProfiles24h_WH_S2,Region_accronym');
Slc_LE_RegionProfiles24h_WH_S3 = sliceaveragetable(LE_RegionProfiles24h_WH_S3,Region_accronym');
Slc_LE_RegionProfiles24h_WH_S4 = sliceaveragetable(LE_RegionProfiles24h_WH_S4,Region_accronym');
Slc_LE_RegionProfiles24h_SHWH_S1 = sliceaveragetable(LE_RegionProfiles24h_SHWH_S1,Region_accronym');
Slc_LE_RegionProfiles24h_SHWH_S2 = sliceaveragetable(LE_RegionProfiles24h_SHWH_S2,Region_accronym');
Slc_LE_RegionProfiles24h_SHWH_S3 = sliceaveragetable(LE_RegionProfiles24h_SHWH_S3,Region_accronym');
Slc_LE_RegionProfiles24h_SHWH_S4 = sliceaveragetable(LE_RegionProfiles24h_SHWH_S4,Region_accronym');

Slc_HE_RegionProfiles24h_SC_S1 = sliceaveragetable(HE_RegionProfiles24h_SC_S1,Region_accronym');
Slc_HE_RegionProfiles24h_SC_S2 = sliceaveragetable(HE_RegionProfiles24h_SC_S2,Region_accronym');
Slc_HE_RegionProfiles24h_SC_S3 = sliceaveragetable(HE_RegionProfiles24h_SC_S3,Region_accronym');
Slc_HE_RegionProfiles24h_SC_S4 = sliceaveragetable(HE_RegionProfiles24h_SC_S4,Region_accronym');
Slc_HE_RegionProfiles24h_SH_S1 = sliceaveragetable(HE_RegionProfiles24h_SH_S1,Region_accronym');
Slc_HE_RegionProfiles24h_SH_S2 = sliceaveragetable(HE_RegionProfiles24h_SH_S2,Region_accronym');
Slc_HE_RegionProfiles24h_SH_S3 = sliceaveragetable(HE_RegionProfiles24h_SH_S3,Region_accronym');
Slc_HE_RegionProfiles24h_SH_S4 = sliceaveragetable(HE_RegionProfiles24h_SH_S4,Region_accronym');
Slc_HE_RegionProfiles24h_WH_S1 = sliceaveragetable(HE_RegionProfiles24h_WH_S1,Region_accronym');
Slc_HE_RegionProfiles24h_WH_S2 = sliceaveragetable(HE_RegionProfiles24h_WH_S2,Region_accronym');
Slc_HE_RegionProfiles24h_WH_S3 = sliceaveragetable(HE_RegionProfiles24h_WH_S3,Region_accronym');
Slc_HE_RegionProfiles24h_WH_S4 = sliceaveragetable(HE_RegionProfiles24h_WH_S4,Region_accronym');
Slc_HE_RegionProfiles24h_SHWH_S1 = sliceaveragetable(HE_RegionProfiles24h_SHWH_S1,Region_accronym');
Slc_HE_RegionProfiles24h_SHWH_S2 = sliceaveragetable(HE_RegionProfiles24h_SHWH_S2,Region_accronym');
Slc_HE_RegionProfiles24h_SHWH_S3 = sliceaveragetable(HE_RegionProfiles24h_SHWH_S3,Region_accronym');
Slc_HE_RegionProfiles24h_SHWH_S4 = sliceaveragetable(HE_RegionProfiles24h_SHWH_S4,Region_accronym');

%Example of figure

figure('Name','Slice profiles GMT per region space heating S1 (Winter)')
bar(Region_accronym ,table2array(Slc_RegionProfiles24h_SH_S1(:,:)))
figure('Name','Slice profiles GMT per region space heating S3 (Summer)')
bar(Region_accronym ,table2array(Slc_RegionProfiles24h_SH_S3(:,:)))
figure('Name','Slice profiles GMT per region space cooling S1 (Winter)')
bar(Region_accronym ,table2array(Slc_RegionProfiles24h_SC_S1(:,:)))
figure('Name','Slice profiles GMT per region space cooling S3 (Summer)')
bar(Region_accronym ,table2array(Slc_RegionProfiles24h_SC_S3(:,:)))
figure('Name','Slice profiles GMT per region space cooling in High Intensity zones S3 (Summer)') %Figure 2.3 in documentation
bar(Region_accronym ,table2array(Slc_HE_RegionProfiles24h_SC_S3(:,:)))
figure('Name','Slice profiles GMT per region space & water heating in High Intensity zones S3 (Summer)') %Figure 2.4 in documentation 
bar(Region_accronym ,table2array(Slc_HE_RegionProfiles24h_SHWH_S3(:,:)))



LE_RegionRate_SC_average+HE_RegionRate_SC_average
LE_RegionRate_WH_average+HE_RegionRate_WH_average
LE_RegionRate_SH_average+HE_RegionRate_SH_average
LE_RegionRate_SHWH_average+HE_RegionRate_SHWH_average
