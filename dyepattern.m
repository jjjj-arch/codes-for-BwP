%% dye pattern
close all;clc
figure;
hold on;
load coastlines;latcoast=coastlat;long=coastlon;
long(long<0)=long(long<0)+360;long(abs(long)<2)=nan;
figure(1)
m_proj('Miller','lon',[0 360],'lat',[-87 90]);hold on
m_grid('linestyle','none','linewidth',1,'tickdir','out','xaxisloc','bottom','yaxisloc','left','fontsize',14); 
d1=squeeze(dye_na_cz(:,:,1,1)');
d1(d1<0.9)=nan;d1(d1>0.9)=1;
m_pcolor(xic,yic,d1)
red_colormap = [1 0 0];
colormap(red_colormap);
% atlantic_lat = [40 40 80 80];
% atlantic_lon = [260 360 360 260];
% m_patch(atlantic_lon, atlantic_lat, 'red', 'FaceAlpha', 1);
% atlantic_lat = [40 40 80 80];
% atlantic_lon = [0 20 20 0];
% m_patch(atlantic_lon, atlantic_lat, 'red', 'FaceAlpha', 1,'EdgeColor','none');
m_plot(long,latcoast,'k');
lon1=long;lon1(latcoast<-60)=[];
lat1=latcoast;lat1(latcoast<-60)=[];
m_patch(lon1,lat1,[0.7 0.7 0.7])
saveas(gcf,'1.png')
figure(2)
m_proj('Miller','lon',[0 360],'lat',[-87 90]);hold on
m_grid('linestyle','none','linewidth',1,'tickdir','out','xaxisloc','bottom','yaxisloc','left','fontsize',14); 
d1=squeeze(dye_ta_cz(:,:,1,1)');
d1(d1<0.9)=nan;d1(d1>0.9)=1;
m_pcolor(xic,yic,d1)
red_colormap = [1 0 0];
colormap(red_colormap);
% atlantic_lat = [0 0 40 40];
% atlantic_lon = [281 360 360 281];
% m_patch(atlantic_lon, atlantic_lat, 'red', 'FaceAlpha', 1,'EdgeColor','none');
% atlantic_lat = [12 12 40 40];
% atlantic_lon = [268 281 281 268];
% m_patch(atlantic_lon, atlantic_lat, 'red', 'FaceAlpha', 1,'EdgeColor','none');
% atlantic_lat = [-40 -40 0 0];
% atlantic_lon = [290 360 360 290];
% m_patch(atlantic_lon, atlantic_lat, 'red', 'FaceAlpha', 1,'EdgeColor','none');
m_plot(long,latcoast,'k');
lon1=long;lon1(latcoast<-60)=[];
lat1=latcoast;lat1(latcoast<-60)=[];
m_patch(lon1,lat1,[0.7 0.7 0.7])
saveas(gcf,'2.png')
figure(3)
m_proj('Miller','lon',[0 360],'lat',[-87 90]);hold on
m_grid('linestyle','none','linewidth',1,'tickdir','out','xaxisloc','bottom','yaxisloc','left','fontsize',14); 
d1=squeeze(dye_s_cz(:,:,1,1)');
d1(d1<0.9)=nan;d1(d1>0.9)=1;
m_pcolor(xic,yic,d1)
red_colormap = [1 0 0]; % RGB 值为 [1 0 0]
colormap(red_colormap);
m_plot(long,latcoast,'k');
lon1=long;lon1(latcoast<-60)=[];
lat1=latcoast;lat1(latcoast<-60)=[];
m_patch(lon1,lat1,[0.7 0.7 0.7])
saveas(gcf,'3.png')
figure(4)
m_proj('Miller','lon',[0 360],'lat',[-87 90]);hold on
m_grid('linestyle','none','linewidth',1,'tickdir','out','xaxisloc','bottom','yaxisloc','left','fontsize',14); 
d1=squeeze(dye_np_cz(:,:,1,1)');
d1(d1<0.9)=nan;d1(d1>0.9)=1;
m_pcolor(xic,yic,d1)
red_colormap = [1 0 0];
colormap(red_colormap);
m_plot(long,latcoast,'k');
lon1=long;lon1(latcoast<-60)=[];
lat1=latcoast;lat1(latcoast<-60)=[];
m_patch(lon1,lat1,[0.7 0.7 0.7])
saveas(gcf,'4.png')
figure(5)
m_proj('Miller','lon',[0 360],'lat',[-87 90]);hold on
m_grid('linestyle','none','linewidth',1,'tickdir','out','xaxisloc','bottom','yaxisloc','left','fontsize',14); 
d1=squeeze(dye_sp_cz(:,:,1,1)');
d1(d1<0.9)=nan;d1(d1>0.9)=1;
m_pcolor(xic,yic,d1)
red_colormap = [1 0 0];
colormap(red_colormap);
m_plot(long,latcoast,'k');
lon1=long;lon1(latcoast<-60)=[];
lat1=latcoast;lat1(latcoast<-60)=[];
m_patch(lon1,lat1,[0.7 0.7 0.7])
saveas(gcf,'5.png')
figure(6)
m_proj('Miller','lon',[0 360],'lat',[-87 90]);hold on
m_grid('linestyle','none','linewidth',1,'tickdir','out','xaxisloc','bottom','yaxisloc','left','fontsize',14); 
d1=squeeze(dye_i_cz(:,:,1,1)');
d1(d1<0.9)=nan;d1(d1>0.9)=1;
m_pcolor(xic,yic,d1)
red_colormap = [1 0 0];
colormap(red_colormap);
m_plot(long,latcoast,'k');
lon1=long;lon1(latcoast<-60)=[];
lat1=latcoast;lat1(latcoast<-60)=[];
m_patch(lon1,lat1,[0.7 0.7 0.7])
saveas(gcf,'6.png')
axis equal;
xlabel('Longitude');
ylabel('Latitude');
title('World Map with Specified Sea Area Colored Red');
legend('Coastlines', 'Atlantic Ocean', 'Location', 'best');
hold off;

