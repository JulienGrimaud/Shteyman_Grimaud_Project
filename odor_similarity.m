function OdorSimilarity = odor_similarity(D)
%This function finds the total number of similarities between any 2 given
%odors, then generate an odor similarity matrix.
%
%Input:
%D is a 2D matrix that represents various odors and their features. Each
%line is an odor, each column is a feature.
%
%Output: 
%OdorSimilarity is a 2D matrix, wherein each value is the number of shared
%features between any two given odors. For example, OdorSimilarity(3,4) is
%the amount of features that odors 3 and 4 have in common.

s = size(D);
%s(1) is the number of odors in D, s(2) is the number of odor features.

OdorSimilarity = zeros([s(2),s(2)]);

for odor1 = 1:s(1) 
    for odor2 = 1:s(1) %for all pairs of odors from D
        
        D1 = D(odor1,:); %D1 contains all the odor features of odor1
        D2 = D(odor2,:); %D2 contains all the odor features of odor2
        

        counter = 0;        
        %The loop below compares the values of D1 and D2 one by one.
        %Every time D1 and D2 share a feature, we add 1 to the counter.
        for feature = 1:s(2)
            if D1(feature) == D2(feature)
                counter = counter+1;
            end
        end

        OdorSimilarity(odor1,odor2) = counter;
        
    end
end

end




