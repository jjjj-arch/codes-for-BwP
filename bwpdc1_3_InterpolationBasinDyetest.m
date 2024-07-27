%% calculate bwp3
dye_s_upd=zeros(size(dye_s_cz));
%dye_s_upd=dye_s_cz;%entire SO
%dye_s_upd(84:100,1:14,:,:)=1;%stdageupd: only weddal sea
dye_s_upd(51:56,1:20,:,:)=1;%only ross
%dye_s_upd(84:100,1:14,:,:)=1;dye_s_upd(51:56,1:20,:,:)=1;%stdageupd: ross sea(180-200E 70-80S)+weddal sea,above
dye_an_upd=zeros(size(dye_na_cz));%42-60N 300-360E
dye_an_upd(85:92,83:96,:,:)=1;
dye_i_upd=zeros(size(dye_i_cz));
dye_i_upd(15:29,28:83,:,:)=1;
dye_np_upd=zeros(size(dye_s_cz));%35-40N 120-180E
dye_np_upd(34:51,79:83,:,:)=1;
dye_sp_upd=zeros(size(dye_s_cz));
dye_sp_upd(45:62,28:35,:,:)=1;
dye_ast_upd=zeros(size(dye_s_cz));%20 40N,300-360E
dye_ast_upd(85:90,69:83,:,:)=1;
%
for t=1:220
    data1=squeeze(tsnanmean(d14cctrace_cz(:,:,1:10,t),3));
    cna(t)=tsnanmean(data1(find(abs(dye_an_upd(:,:,1,1)-1)<0.05)));
    cs(t)=tsnanmean(data1(find(abs(dye_s_upd(:,:,1,1)-1)<0.05)));
    cast(t)=tsnanmean(data1(find(abs(dye_ast_upd(:,:,1,1)-1)<0.05)));
    cnp(t)=tsnanmean(data1(find(abs(dye_np_upd(:,:,1,1)-1)<0.05)));
    csp(t)=tsnanmean(data1(find(abs(dye_sp_upd(:,:,1,1)-1)<0.05)));
    ci(t)=tsnanmean(data1(find(abs(dye_i_upd(:,:,1,1)-1)<0.05)));
end
%
p=[];bwpdc11=[];
for t=1:220
for ceng=1:60
p(:,:,ceng,t)=dye_na_cz(:,:,ceng,t).*cna(t)+dye_s_cz(:,:,ceng,t).*cs(t)+dye_ta_cz(:,:,ceng,t).*cast(t)+...
    dye_np_cz(:,:,ceng,t).*cnp(t)+dye_sp_cz(:,:,ceng,t).*csp(t)+dye_i_cz(:,:,ceng,t).*ci(t);
stdd=squeeze(d14cctrace_cz(:,:,ceng,t));
bwpdc11(:,:,ceng,t)=-8033*log((stdd+1000)./(squeeze(p(:,:,ceng,t))+1000));
end
end
%%
bwpdc22=[];
for t=1:220
for ceng=1:60
    for i=1:100
        for j=1:116
            proj=round(bwpdc11(i,j,ceng,t)./100);t0=t-proj;if t0<0|t0==0|t0>t
                t0=t;
            end
            if isnan(proj)
                bwpdc22(i,j,ceng,t)=nan;
            else
           p(i,j,ceng,t)=(dye_na_cz(i,j,ceng,t)/2+dye_na_cz(i,j,ceng,t0)/2).*can(t0)+(dye_s_cz(i,j,ceng,t)+dye_s_cz(i,j,ceng,t0)).*cs(t0)./2+...
               (dye_ta_cz(i,j,ceng,t)+dye_ta_cz(i,j,ceng,t0)).*cast(t0)./2+...
    (dye_np_cz(i,j,ceng,t)+dye_np_cz(i,j,ceng,t0)).*cnp(t0)./2+(dye_sp_cz(i,j,ceng,t)+dye_sp_cz(i,j,ceng,t0)).*csp(t0)./2+...
    (dye_i_cz(i,j,ceng,t)+dye_i_cz(i,j,ceng,t0)).*ci(t0)./2;
stdd=d14cctrace_cz(i,j,ceng,t);
bwpdc22(i,j,ceng,t)=-8033*log((stdd+1000)./(p(i,j,ceng,t)+1000));
            end
        end
    end
