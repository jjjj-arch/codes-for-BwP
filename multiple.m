%% 1500m atlantic water mass fraction 
close all;clc
x=fcn(144.21,xic);y=fcn(48.23,yic);z=fcn(1200,depthc);
plot(-timec,squeeze(tsnanmean(dye_s_cz(79:100,y-2:y+2,z,:),[1,2,3])),'Color',cl(1,:));hold on
plot(-timec,squeeze(tsnanmean(dye_na_cz(79:100,y-2:y+2,z,:),[1,2,3])),'Color',cl(3,:));
plot(-timec,squeeze(tsnanmean(dye_sp_cz(79:100,y-2:y+2,z,:),[1,2,3])),'Color',cl(4,:));
plot(-timec,squeeze(tsnanmean(dye_ta_cz(79:100,y-2:y+2,z,:),[1,2,3])),'Color',cl(5,:));
plot(-timec,squeeze(tsnanmean(dye_i_cz(79:100,y-2:y+2,z,:),[1,2,3])),'Color',cl(6,:));
plot(-timec,squeeze(tsnanmean(dye_np_cz(79:100,y-2:y+2,z,:),[1,2,3])),'Color','r');
legend('Southern Ocean','North Atlantic','South Pacific','Tropical Atlantic','Indian Ocean','North Pacific')
ylabel('Water Mass Fraction')
box off;set(gca,'XColor','none')
set(gcf,'Position',[100 100 1000 400])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');
figure(2)
plot(-timec,squeeze(tsnanmean(iagectrace_cz(79:100,y-2:y+2,z,:),[1,2,3])),'k');hold on
plot(-timec,squeeze(tsnanmean(baage(79:100,y-2:y+2,z,:),[1,2,3])),'Color',cl(1,:));
plot(-timec,squeeze(tsnanmean(bpage(79:100,y-2:y+2,z,:),[1,2,3])),'Color',cl(3,:));
plot(-timec,squeeze(tsnanmean(bwpdc11(79:100,y-2:y+2,z,:),[1,2,3])),'-o','LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc22(79:100,y-2:y+2,z,:),[1,2,3])),'--','LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc33(79:100,y-2:y+2,z,:),[1,2,3])),'-*','MarkerIndices', 1:8:220,'MarkerSize',20,'LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc44(79:100,y-2:y+2,z,:),[1,2,3])),'-^','MarkerIndices', 1:5:220,'MarkerSize',20,'LineWidth',2,'Color','r');
legend('Iage','B-A age','B-P age','\tau_{BwP1}','\tau_{BwP2}','\tau_{BwP3}','\tau_{BwP4}')
box off;%set(gca,'XColor','none')
set(gcf,'Position',[100 100 1000 400])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');ylabel('Age (a)')
%% remote source, y:bwp and iage dif, 1km below?
%19.1-19ka LGM,14ka?
t1 = fcn(-19.1, timec);t2 = fcn(-19, timec);
dif=abs(iagectrace_cz-bwpdc33)./(iagectrace_cz);
dif(abs(dif)>100)=nan;
close all;clc
contourf(yic(1:90),depthc(40:end),squeeze(tsnanmean(dif(79:100,1:90,40:end,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 1])
title('Atlantic, LGM')
figure(11)
contourf(yic(1:90),depthc(1:40),squeeze(tsnanmean(dif(79:100,1:90,1:40,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 1])
title('Atlantic, LGM')
figure(2)
contourf(yic(1:90),depthc(40:end),squeeze(tsnanmean(dif(35:68,1:90,40:end,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 1])
title('Pacific, LGM')
figure(22)
contourf(yic(1:90),depthc(1:40),squeeze(tsnanmean(dif(35:68,1:90,1:40,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 1])
title('Pacific, LGM')
%% remote source, y:bwp and iage dif, 1km below?
% 16ka
t1 = fcn(-16.3, timec);t2 = fcn(-15.7, timec);
dif=abs(iagectrace_cz-bwpdc33)./(iagectrace_cz);
dif(abs(dif)>100)=nan;
close all;clc
contourf(yic(1:90),depthc(40:end),squeeze(tsnanmean(dif(79:100,1:90,40:end,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 1])
title('Atlantic, 16ka')
figure(11)
contourf(yic(1:90),depthc(1:40),squeeze(tsnanmean(dif(79:100,1:90,1:40,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 1])
title('Atlantic, 16ka')
figure(2)
contourf(yic(1:90),depthc(40:end),squeeze(tsnanmean(dif(35:68,1:90,40:end,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 1])
title('Pacific, 16ka')
figure(22)
contourf(yic(1:90),depthc(1:40),squeeze(tsnanmean(dif(35:68,1:90,1:40,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 1])
title('Pacific, 16ka')
%% scatter
close all;clc
% atlantic below 1000m
d1=reshape(dye_s_cz(79:100,1:90,40:end,:),[],1);
d2=reshape(dif(79:100,1:90,40:end,:),[],1);
random_indices = randperm(prod(size(d1)), 5000);
scatter(d1(random_indices),d2(random_indices))
set(gca,'YLim',[0 5])
ylabel('(BwP-Iage)/Iage');xlabel('Fraction of Southern Ocean')
title('Atlantic below 1000m')
%% scatter pacific below 1000m
close all;clc
d1=reshape(dye_s_cz(35:68,1:90,40:end,:),[],1);
d2=reshape(dif(35:68,1:90,40:end,:),[],1);
random_indices = randperm(prod(size(d1)), 5000);
scatter(d1(random_indices),d2(random_indices))
set(gca,'YLim',[0 5])
ylabel('(BwP-Iage)/Iage');xlabel('Fraction of Southern Ocean')
title('Pacific below 1000m')
%% scatter 16ka
close all;clc
% atlantic below 1000m
t=fcn(-16,timec);
d1=reshape(dye_s_cz(79:100,1:90,40:end,t-5:t+5),[],1);
d2=reshape(dif(79:100,1:90,40:end,t-5:t+5),[],1);
random_indices = randperm(prod(size(d1)), 5000);
scatter(d1(random_indices),d2(random_indices))
set(gca,'YLim',[0 1])
ylabel('(BwP-Iage)/Iage');xlabel('Fraction of Southern Ocean')
title('Atlantic below 1000m, 16ka')
%% scatter pacific below 1000m 16ka
close all;clc
t=fcn(-16,timec);
d1=reshape(dye_s_cz(35:68,1:90,40:end,t-5:t+5),[],1);
d2=reshape(dif(35:68,1:90,40:end,t-5:t+5),[],1);
random_indices = randperm(prod(size(d1)), 5000);
scatter(d1(random_indices),d2(random_indices))
set(gca,'YLim',[0 5])
ylabel('(BwP-Iage)/Iage');xlabel('Fraction of Southern Ocean')
title('Pacific below 1000m, 16ka')
%% Iage atlantic
% 16ka 
t1 = fcn(-16.3, timec);t2 = fcn(-15.7, timec);
dif=abs(iagectrace_cz-bwpdc33)./(iagectrace_cz);
dif(abs(dif)>100)=nan;
close all;clc
contourf(yic(1:90),depthc,squeeze(tsnanmean(iagectrace_cz(79:100,1:90,:,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 2000])
title('Atlantic Iage, 16ka')
figure(11)
contourf(yic(1:90),depthc,squeeze(tsnanmean(bwpdc33(79:100,1:90,:,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 2000])
title('Atlantic BwP age, 16ka')
%% Iage Pacific
% 16ka 
t1 = fcn(-16.3, timec);t2 = fcn(-15.7, timec);
dif=abs(iagectrace_cz-bwpdc33)./(iagectrace_cz);
dif(abs(dif)>100)=nan;
close all;clc
contourf(yic(1:90),depthc,squeeze(tsnanmean(iagectrace_cz(35:68,1:90,:,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 2000])
title('Pacific Iage, 16ka')
figure(11)
contourf(yic(1:90),depthc,squeeze(tsnanmean(bwpdc33(35:68,1:90,:,t1:t2),[1,4]))',50)
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/cosam.txt');
colormap(cb);
colorbar;set(gca,'YDir','reverse')
caxis([0 2000])
title('Pacific BwP age, 16ka')







