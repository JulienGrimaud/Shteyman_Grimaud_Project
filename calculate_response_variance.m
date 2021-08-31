function [respVar,respBool] = calculate_response_variance(mouseList,sideList,A,C)
%This function calculates the mean neuronal responses to all odors.
%
%Inputs:
%  - mouseList is a 1-D matrix containing a list of mice (from 1 to 10).
%  - sideList is a 1-D matrix containing a list of sides (from 1 to 2).
%  - A and C are the data matrices from tetrodeRecordings_OC_2s.mat.
%
%Outputs:
%  - respMean is an N-by-16 matrix, with N equal to the total number of
%   neurons recorded in the mice specified in mouseList. This variable
%   contains the mean response of all neurons to all odors. For example,
%   respMean(34,3) is the mean response of neuron 34 to odor 3.
%  - respBool is an N-by-16 matrix, with N equal to the total number of
%   neurons recorded in the mice specified in mouseList. This variable
%   contains significance of all odor responses. For example,
%   respBool(34,3) is equal to 1 if neuron 34 responded significantly to
%   odor 3, or 0 otherwise.
respVar = [];
respBool = [];

for mouse = mouseList
    
    for side = sideList
        M = A{mouse};   %extracts the recordings from one of the 10 mice recorded
        N = C{mouse};   %extracts the response significance from the same mouse

        resp = M(:,:,side,:);   %takes all odor responses from a given side
        resp = squeeze(resp);   %removes singleton dimensions
        respVar = [respVar ; var(resp,0,3)];   %calculates the mean odor response

        respBoolTemp = N(:,:,side);   %1 if significant odor response, 0 otherwise
        respBool = [respBool ; squeeze(respBoolTemp)];   %removes singleton dimensions
        
    end
    
end


end