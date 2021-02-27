function [RsqAll] = neuron_comparison(mouseList,sideList,A,C)
%This code calculates the R-Squared values for every combination of odors
%
%Inputs:
%  - mouseList is a 1-D matrix containing a list of mice (from 1 to 10).
%  - sideList is a 1-D matrix containing a list of sides (from 1 to 2).
%  - A and C are the data matrices from tetrodeRecordings_OC_2s.mat.
%
%Output:
%RsqAll is a 15-by-15 matrix, with each value being an R-Squared value of
%two given odors. For example, RsqAll(15,8) is the R-Squared value for
%odors 15 and 8
%
%Note:This requires either the fitlm calculate mean response functions.
[respMean,respBool] = calculate_mean_response(mouseList,sideList,A,C); %Runs the calculate mean response function

RsqAll = zeros([15,15]);%Establishes a 

for odor1 = 1:15
    for odor2 = 1:15
        
        X = respMean(:,odor1);
        Y = respMean(:,odor2);
        [slope,intercept,Rsq] = fitlm_custom(X,Y);
        
        RsqAll(odor1,odor2) = Rsq;
        
        
    end
end

end





