function plot_indiv_od_od_regression(mouse,odor1,odor2,sideList,A,C)
[respMean,respBool] = calculate_mean_response(mouse,sideList,A,C);
X = respMean(:,odor1);
Y = respMean(:,odor2);
[m,b,Rsq] = fitlm_custom(X,Y);

title(['mouse #',num2str(mouse), ', od',num2str(odor1),' vs od',num2str(odor2),', a=', num2str(m),', b= ', num2str(b),', R2=',num2str(Rsq)])
xlabel({'Odor-Odor neuron comparison'})
hold on
plot(X,Y,'o')

%Line connecting linear regression
X2=[min(X),max(X)];
Y2=m*X2+b;
plot(X2,Y2,'-.r')

end



