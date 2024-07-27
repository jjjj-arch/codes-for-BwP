%% gh02 details age profiles 
close all;clc
x=fcn(144.21,xic);y=fcn(42.23,yic);z=fcn(1212,depthc);
plot(-timec,squeeze(tsnanmean(iagectrace_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'k');hold on
plot(-timec,squeeze(tsnanmean(baage(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(1,:));
plot(-timec,squeeze(tsnanmean(bpage(x-4:x+4,y-4:y+4,z,:),[1,2,3])),'Color',cl(3,:));
plot(-timec,squeeze(tsnanmean(bwpdc11(x-4:x+4,y-4:y+4,z,:),[1,2,3])),'-o','LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc22(x-4:x+4,y-4:y+4,z,:),[1,2,3])),'--','LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc33(x-4:x+4,y-4:y+4,z,:),[1,2,3])),'-*','MarkerIndices', 1:8:220,'MarkerSize',20,'LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc44(x-4:x+4,y-4:y+4,z,:),[1,2,3])),'-^','MarkerIndices', 1:5:220,'MarkerSize',20,'LineWidth',2,'Color','r');
legend('Iage','B-A age','B-P age','\tau_{BwP1}','\tau_{BwP2}','\tau_{BwP3}','\tau_{BwP4}')
box off;set(gca,'XColor','none')
set(gcf,'Position',[100 100 1000 400])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');ylabel('Age (a)')
saveas(gcf,'1.png')
%% gh02 water mass fraction 
close all;clc
x=fcn(144.21,xic);y=fcn(42.23,yic);z=fcn(1212,depthc);
plot(-timec,squeeze(tsnanmean(dye_s_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(1,:));hold on
plot(-timec,squeeze(tsnanmean(dye_na_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(3,:));
plot(-timec,squeeze(tsnanmean(dye_sp_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(4,:));
plot(-timec,squeeze(tsnanmean(dye_ta_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(5,:));
plot(-timec,squeeze(tsnanmean(dye_i_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(6,:));
plot(-timec,squeeze(tsnanmean(dye_np_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color','r');
legend('Southern Ocean','North Atlantic','South Pacific','Tropical Atlantic','Indian Ocean','North Pacific')
ylabel('Water Mass Fraction')
box off;set(gca,'XColor','none')
set(gcf,'Position',[100 100 1000 400])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');
saveas(gcf,'2.png')
%% gh02 d14C evolution
close all;clc
plot(-timec,cs,'Color',cl(1,:));hold on
plot(-timec,cna,'Color',cl(3,:));plot(-timec,csp,'Color',cl(4,:));
plot(-timec,cast,'Color',cl(5,:));plot(-timec,ci,'Color',cl(6,:));plot(-timec,cnp,'Color','r');
legend('Southern Ocean','North Atlantic','South Pacific','Tropical Atlantic','Indian Ocean','North Pacific')
ylabel('Surface \Delta^{14}C Evolution','FontSize',25)
set(gcf,'Position',[100 100 1000 400])
box off;xlabel('ka')
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');
saveas(gcf,'3.png')
%% gh02 weighted radiocarbon
close all;clc
x=fcn(144.21,xic);y=fcn(42.23,yic);z=fcn(1212,depthc);
h_line1=plot(-timec,squeeze(tsnanmean(dye_s_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cs','Color',cl(1,:));hold on
h_line2=plot(-timec,squeeze(tsnanmean(dye_na_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cna','Color',cl(3,:));
h_line3=plot(-timec,squeeze(tsnanmean(dye_sp_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*csp','Color',cl(4,:));
h_line4=plot(-timec,squeeze(tsnanmean(dye_ta_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cast','Color',cl(5,:));
h_line5=plot(-timec,squeeze(tsnanmean(dye_i_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*ci','Color',cl(6,:));
h_line6=plot(-timec,squeeze(tsnanmean(dye_np_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cnp','Color','r');
data=[squeeze(tsnanmean(dye_s_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cs',...
    squeeze(tsnanmean(dye_na_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cna',...
    squeeze(tsnanmean(dye_sp_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*csp',...
    squeeze(tsnanmean(dye_ta_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cast',...
    squeeze(tsnanmean(dye_i_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*ci',...
    squeeze(tsnanmean(dye_np_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cnp'];
data=data';
for i=1:220
    d1=data(:,i);
    pj(i)=sum(d1);
    sd(i)=tsnanstd(d1);
end
%shadederrorbar(-timec, pj, sd,'Color', [0.7 0.7 0.7]);
h_line=plot(-timec, pj,'Color',[0.7 0.7 0.7]);    
h_line7=plot(-timec,squeeze(tsnanmean(d14cctrace_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'-.k');
h_line8=plot(-timec,squeeze(tsnanmean(d14cctrace_cz(x-2:x+2,y-2:y+2,1:10,:),[1,2,3])),'k');
h_lines = [h_line1, h_line2, h_line3, h_line4, h_line5, h_line6, h_line, h_line7, h_line8];
%legend(h_lines, 'Southern Ocean', 'North Atlantic', 'South Pacific', 'Tropical Atlantic', ...
 %   'Indian Ocean', 'North Pacific', 'Total Endmember', 'Benthic \Delta^{14}C', 'Local Surface \Delta^{14}C');
ylabel('Weighted Surface \Delta^{14}C','FontSize',25);
box off;set(gcf,'Position',[100 100 1000 400])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');
xlabel('ka')
saveas(gcf,'4.png')
%% w8709 age details 42.12(85) 	234.25(66) 2710(49:50) E Pacific
close all;clc
x=fcn(234.25,xic);y=fcn(42.12,yic);z=fcn(2710,depthc);
plot(-timec,squeeze(tsnanmean(iagectrace_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'k');hold on
plot(-timec,squeeze(tsnanmean(baage(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(1,:));
plot(-timec,squeeze(tsnanmean(bpage(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(3,:));
plot(-timec,squeeze(tsnanmean(bwpdc11(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'-o','LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc22(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'--','LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc33(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'-*','MarkerIndices', 1:8:220,'MarkerSize',20,'LineWidth',2,'Color','r');
plot(-timec,squeeze(tsnanmean(bwpdc44(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'-^','MarkerIndices', 1:5:220,'MarkerSize',20,'LineWidth',2,'Color','r');
%legend('Iage','B-A age','B-P age','\tau_{BwP1}','\tau_{BwP2}','\tau_{BwP3}','\tau_{BwP4}')
box off;set(gca,'XColor','none');set(gcf,'Position',[100 100 1000 400])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');ylabel('Age (a)')
saveas(gcf,'1.png')
%% w8709 water mass fraction
close all;clc
x=fcn(234.25,xic);y=fcn(42.12,yic);z=fcn(2710,depthc);
plot(-timec,squeeze(tsnanmean(dye_s_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(1,:));hold on
plot(-timec,squeeze(tsnanmean(dye_na_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(3,:));
plot(-timec,squeeze(tsnanmean(dye_sp_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(4,:));
plot(-timec,squeeze(tsnanmean(dye_ta_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(5,:));
plot(-timec,squeeze(tsnanmean(dye_i_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color',cl(6,:));
plot(-timec,squeeze(tsnanmean(dye_np_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'Color','r');
%legend('Southern Ocean','North Atlantic','South Pacific','Tropical Atlantic','Indian Ocean','North Pacific')
ylabel('Water Mass Fraction')
box off;set(gcf,'Position',[100 100 1000 400])
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');set(gca,'XColor','none')
saveas(gcf,'2.png')
%% w8709 dye*surface d14C
close all;clc
x=fcn(234.25,xic);y=fcn(42.12,yic);z=fcn(2710,depthc);
h_line1=plot(-timec,squeeze(tsnanmean(dye_s_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cs','Color',cl(1,:));hold on
h_line2=plot(-timec,squeeze(tsnanmean(dye_na_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cna','Color',cl(3,:));
h_line3=plot(-timec,squeeze(tsnanmean(dye_sp_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*csp','Color',cl(4,:));
h_line4=plot(-timec,squeeze(tsnanmean(dye_ta_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cast','Color',cl(5,:));
h_line5=plot(-timec,squeeze(tsnanmean(dye_i_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*ci','Color',cl(6,:));
h_line6=plot(-timec,squeeze(tsnanmean(dye_np_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cnp','Color','r');
data=[squeeze(tsnanmean(dye_s_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cs',...
    squeeze(tsnanmean(dye_na_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cna',...
    squeeze(tsnanmean(dye_sp_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*csp',...
    squeeze(tsnanmean(dye_ta_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cast',...
    squeeze(tsnanmean(dye_i_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*ci',...
    squeeze(tsnanmean(dye_np_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])).*cnp'];
data=data';
for i=1:220
    d1=data(:,i);
    pj(i)=sum(d1);
    sd(i)=std(d1);
end
%shadederrorbar(-timec, pj, sd,'Color', [0.7 0.7 0.7]);
h_line=plot(-timec, pj,'Color',[0.7 0.7 0.7]);    
h_line7=plot(-timec,squeeze(tsnanmean(d14cctrace_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3])),'-.k');
h_line8=plot(-timec,squeeze(tsnanmean(d14cctrace_cz(x-2:x+2,y-2:y+2,1:10,:),[1,2,3])),'k');
h_lines = [h_line1, h_line2, h_line3, h_line4, h_line5, h_line6, h_line, h_line7, h_line8];
lgd=legend(h_lines, 'Southern Ocean', 'North Atlantic', 'South Pacific', 'Tropical Atlantic', ...
   'Indian Ocean', 'North Pacific', 'Total Endmember', 'Benthic \Delta^{14}C', 'Local Surface \Delta^{14}C');
lgd.Location='eastoutside';
ylabel('Weighted Surface \Delta^{14}C','FontSize',25);
box off;xlabel('ka')
set(gca,'XLim',[0 21]);set(gca,'XDir','reverse');set(gcf,'Position',[100 100 1000 400])
saveas(gcf,'3.png')
%% DIC14_surface
clc
dye_s_upd=zeros(size(dye_s_cz));
%dye_s_upd(84:100,1:14,:,:)=1;%stdageupd: only weddal sea
%dye_s_upd=dye_s_cz;%entire SO
dye_s_upd=zeros(size(dye_s_cz));dye_s_upd(84:100,1:14,:,:)=1;dye_s_upd(51:56,1:8,:,:)=1;%stdageupd: ross sea(180-200E 70-80S)+weddal sea
dye_an_upd=zeros(size(dye_na_cz));
dye_an_upd(85:92,83:96,:,:)=1;
dye_i_upd=zeros(size(dye_i_cz));
dye_i_upd(15:29,28:35,:,:)=1;
dye_np_upd=zeros(size(dye_s_cz));%40-60N 140-160E this is Okhotsk Sea
dye_np_upd(40:46,83:97,:,:)=1;
dye_sp_upd=zeros(size(dye_s_cz));
dye_sp_upd(45:62,28:35,:,:)=1;
dye_ast_upd=zeros(size(dye_s_cz));
dye_ast_upd(85:90,28:35,:,:)=1;dye_ast_upd(82:90,79:83,:,:)=1;
% s_dc, np_ok, na, no special chosed area for other dye region(ast,sp,i
for t=1:220
    data1=squeeze(tsnanmean(dic14_cz(:,:,1:10,t),3));
    dic14_na(t)=tsnanmean(data1(find(abs(dye_an_upd(:,:,1,1)-1)<0.05)));
    dic14_s(t)=tsnanmean(data1(find(abs(dye_s_upd(:,:,1,1)-1)<0.05)));
    dic14_ta(t)=tsnanmean(data1(find(abs(dye_ast_upd(:,:,1,1)-1)<0.05)));
    dic14_np(t)=tsnanmean(data1(find(abs(dye_np_upd(:,:,1,1)-1)<0.05)));
    dic14_sp(t)=tsnanmean(data1(find(abs(dye_sp_upd(:,:,1,1)-1)<0.05)));
    dic14_i(t)=tsnanmean(data1(find(abs(dye_i_upd(:,:,1,1)-1)<0.05)));
end