end
end
bwpdc33=[];
for t=1:220
for ceng=1:60
    for i=1:100
        for j=1:116
            proj=round(bwpdc22(i,j,ceng,t)./100);t0=t-proj;if t0<0|t0==0|t0>220
                t0=t;
            end
            if isnan(proj)
                bwpdc33(i,j,ceng,t)=nan;
            else
           p(i,j,ceng,t)=(dye_na_cz(i,j,ceng,t)/2+dye_na_cz(i,j,ceng,t0)/2).*can(t0)+(dye_s_cz(i,j,ceng,t)+dye_s_cz(i,j,ceng,t0)).*cs(t0)./2+...
               (dye_ta_cz(i,j,ceng,t)+dye_ta_cz(i,j,ceng,t0)).*cast(t0)./2+...
    (dye_np_cz(i,j,ceng,t)+dye_np_cz(i,j,ceng,t0)).*cnp(t0)./2+(dye_sp_cz(i,j,ceng,t)+dye_sp_cz(i,j,ceng,t0)).*csp(t0)./2+...
    (dye_i_cz(i,j,ceng,t)+dye_i_cz(i,j,ceng,t0)).*ci(t0)./2;
stdd=d14cctrace_cz(i,j,ceng,t);
bwpdc33(i,j,ceng,t)=-8033*log((stdd+1000)./(p(i,j,ceng,t)+1000));
            end
        end
    end
end
end
%%
bwpdc44=[];
for t=1:220
for ceng=1:60
    for i=1:100
        for j=1:116
            proj=round(bwpdc33(i,j,ceng,t)./100);t0=t-proj;if t0<0|t0==0|t0>220
                t0=t;
            end
            if isnan(proj)
                bwpdc44(i,j,ceng,t)=nan;
            else
           p(i,j,ceng,t)=(dye_na_cz(i,j,ceng,t)/2+dye_na_cz(i,j,ceng,t0)/2).*can(t0)+(dye_s_cz(i,j,ceng,t)+dye_s_cz(i,j,ceng,t0)).*cs(t0)./2+...
               (dye_ta_cz(i,j,ceng,t)+dye_ta_cz(i,j,ceng,t0)).*cast(t0)./2+...
    (dye_np_cz(i,j,ceng,t)+dye_np_cz(i,j,ceng,t0)).*cnp(t0)./2+(dye_sp_cz(i,j,ceng,t)+dye_sp_cz(i,j,ceng,t0)).*csp(t0)./2+...
    (dye_i_cz(i,j,ceng,t)+dye_i_cz(i,j,ceng,t0)).*ci(t0)./2;
stdd=d14cctrace_cz(i,j,ceng,t);
bwpdc44(i,j,ceng,t)=-8033*log((stdd+1000)./(p(i,j,ceng,t)+1000));
            end
        end
    end
end
end
%% interpolation
uniform_depths = linspace(0, 5000, 60);
bwpdc33chazhi = nan(100, 116, 60, 220);
for t = 1:220
    for y = 1:116
        for x = 1:100
         
            bwpdc33chazhi(x, y, :, t) = interp1(depthc, squeeze(bwpdc33(x, y, :, t)), uniform_depths, 'linear', 'extrap');
        end
    end
end
%
uniform_depths = linspace(0, 5000, 60);
iagectrace_czchazhi = nan(100, 116, 60, 220);

for t = 1:220
    for y = 1:116
        for x = 1:100
            iagectrace_czchazhi(x, y, :, t) = interp1(depthc, squeeze(iagectrace_cz(x, y, :, t)), uniform_depths, 'linear', 'extrap');
        end
    end
