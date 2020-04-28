function twopoints(d)
% draws and shades the region in [0,1]^2 in which |x-y|<d
% start point (d,0), end point (1,1-d)
figure
hold on
ax=gca;
% draw the unit square
plot([0,1,1,0,0],[0,0,1,1,0],'k','linewidth',2)
% draw the region
xs=[0,d,1,1,1-d,0,0];
ys=[0,0,1-d,1,1,d,0];
fill(xs,ys,[0.6,0.5,0.8])

% draw diagonal
plot([0,1],[0,1],'--k','linewidth',2)

% annotate graph
fs=30;
plot(d,0,'.k','markersize',fs)
plot(0,d,'.k','markersize',fs)
title(['\delta =  ',num2str(d)],'fontsize',fs)
xlabel('x')
ylabel('y')
ax.XTick=[0,d,1];
ax.YTick=[0,d,1];
set(ax,'fontsize',fs)
%print(gcf,'-deps','../twopoint.eps')