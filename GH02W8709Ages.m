%% (a) gh02
close all;clc
x=fcn(144.21,xic);y=fcn(42.23,yic);z=fcn(1212,depthc);
plot(-timec,squeeze(tsnanmean(baage(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'-');hold on
plot(-timec,squeeze(tsnanmean(bpage(x-4:x+4,y-4:y+4,z,:),[1,2,3])),'-r','MarkerSize',20,'MarkerIndices',1:15:220);hold on
plot(-timec,squeeze(tsnanmean(bwpdc33(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'-','MarkerSize',20,'MarkerIndices',1:15:220)
plot(-timec,squeeze(tsnanmean(iagectrace_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'-k','LineWidth',3)
ylabel('Age (a)');set(gca,'YLim',[0 1500])
yyaxis right
scatter(gh02(:,3)./1000,gh02(:,9),200,'MarkerFaceColor',cl(4,:),'MarkerEdgeColor',cl(4,:));
plot(gh02(:,3)./1000,gh02(:,9),'-','Color',cl(4,:))
legend('B-A age model','B-P age model','\tau_{BwP3}','Iage','B-P age data')
set(gca,'XLim',[0 23]);set(gca,'XDir','reverse')
%title('W8709 42N 234E 2710m E Pacific')
set(gca,'YLim',[0 1500])
ax=gca;
ax.YAxis(2).Color=cl(4,:);
ylabel('Age (a)');xlabel('ka');set(gca,'XColor','none')
box off
set(gcf,'Position',[100 100 1000 400])
saveas(gcf,'1.png')
%% (b) 
close all;clc
plot(-timec,squeeze(tsnanmean(baage(64:70,82:90,49:50,:),[1,2,3])),'-');hold on
plot(-timec,squeeze(tsnanmean(bpage(64:70,82:90,49:50,:),[1,2,3])),'-r','MarkerSize',20,'MarkerIndices',1:15:220);hold on
plot(-timec,squeeze(tsnanmean(bwpdc33(64:70,82:90,49:50,:),[1,2,3])),'-','MarkerSize',20,'MarkerIndices',1:15:220)
plot(-timec,squeeze(tsnanmean(iagectrace_cz(64:70,82:90,49:50,:),[1,2,3])),'-k','LineWidth',3)
ylabel('Age (a)')
yyaxis right
scatter(w8709(:,3)./1000,w8709(:,9),100,'f','MarkerFaceColor',cl(4,:));hold on
plot(w8709(:,3)./1000,w8709(:,9),'-','Color',cl(4,:))
%legend('B-A age model','B-P age model','\tau_{BwP3}','Iage','B-P age data')
set(gca,'XLim',[0 23]);set(gca,'XDir','reverse')
%title('W8709 42N 234E 2710m E Pacific')
ylabel('Age (a)');xlabel('ka')
set(gca,'YLim',[0 3000])
ax=gca;
ax.YAxis(2).Color=cl(4,:);
box off
set(gcf,'Position',[100 100 1000 400])
saveas(gcf,'2.png')