end
%% global below 1km, weight interpolation ages, test the dye 
close all;clc
plot(timec,squeeze(tsnanmean(iagectrace_czchazhi(:,:,13:end,:),[1,2,3])),'k')
hold on
plot(timec,squeeze(tsnanmean(bwpdc33chazhi(:,:,13:end,:),[1,2,3])),'r')
plot(timec,squeeze(tsnanmean(dyeagelgm3chazhi(:,:,13:end,:),[1,2,3])),'g')
brownColor = [0.6471, 0.1647, 0.1647]; % RGB values for brown
plot(timec,squeeze(tsnanmean(dyeagepi3chazhi(:,:,13:end,:),[1,2,3])),'color',brownColor)
box off;set(gca,'XLim',[-21 0]);
ylabel('Ages (a)')
set(gca,'XColor','none')
%set(gcf, 'Units', 'normalized', 'Position', [0.1, 0.1, 0.8, 0.8/(16/9)]);
set(gcf,'Position',[100 100 1000 400])
saveas(gcf, '1.png');
%% Atlantic below 1km, weight interpolation ages, test the dye 
close all;clc
plot(timec,squeeze(tsnanmean(iagectrace_czchazhi(79:100,:,13:end,:),[1,2,3])),'k')
hold on
plot(timec,squeeze(tsnanmean(bwpdc33chazhi(79:100,:,13:end,:),[1,2,3])),'r','LineWidth', 6)
plot(timec,squeeze(tsnanmean(dyeagelgm3chazhi(79:100,:,13:end,:),[1,2,3])),'g')
brownColor = [0.6471, 0.1647, 0.1647]; % RGB values for brown
plot(timec,squeeze(tsnanmean(dyeagepi3chazhi(79:100,:,13:end,:),[1,2,3])),'color',brownColor)
box off;set(gca,'XLim',[-21 0]);
ylabel('Ages (a)')
set(gca,'XColor','none')
%set(gcf, 'Units', 'normalized', 'Position', [0.1, 0.1, 0.8, 0.8/(16/9)]);
set(gcf,'Position',[100 100 1000 400])
saveas(gcf, '2.png');
%% North Pacific below 1km, weight interpolation ages, test the dye 
close all;clc
figure(3)
plot(timec,squeeze(tsnanmean(iagectrace_czchazhi(35:70,58:end,13:end,:),[1,2,3])),'k')
hold on
plot(timec,squeeze(tsnanmean(bwpdc33chazhi(35:70,58:end,13:end,:),[1,2,3])),'r','LineWidth', 6)
plot(timec,squeeze(tsnanmean(dyeagelgm3chazhi(35:70,58:end,13:end,:),[1,2,3])),'g')
brownColor = [0.6471, 0.1647, 0.1647]; % RGB values for brown
plot(timec,squeeze(tsnanmean(dyeagepi3chazhi(35:70,58:end,13:end,:),[1,2,3])),'color',brownColor)
box off;set(gca,'XLim',[-21 0]);
ylabel('Ages (a)');xlabel('ka')
%set(gcf, 'Units', 'normalized', 'Position', [0.1, 0.1, 0.8, 0.8/(16/9)]);
set(gcf,'Position',[100 100 1000 400])
%legend('Iage','τ_{BwP3}','τ_{BwP3} with fixed LGM dye','τ_{BwP3} with fixed PI dye')
saveas(gcf, '3.png');
%% calculate the error Global
clc;close all
d1=squeeze(tsnanmean(iagectrace_czchazhi(:,:,13:end,:),[1,2,3]));
d2=squeeze(tsnanmean(bwpdc33chazhi(:,:,13:end,:),[1,2,3]));
d3=squeeze(tsnanmean(dyeagelgm3chazhi(:,:,13:end,:),[1,2,3]));
d4=squeeze(tsnanmean(dyeagepi3chazhi(:,:,13:end,:),[1,2,3]));
plot(timec,(d2-d1)./d1*100,'k');hold on
plot(timec,(d3-d1)./d1*100);plot(timec,(d4-d1)./d1*100);
plot([-21:1:0],0.*[-21:1:0],'--',Color=[0.6 0.6 0.6])
set(gca,'XLim',[-21 0]);box off
set(gca,'XColor','none')
ylabel('Bias from Iage (%)')
set(gcf,'Position',[100 100 1000 400])
saveas(gcf, '1.png');
%% calculate the error Atlantic
clc;close all
d1=squeeze(tsnanmean(iagectrace_czchazhi(79:100,:,13:end,:),[1,2,3]));
d2=squeeze(tsnanmean(bwpdc33chazhi(79:100,:,13:end,:),[1,2,3]));
d3=squeeze(tsnanmean(dyeagelgm3chazhi(79:100,:,13:end,:),[1,2,3]));
d4=squeeze(tsnanmean(dyeagepi3chazhi(79:100,:,13:end,:),[1,2,3]));
plot(timec,(d2-d1)./d1*100,'k');hold on
plot(timec,(d3-d1)./d1*100);plot(timec,(d4-d1)./d1*100);
plot([-21:1:0],0.*[-21:1:0],'--',Color=[0.6 0.6 0.6])
set(gca,'XLim',[-21 0]);box off
set(gca,'XColor','none')
ylabel('Bias from Iage (%)')
set(gcf,'Position',[100 100 1000 400])
saveas(gcf, '2.png');
%% calculate the error NP
clc;close all
d1=squeeze(tsnanmean(iagectrace_czchazhi(36:70,58:end,13:end,:),[1,2,3]));
d2=squeeze(tsnanmean(bwpdc33chazhi(36:70,58:end,13:end,:),[1,2,3]));
d3=squeeze(tsnanmean(dyeagelgm3chazhi(36:70,58:end,13:end,:),[1,2,3]));
d4=squeeze(tsnanmean(dyeagepi3chazhi(36:70,58:end,13:end,:),[1,2,3]));
plot(timec,(d2-d1)./d1*100,'k');hold on
plot(timec,(d3-d1)./d1*100);plot(timec,(d4-d1)./d1*100);
plot([-21:1:0],0.*[-21:1:0],'--',Color=[0.6 0.6 0.6])
set(gca,'XLim',[-21 0]);box off
ylabel('Bias from Iage (%)')
set(gcf,'Position',[100 100 1000 400])
xlabel('ka')
saveas(gcf, '3.png');






