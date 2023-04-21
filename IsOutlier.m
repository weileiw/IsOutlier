% this script is to test if there is any outlier in the dataset
% of CaCO3 to wet biomass weight of Sargassum reported by Pestana (1985).
% Author: Wei-Lei Wang (weilei.wang@xmu.edu.cn)

% CaCO3 to wet weight ratio from Pestana 1985;
R_PEA = ([0.161; 0.093; 0.097; 0.061; 0.043; 0.102; ...
	  0.097; 0.097; 0.214; 0.091; 0.076; 0.056; ...
	  0.149])*100;

% method "median"
iout = find(isoutlier(R_PEA,'median') == 1);
if length(iout) == 0
    fprintf('There is no outliers. \n')
else 
    for ji = 1 : length(iout)
        fprintf('Based on the median method, the outliers are % 3.3f \n', R_PEA(iout(ji)))
    end
end

% method "quantiles"
isoutlier(R_PEA,'quartiles');
if length(iout) == 0
    fprintf('There is no outliers. \n')
else 
    for ji = 1 : length(iout)
        fprintf('Based on the quartiles method, the outliers are % 3.3f \n', R_PEA(iout(ji)))
    end
end 

% method Gubbs
% test if the data is normal
if adtest(R_PEA)
    disp(['Pestana data follow normal distribution.'])
    isoutlier(R_PEA,'gubbs') ; % data have to be normally distributed
    if length(iout) == 0
       fprintf('There is no outliers. \n')
    else 
        for ji = 1 : length(iout)
            fprintf('Based on the Gubbs method, the outliers are % 3.3f \n', R_PEA(iout(ji)))
        end
    end 
else
    disp(['Pestana data do not follow normal distribution.'])
end 

disp('----------------- END! ---------------------')




