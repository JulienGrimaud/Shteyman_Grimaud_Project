function [RsqAll] = neuron_comparison(mouseList,sideList,A,C)
%This code calculates the R-Squared values for every combination of odors
%
%Inputs:
%  - mouse is the mouse #. 
%  - sidelist is the side #.
%  - A and C are the data matrices from tetrodeRecordings_OC_2s.mat.
%
%Output:
%RsqAll is a 15-by-15 matrix, with each value being an R-Squared value of
%two given odors. For example, RsqAll(15,8) is the R-Squared value for
%odors 15 and 8
%
[respMean,respBool] = calculate_mean_response(mouseList,sideList,A,C);

RsqAll = zeros([15,15]);

for odor1 = 1:15
    for odor2 = 1:15
        
        X = respMean(:,odor1);
        Y = respMean(:,odor2);
        [slope,intercept,Rsq] = fitlm_custom(X,Y);
        
        RsqAll(odor1,odor2) = Rsq;
        
        
    end
end

end





