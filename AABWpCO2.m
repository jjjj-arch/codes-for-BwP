%% (b) surface pCO2
d1=squeeze(tsnanmean(d14cctraceatm_cz(:,:,:),[1,2]));
close all;clc
yyaxis right
plot(timec,d1,'LineWidth',5,'Color','r')
ylabel('\Delta ^{14}C_{atm} (‰)','Color','r')
ax = gca;
ax.YAxis(2).Color = 'r';
yyaxis left
plot(timec,abiopco2,'LineWidth',5)
ylabel('pCO_2 (ppmv)')
set(gca,'XLim',[-21 0]);set(gca, 'XColor', 'none');
set(gcf,'Position',[100 100 1000 400])
saveas(gcf,'2.png')
%% (a) amoc and aabw (gmoc, definition)
close all;clc
yyaxis left
plot(timec,amoc_s,'LineWidth',5)
ylabel('AMOC (Sv)')
yyaxis right
plot(timec,aabw,'LineWidth',5,'Color','r')
ax = gca; 
ax.YAxis(2).Color = 'r'; 
ylabel('AABW (Sv)','Color','r')
set(gca,'XLim',[-21 0]);%set(gca, 'XColor', 'none');
box off
xlabel('ka')
set(gcf,'Position',[100 100 1000 400])
saveas(gcf,'1.png')
%%
abiopco2=squeeze(tsnanmean(abiopco2(:,:,:),[1,2]));
%% aabw 
y1=fcn(-80,moclat);y2=fcn(-20,moclat);z=fcn(2000,mocz);
d1=squeeze(mocctrace(y1:y2,z:end,1,1,1,:));
for i=1:220
    aabw(i)=abs(min(min(d1(:,:,i))));
end
close all;clc
plot(-timec,aabw)
set(gca,'XDir','reverse')