%all figures

close all

%FIGURE 1
figure
%Odor similarity matrix
load('odor_feature_table.mat')
OdorSimilarity = odor_similarity(D);
subplot(1,2,1)
imagesc(OdorSimilarity,[6 15])
axis square
%Neuronal response similarity matrix, example mouse #8
load('tetrodeRecordings_OC_2s.mat')
mouseList = 8;
sideList = 1;
[NeuronRespSimilarity] = neuron_comparison(mouseList,sideList,A,C);
subplot(1,2,2)
imagesc(NeuronRespSimilarity)
axis square

%FIGURE 3B
figure
N = [];
for mouseList = 1:10
    load('tetrodeRecordings_OC_2s.mat')
    sideList = 1;
    [NeuronRespSimilarity] = neuron_comparison(mouseList,sideList,A,C);
    subplot(4,3,mouseList)
    imagesc(NeuronRespSimilarity)
    axis square
    colormap(jet)
    
    M = NeuronRespSimilarity;
    for i = 1:15
        M(i,i) = NaN;
    end
    M = reshape(M,[15*15,1]);
    M(find(isnan(M))) = [];
    N = [N M];
end

%FIGURE 3C
figure
hold on
for i = 1:210
    plot(sort(N(i,:)), 'Color','k')
end

%FIGURE 4
%Odor similarity versus neuronal response similarity
mouseList = 1:10;
sideList = 1;
odor_neuron_similarity(mouseList,sideList)

%FIGURE 2
%Variance across repeats for each odor, each region
sideList = 1;
regionOfEachMouse = [1 1 1 2 2 2 2 3 3 3];
figure
for region = 1:3
    whichMice = find(regionOfEachMouse==region);
    respVarAll = [];
    for mouseList = whichMice
        [respVar,respBool] = calculate_response_variance(mouseList,sideList,A,C);
        respVarAll = [respVarAll;respVar];
    end
    subplot(2,3,region)
    hold on
    Color = turbo(15);
    for odor = 1:15
        histogram(respVarAll(:,odor),'BinWidth',0.5,'Normalization','cdf','DisplayStyle','stairs','EdgeColor',Color(odor,:))
    end
    ylim([0 1.1])
    subplot(2,3,region+3)
    hold on
    Color = turbo(15);
    for odor = 1:15
        histogram(respVarAll(:,odor),'BinWidth',0.5,'Normalization','cdf','DisplayStyle','stairs','EdgeColor',Color(odor,:))
    end
    xlim([0 10])
    ylim([0 1])
end

%FIGURE 3A
%Individual regressions
mouse = 1;
sideList = 1;
figure
subplot(1,2,1)
odor1 = 1;
odor2 = 11;
plot_indiv_od_od_regression(mouse,odor1,odor2,sideList,A,C);
axis square
subplot(1,2,2)
odor1 = 5;
odor2 = 8;
plot_indiv_od_od_regression(mouse,odor1,odor2,sideList,A,C);
axis square

