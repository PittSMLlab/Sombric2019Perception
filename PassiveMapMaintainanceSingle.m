function [MapStats]=PassiveMapMaintainanceSingle(RPP, r, c, p, param)
% Formerly GroupPSYCHOAnalysis_AnalogChoiceV7
poster_colors;
ColorOrder=[  p_plum; p_plum;p_plum];

ParamOrder=find(strcmp(fields(RPP.BaselineMap.indiv), param));

% % If you want to plot all 5 targets
% X=[-0.08 -.04 0 0.04 0.08];
% if ParamOrder==1
%     WhereParam=[1:5];
% else
%     WhereParam=[6:10];
% end

% If you want to plot all 3 targets
X=[-0.08  0  0.08];
if ParamOrder==1
    WhereParam=[1, 3, 5];
else
    WhereParam=[6, 8, 10];
end


subplot(r,c, p); hold on
errorbar(X-.015, [RPP.BaselineMap.avg(1, WhereParam)], [RPP.BaselineMap.se(2, WhereParam)], '^','Color', ColorOrder(1, :),'MarkerEdgeColor', ColorOrder(1, :), 'MarkerFaceColor', 'w', 'MarkerSize', 10,  'DisplayName', 'Control: Baseline'); hold on
%errorbar(X-.004, [RPP.WashoutMap.avg(1, WhereParam)], [RPP.WashoutMap.se(1, WhereParam)], 'o','Color', ColorOrder(2, :),'MarkerEdgeColor', ColorOrder(2, :), 'MarkerFaceColor', 'w', 'MarkerSize', 10,  'DisplayName', 'Control: PA')
errorbar(X, [RPP.BaselineMap.avg(2, WhereParam)], [RPP.BaselineMap.se(2, WhereParam)], '^','Color', ColorOrder(1, :),'MarkerEdgeColor', ColorOrder(1, :), 'MarkerFaceColor', ColorOrder(1, :), 'MarkerSize', 10,  'DisplayName', 'Gradual: Baseline')
errorbar(X+.015, [RPP.WashoutMap.avg(2, WhereParam)], [RPP.WashoutMap.se(2, WhereParam)], 'o','Color', ColorOrder(2, :),'MarkerEdgeColor', ColorOrder(2, :), 'MarkerFaceColor', ColorOrder(2, :), 'MarkerSize', 10,  'DisplayName', 'Gradual: PA')
line([-.1 .1], [0 0])
line([-.1 .1], [-.08 -.08])
line([-.1 .1], [.08 .08])
title(['Group Average: ' param] , 'FontSize', 20)
xlabel('SL Target (m)', 'FontSize', 20)
ylabel('Percieved SL', 'FontSize', 20)
ylim([-.09 0.09])
axis square

 set(gcf,'Renderer','painters');
 
 %% New 2/14/2019 -- Happy Valentines Day Matlab
 Extreme=find(RPP.BaselineMap.indiv.stepLengthSlow(:, 1)~=2);
 
 MapStats=[[repmat([1:8]', 6,1)],...%ID
     [ones(24, 1); 2.*ones(24, 1)],...%Session
     [RPP.BaselineMap.indiv.stepLengthSlow(:, 2); RPP.BaselineMap.indiv.stepLengthSlow(:, 3)], ... %Baseline Slow: and Epoch Specific
     [RPP.BaselineMap.indiv.stepLengthFast(:, 2); RPP.BaselineMap.indiv.stepLengthFast(:, 3)], ...%Baseline Fast: and Epoch Specific
     [repmat([1:8]', 4,1); NaN.*ones(16, 1)],...%ID
     [ones(8, 1); 2.*ones(8, 1); ones(8, 1); 2.*ones(8, 1); NaN.*ones(16, 1)],...%Target
     [ones(16, 1); 2.*ones(16, 1); NaN.*ones(16, 1)],...%Epoch
     [RPP.BaselineMap.indiv.stepLengthSlow( Extreme, 3);RPP.WashoutMap.indiv.stepLengthSlow( Extreme, 3); NaN.*ones(16, 1)], ... %Split Session: Slow: Baseline vs.WashoutMap 
     [RPP.BaselineMap.indiv.stepLengthFast( Extreme, 3);RPP.WashoutMap.indiv.stepLengthFast( Extreme, 3); NaN.*ones(16, 1)]];%, ...%Split Session: Fast: Baseline vs.WashoutMap 

 
%  MapStats=[[RPP.BaselineMap.indiv.stepLengthFast(:, 1); RPP.BaselineMap.indiv.stepLengthFast(:, 1); RPP.BaselineMap.indiv.stepLengthFast(:, 1); RPP.BaselineMap.indiv.stepLengthFast(:, 1)], ...% Target
%      [ones(24, 1); 2.*ones(24, 1);ones(24, 1); 2.*ones(24, 1)],... % Epoch
%      [ones(48, 1); 2.*ones(48, 1)],...% Session
%      [repmat([1:8]', 6,1);repmat([9:16]', 6,1)],...%FAKE ID
%      [RPP.BaselineMap.indiv.stepLengthFast(:, 2); RPP.WashoutMap.indiv.stepLengthFast(:, 2); RPP.BaselineMap.indiv.stepLengthFast(:, 3); RPP.WashoutMap.indiv.stepLengthFast(:, 3)], ... % Fast Step Length
%      [RPP.BaselineMap.indiv.stepLengthSlow(:, 2); RPP.WashoutMap.indiv.stepLengthSlow(:, 2); RPP.BaselineMap.indiv.stepLengthSlow(:, 3); RPP.WashoutMap.indiv.stepLengthSlow(:, 3)], ...% Slow Step Length
%      [RPP.BaselineMap.indiv.stepLengthFast(:, 1);RPP.BaselineMap.indiv.stepLengthFast(:, 1); NaN.*ones(48, 1)], ... %Targets : Session and Epoch Specific
%      [repmat([1:8]', 6,1); NaN.*ones(48, 1)],...%ID
%      [ones(24, 1); 2.*ones(24, 1); NaN.*ones(48, 1)],...%Session
%      [RPP.BaselineMap.indiv.stepLengthSlow(:, 2);RPP.BaselineMap.indiv.stepLengthSlow(:, 3); NaN.*ones(48, 1)], ... %Baseline Slow: and Epoch Specific
%      [RPP.BaselineMap.indiv.stepLengthFast(:, 2);RPP.BaselineMap.indiv.stepLengthFast(:, 3); NaN.*ones(48, 1)], ...%Baseline Fast: and Epoch Specific
%            [RPP.WashoutMap.indiv.stepLengthSlow(:, 2);RPP.WashoutMap.indiv.stepLengthSlow(:, 3); NaN.*ones(48, 1)], ... %WashoutMap Slow: and Epoch Specific
%       [RPP.WashoutMap.indiv.stepLengthFast(:, 2);RPP.WashoutMap.indiv.stepLengthFast(:, 3); NaN.*ones(48, 1)]];%, ...%WashoutMap Fast: and Epoch Specific
 
% % % %      [RPP.BaselineMap.indiv.stepLengthSlow(:, 2); NaN.*ones(72, 1)], ... %Baseline Slow Control: Session and Epoch Specific
% % % %      [RPP.BaselineMap.indiv.stepLengthFast(:, 2); NaN.*ones(72, 1)], ...%Baseline Fast Control: Session and Epoch Specific
% % % %      [RPP.WashoutMap.indiv.stepLengthSlow(:, 2); NaN.*ones(72, 1)], ...%Washout Slow Control: Session and Epoch Specific
% % % %      [RPP.WashoutMap.indiv.stepLengthFast(:, 2); NaN.*ones(72, 1)], ...%Washout Fast Control: Session and Epoch Specific
% % % %      [RPP.BaselineMap.indiv.stepLengthSlow(:, 3); NaN.*ones(72, 1)], ... %Baseline Slow Split: Session and Epoch Specific
% % % %      [RPP.BaselineMap.indiv.stepLengthFast(:, 3); NaN.*ones(72, 1)], ...%Baseline Fast Split: Session and Epoch Specific
% % % %      [RPP.WashoutMap.indiv.stepLengthSlow(:, 3); NaN.*ones(72, 1)], ...%Washout Slow Split: Session and Epoch Specific
% % % %      [RPP.WashoutMap.indiv.stepLengthFast(:, 3); NaN.*ones(72, 1)]];%Washout Fast Split: Session and Epoch Specific

