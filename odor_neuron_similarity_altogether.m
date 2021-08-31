function odor_neuron_similarity_altogether(mouseList,sideList)
%This code compares mean neuronal responses with a seperate odor similarity
%matrix.
load('odor_feature_table.mat')
load('tetrodeRecordings_OC_2s.mat')

figure
[RsqAll] = neuron_comparison(mouseList,sideList,A,C);
OdorSimilarity = odor_similarity(D);
neuronSimilarityMatrix = triu(RsqAll,1);
neuronSimilarityMatrix = reshape(neuronSimilarityMatrix,15*15,1);
neuronSimilarityMatrix(find(neuronSimilarityMatrix==0)) = [];
neuronSimilarityMatrix=reshape(neuronSimilarityMatrix,[1,105]);
%now for the odor similarity
odorSimilarityMatrix=triu(OdorSimilarity,1);
odorSimilarityMatrix=reshape(odorSimilarityMatrix,15*15,1);
odorSimilarityMatrix(find(odorSimilarityMatrix==0))=[];
odorSimilarityMatrix=reshape(odorSimilarityMatrix,[1,105]);
%Finds the slope, intercept, and R-squared value for the graph
[m,b,Rsq2]=fitlm_custom(neuronSimilarityMatrix,odorSimilarityMatrix);
RsqEach=Rsq2;
%Plotting the graph-this can be catered to anything you are looking for
%(each individual mouse, different sides, etc)
title(['R-Squared value is ',num2str(Rsq2)])
xlabel({'Odor-Odor neuron comparison','all mice together'})
xlim([0 0.8])
ylabel('Odor-Odor similarity matrix sums','FontSize',6)
hold on
graph=plot(neuronSimilarityMatrix,odorSimilarityMatrix,'o')
%Line connecting linear regression
X2=[min(neuronSimilarityMatrix),max(neuronSimilarityMatrix)];
Y2=m*X2+b;
plot(X2,Y2,'-.r')

end