%% Fugure 5: Dye Profiles, PI
close all;clc;
y = fcn(-20, moclat);y2 = fcn(70, yic);y22 = fcn(70, moclat);
figure(1)
contourf(yic(1:y2), depthc, squeeze(tsnanmean(tsnanmean(dye_s_cz(:, 1:y2, :, 210:end), 1), 4))', 'Showtext', 'off', 'Linestyle', 'none')
cb = textread('/Users/nico/Documents/MATLAB/MATLAB_NCLcolorbar/sunshine_9lev.txt');
colormap(cb);
caxis([0 1]);
% colorbar;
set(gca, 'YDir', 'reverse');
title('(a) Water Mass Fraction from SO','FontSize',40);
hold on;
[C, h] = contour(moclat(1:y22), mocz, squeeze(tsnanmean(mocctrace_round(1:y22, :, 1, 1, 210:end), 5))', 15, 'Showtext', 'on', 'Linecolor', 'k', 'LineWidth', 1.5);
h.LevelList = round(h.LevelList, 1);
clabel(C, h, 'FontSize', 15);
ylabel('Depth (m)')
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperSize', [1000 600]);
set(gcf, 'PaperPosition', [-10 -10 1000 600]);
saveas(gcf, '1.png')

figure(2)
contourf(yic(1:y2), depthc, squeeze(tsnanmean(tsnanmean(dye_na_cz(79:100, 1:y2, :, 210:end), 1), 4))', 'Showtext', 'off', 'Linestyle', 'none')
colormap(cb);
caxis([0 1]);
%colorbar;
set(gca, 'YDir', 'reverse');
title('(b) Water Mass Fraction from NA','FontSize',40);
hold on;
[C, h] = contour(moclat(y:y22), mocz, squeeze(tsnanmean(mocctrace_round(y:y22, :, 1, 2, 210:end), 5))', 15, 'Showtext', 'on', 'Linecolor', 'k', 'LineWidth', 1.5);
h.LevelList = round(h.LevelList, 1);
clabel(C, h, 'FontSize', 15);
set(gca, 'YTickLabel', {}); 
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperSize', [1000 600]);
set(gcf, 'PaperPosition', [-10 -10 1000 600]);
saveas(gcf, '2.png')

figure(3)
contourf(yic(1:y2), depthc, squeeze(tsnanmean(tsnanmean(dye_np_cz(35:68, 1:y2, :, 210:end), 1), 4))', 'Showtext', 'off', 'Linestyle', 'none')
colormap(cb);
caxis([0 1]);
colorbar;
set(gca, 'YDir', 'reverse');
title('(c) Water Mass Fraction from NP','FontSize',40);
hold on;
[C, h] = contour(moclat(y:y22), mocz, squeeze(tsnanmean(mocctrace_round(y:y22, :, 1, 1, 210:end), 5))' - squeeze(tsnanmean(mocctrace_round(y:y22, :, 1, 2, 210:end), 5))', 15, 'Showtext', 'on', 'Linecolor', 'k', 'LineWidth', 1.5);
h.LevelList = round(h.LevelList, 1);
clabel(C, h, 'FontSize', 15);
set(gca, 'YTickLabel', {}); 
set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'points');
set(gcf, 'PaperSize', [1000 600]);
set(gcf, 'PaperPosition', [-10 -10 1000 600]);
saveas(gcf, '3.png')
