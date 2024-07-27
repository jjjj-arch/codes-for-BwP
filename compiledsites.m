%% data set
close all;clc
common_x = linspace(0, 25, 100);
interp_w8709 = interp1(w8709(:,3)./1000,w8709(:,9), common_x, 'linear');
interp_odp887 = interp1(odp887(:,1)./1000,odp887(:,7), common_x, 'linear');
x=md022489(:,7);x(x>10000)=[];x1=md022489(:,7);x2=md022489(:,1);x2(x1>10000)=[];
interp_md02 = interp1(x2./1000,x, common_x, 'linear');
interp_ew0408 = interp1(ew(:,1)./1000,ew(:,7), common_x, 'linear');
d=vino(:,7);d(d<0)=nan;
interp_vino = interp1(vino(:,1)./1000,d, common_x, 'linear');

avg_y = tsnanmean([interp_w8709;interp_odp887;interp_md02;interp_ew0408;interp_vino], 1); 
std_y = tsnanstd([interp_w8709;interp_odp887;interp_md02;interp_ew0408;interp_vino], 0, 1); 
lower_bound = avg_y - std_y;
upper_bound = avg_y + std_y;
fill([common_x(10:90), fliplr(common_x(10:90))], ...
    [lower_bound(10:90), fliplr(upper_bound(10:90))], [0.8 0.8 0.8], 'FaceAlpha', 0.7, 'EdgeColor', 'none');hold on
h1=scatter(w8709(:,3)./1000,w8709(:,9),200,'o', 'LineWidth', 3);hold on
h2=scatter(odp887(:,1)./1000,odp887(:,7),200,'+', 'LineWidth', 3);
x=md022489(:,7);x(x>10000)=[];x1=md022489(:,7);x2=md022489(:,1);x2(x1>10000)=[];
h3=scatter(x2./1000,x,200,'d', 'LineWidth', 3);
h4=scatter(ew(:,1)./1000,ew(:,7),200,'*','LineWidth',3);
d=vino(:,7);d(d<0)=nan;
h5=scatter(vino(:,1)./1000,d,'s','LineWidth',3);
h6=plot(common_x, avg_y, 'LineWidth', 3,'Color',[0.5 0.5 0.5]);

x=fcn(234.25,xic);y=fcn(42.12,yic);z=fcn(2710,depthc);%w8709
d1=squeeze(tsnanmean(iagectrace_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d11=squeeze(tsnanmean(bpage(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d111=squeeze(tsnanmean(bwpdc33(x-2:x+2,y-2:y+2,z,:),[1,2,3]));

x=fcn(211.25,xic);y=fcn(54.62,yic);z=fcn(3647,depthc);%odp887
d2=squeeze(tsnanmean(iagectrace_cz(x-4:x+4,y-4:y+4,z,:),[1,2,3]));
d22=squeeze(tsnanmean(bpage(x-4:x+4,y-4:y+4,z,:),[1,2,3]));
d222=squeeze(tsnanmean(bwpdc33(x-4:x+4,y-4:y+4,z,:),[1,2,3]));

x=fcn(360-148.92,xic);y=fcn(54.39,yic);z=fcn(3640,depthc);%MD02
d3=squeeze(tsnanmean(iagectrace_cz(x-4:x+4,y-4:y+4,z,:),[1,2,3]));
d33=squeeze(tsnanmean(bpage(x-4:x+4,y-4:y+4,z,:),[1,2,3]));
d333=squeeze(tsnanmean(bwpdc33(x-4:x+4,y-4:y+4,z,:),[1,2,3]));

x=fcn(360-144.5,xic);y=fcn(58.77,yic);z=fcn(3680,depthc);%ew0408
d4=squeeze(tsnanmean(iagectrace_cz(x-5:x+5,y-10:y+5,z,:),[1,2,3]));
d44=squeeze(tsnanmean(bpage(x-5:x+5,y-5:y+5,z,:),[1,2,3]));
d444=squeeze(tsnanmean(bwpdc33(x-7:x+7,y-9:y+5,z,:),[1,2,3]));

x=fcn(167.7,xic);y=fcn(50.4,yic);z=fcn(3300,depthc);%VINO
d5=squeeze(tsnanmean(iagectrace_cz(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d55=squeeze(tsnanmean(bpage(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
d555=squeeze(tsnanmean(bwpdc33(x-2:x+2,y-2:y+2,z,:),[1,2,3]));
ylabel('Age (a)')
yyaxis right
h7=plot(-timec,(d1+d2+d3+d4+d5)./5);
h8=plot(-timec,(d11+d22+d33+d44+d55)./5);
h9=plot(-timec,(d111+d222+d333+d444+d555)./5);

legend([h1,h2,h3,h4,h5,h6,h7,h8,h9],{'W8709A-13PC (2710m)','ODP887 (3647m)','MD02-2489 (3640m)', ...
    'EW0408-87JC (3680m)','VINO 19-4 GGC-37 (3300m)','Averaged Data B-P age','Iage','Model B-P age','\tau_{BwP3}'})
ylabel('Age (a)')
xlabel('ka')
set(gcf,'Position',[100 100 1000 400])
set(gca,'XDir','reverse');set(gca,'XLim',[0 23])
saveas(gcf,'1.png')