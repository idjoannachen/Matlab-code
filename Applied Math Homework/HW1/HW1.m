%1.24
y = randn(1000,1);
v = -4:0.1:4;
%https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.histogram.html#namevaluepairarguments
%'Normalization','pdf' means  the number of elements in the bin/(width of
%the bin * number of elements in the input data)
h = histogram(y,v,'Normalization','pdf')
hold on
mu = 0;
sigma = 1;
f = exp(-(v-mu).^2./(2*sigma^2))./(sigma*sqrt(2*pi));
plot(v,f,'LineWidth',1.5)
xlabel('x')
ylabel('probability')
title(['Incidence histogram including 1000 r.v in 80 bins against normal function'])
hold off