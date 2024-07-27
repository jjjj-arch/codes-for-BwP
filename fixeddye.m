w%% fixed dye panel2 GH02-1030
% I improved the results by chosing more reasonable source region and
% weighting the depth, obtaing the bwpdc33chazhi and iagectrace_czchazhi,
% and dyeagelgm3chazhi and dyeagepi3chazhi
x=fcn(144.21,xic);y=fcn(42.23,yic);z=fcn(1212,uniform_depths);
clc;close all
plot(-timec,squeeze(tsnanmean(iagectrace_czchazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'k');hold on
plot(-timec,squeeze(tsnanmean(dyeagelgm3chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'r')
plot(-timec,squeeze(tsnanmean(dyeagepi3chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3])))
plot(-timec,squeeze(tsnanmean(bwpdc33chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3])))
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');box off
set(gca, 'XColor', 'none');set(gcf,'Position',[100 100 1000 400])
legend('Iage','FixedDye_{LGM}','FixedDye_{PI}','\tau_{BwP3}')
ylabel('Age (a)')
saveas(gcf,'3.png')
figure(2)
d1=squeeze(tsnanmean(iagectrace_czchazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d2=squeeze(tsnanmean(dyeagelgm3chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d3=squeeze(tsnanmean(dyeagepi3chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d4=squeeze(tsnanmean(bwpdc33chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
dd1=(d4-d1)./d1;dd2=(d2-d1)./d1;dd3=(d3-d1)./d1;
plot(-timec,dd1,'Color',cl(4,:));hold on;plot(-timec,dd2,'r');plot(-timec,dd3)
plot(-timec,zeros(220),'--','Color',[0.7 0.7 0.7])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');box off
set(gca, 'XColor', 'none');set(gcf,'Position',[100 100 1000 400])
%legend('\tau_{BwP3} Bias from Iage','FiexedDye_{LGM} Bias from Iage','FixedDye_{PI} Bias from Iage')
ylabel('Bias from Iage')
saveas(gcf,'4.png')
%% panel1 global
clc;close all
plot(-timec,squeeze(tsnanmean(iagectrace_czchazhi(:,:,:,:),[1,2,3])),'k');hold on
plot(-timec,squeeze(tsnanmean(dyeagelgm3chazhi(:,:,:,:),[1,2,3])),'r')
plot(-timec,squeeze(tsnanmean(dyeagepi3chazhi(:,:,:,:),[1,2,3])))
plot(-timec,squeeze(tsnanmean(bwpdc33chazhi(:,:,:,:),[1,2,3])))
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');box off
set(gca, 'XColor', 'none');
%legend('Iage','FixedDye_{LGM}','FixedDye_{PI}','\tau_{BwP3}')
ylabel('Age (a)')
set(gcf,'Position',[100 100 1000 400])
saveas(gcf,'1.png')
figure(2)
d1=squeeze(tsnanmean(iagectrace_czchazhi(:,:,:,:),[1,2,3]));
d2=squeeze(tsnanmean(dyeagelgm3chazhi(:,:,:,:),[1,2,3]));
d3=squeeze(tsnanmean(dyeagepi3chazhi(:,:,:,:),[1,2,3]));
d4=squeeze(tsnanmean(bwpdc33chazhi(:,:,:,:),[1,2,3]));
dd1=(d4-d1)./d1;dd2=(d2-d1)./d1;dd3=(d3-d1)./d1;
plot(-timec,dd1,'Color',cl(4,:));hold on;plot(-timec,dd2,'r');plot(-timec,dd3)
plot(-timec,zeros(220),'--','Color',[0.7 0.7 0.7])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');box off
set(gca, 'XColor', 'none');set(gcf,'Position',[100 100 1000 400])
%legend('\tau_{BwP3} Bias from Iage','FiexedDye_{LGM} Bias from Iage','FixedDye_{PI} Bias from Iage')
ylabel('Bias from Iage')
saveas(gcf,'2.png')
%% panel3 W8709 42.12(85) 	234.25(66) 2710(49:50) E Pacific
x=fcn(234.25,xic);y=fcn(42.12,yic);z=fcn(2710,uniform_depths);
clc;close all
plot(-timec,squeeze(tsnanmean(iagectrace_czchazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'k');hold on
plot(-timec,squeeze(tsnanmean(dyeagelgm3chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'r')
plot(-timec,squeeze(tsnanmean(dyeagepi3chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3])))
plot(-timec,squeeze(tsnanmean(bwpdc33chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3])))
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');
%legend('Iage','FixedDye_{LGM}','FixedDye_{PI}','\tau_{BwP3}')
box off;xlabel('ka')
ylabel('Age (a)');set(gcf,'Position',[100 100 1000 400])
saveas(gcf,'5.png')
figure(2)
d1=squeeze(tsnanmean(iagectrace_czchazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d2=squeeze(tsnanmean(dyeagelgm3chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d3=squeeze(tsnanmean(dyeagepi3chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d4=squeeze(tsnanmean(bwpdc33chazhi(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
dd1=(d4-d1)./d1;dd2=(d2-d1)./d1;dd3=(d3-d1)./d1;
plot(-timec,dd1,'Color',cl(4,:));hold on;plot(-timec,dd2,'r');plot(-timec,dd3)
plot(-timec,zeros(220),'--','Color',[0.7 0.7 0.7])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');box off
%set(gca, 'XColor', 'none');
%legend('\tau_{BwP3} Bias from Iage','FiexedDye_{LGM} Bias from Iage','FixedDye_{PI} Bias from Iage')
ylabel('Bias from Iage');set(gcf,'Position',[100 100 1000 400])
xlabel('ka')
saveas(gcf,'6.png')
