function OdorSimilarity = odor_similarity(D)
%This function finds the total number of similarities between any 2 given
%odors.
%
%Input:
%D is a 2D matrix that has number values in it. In the example below, D is
%comparing 15 odors with 15 true/false statements, such as the inclusion of
%a functional group or an irritant label.
%
%Output: 
%OdorSimilarity is a 2D matrix, wherein each value is the number of shared
%values between any two given odors. For example, OdorSimilarity(3,4) is
%the amount of true/false answers that odors 3 and 4 have in common.
%
%Note: In the example below D is a 15-by-15 matrix
%
%Establishes that OdorSimilarity will end up being a 15-by-15 matrix
OdorSimilarity = zeros([15 15]);

%Establishes line1 and line2 as any given lines in the input matrix
for line1 = 1:15
    for line2 = 1:15
        %Establishes D1 and D2 as any given lines in D
        D1 = D(line1,:);
        D2 = D(line2,:);
        %Counts the number of columns in D, and sets a counter of 0
        totalNbColumns = size(D,2);
        counter = 0;
        %If D1 and D2 share a value in the same column, increase the
        %counter by 1
        for column = 1:totalNbColumns
            if D1(column) == D2(column)
                counter = counter+1;
            end
        end
        % Alternate way of writing the above for loop:size(find(D1==D2),2)
        %Fills in OdorSimilarity with every combination of counter sums
        OdorSimilarity(line1,line2) = counter;
        
    end
end
%Displays OdorSimilarity on a color scale

end




