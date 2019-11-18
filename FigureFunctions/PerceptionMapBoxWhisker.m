function [MapStats, MapStatsExtra]=PerceptionMapBoxWhisker(results, params)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

poster_colors;
colorOrder=[p_red;  p_orange;p_fade_green; p_fade_blue; p_plum; p_green; p_blue; p_fade_red; p_lime; p_yellow; [0 0 0]; p_red; p_orange; p_fade_green; p_fade_blue; p_plum];

GRP={'ShortSlow', 'ShortFast','MidSlow', 'MidFast','LongSlow', 'LongFast'};

slow=find(strcmp('stepLengthSlow', fields(results.ErrorBMapShort.indiv)));
fast=find(strcmp('stepLengthFast', fields(results.ErrorBMapShort.indiv)));


xx=[results.BaselineMapShort.avg([2 4 6], slow)';...
    results.BaselineMapShort.avg([2 4 6], fast)';...
    results.BaselineMapMid.avg([2 4 6], slow)';...
    results.BaselineMapMid.avg([2 4 6], fast)';...
    results.BaselineMapLong.avg([2 4 6], slow)';...
    results.BaselineMapLong.avg([2 4 6], fast)'];
xxSE=[results.BaselineMapShort.se([2 4 6], slow)';...
    results.BaselineMapShort.se([2 4 6], fast)';...
    results.BaselineMapMid.se([2 4 6], slow)';...
    results.BaselineMapMid.se([2 4 6], fast)';...
    results.BaselineMapLong.se([2 4 6], slow)';...
    results.BaselineMapLong.se([2 4 6], fast)'];

xxW=[results.WashoutMapShort.avg([2 4 6], slow)';...
    results.WashoutMapShort.avg([2 4 6], fast)';...
    results.WashoutMapMid.avg([2 4 6], slow)';...
    results.WashoutMapMid.avg([2 4 6], fast)';...
    results.WashoutMapLong.avg([2 4 6], slow)';...
    results.WashoutMapLong.avg([2 4 6], fast)'];
xxWSE=[results.WashoutMapShort.se([2 4 6], slow)';...
    results.WashoutMapShort.se([2 4 6], fast)';...
    results.WashoutMapMid.se([2 4 6], slow)';...
    results.WashoutMapMid.se([2 4 6], fast)';...
    results.WashoutMapLong.se([2 4 6], slow)';...
    results.WashoutMapLong.se([2 4 6], fast)'];

figure;
%%
subplot(1, 2, 1);%This is for the slow leg only
patch([0 21 21 0 0],  [-10 -10 10 10 -10], [.9 .9 .9], 'EdgeColor', 'none'); hold on
patch([0 21 21 0 0],  [50 50 70 70 50], [.9 .9 .9], 'EdgeColor', 'none'); hold on
patch([0 21 21 0 0],  [-70 -70 -50 -50 -70], [.9 .9 .9], 'EdgeColor', 'none'); hold on
plot([0 21], [0 0], 'k')
plot([0 21], [60 60], ':k')
plot([0 21], [-60 -60], ':k')

% Short Target
errorbar([1], xx(1, 1), xxSE(1, 1), 'k^', 'MarkerFaceColor', colorOrder(1, :), 'MarkerSize', 15 ); hold on
errorbar([3], xx(1, 2), xxSE(1, 2), 'k^', 'MarkerFaceColor', colorOrder(2, :), 'MarkerSize', 15 ); hold on
errorbar([5], xx(1, 3), xxSE(1, 3), 'k^', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15 ); hold on

errorbar([2], xxW(1, 1), xxWSE(1, 1), 'ko', 'MarkerFaceColor',  colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([4], xxW(1, 2), xxWSE(1, 2), 'ko', 'MarkerFaceColor',colorOrder(2, :), 'MarkerSize', 15 ); hold on
errorbar([6], xxW(1, 3), xxWSE(1, 3), 'ko', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

% Mid Target
errorbar([8], xx(3, 1), xxSE(3, 1), 'k^', 'MarkerFaceColor',  colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([10], xx(3, 2), xxSE(3, 2), 'k^', 'MarkerFaceColor', colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([12], xx(3, 3), xxSE(3, 3), 'k^', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

errorbar([9], xxW(3, 1), xxWSE(3, 1), 'ko', 'MarkerFaceColor', colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([11], xxW(3, 2), xxWSE(3, 2), 'ko', 'MarkerFaceColor',  colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([13], xxW(3, 3), xxWSE(3, 3), 'ko', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

% Long Target
errorbar([15], xx(5, 1), xxSE(5, 1), 'k^', 'MarkerFaceColor',  colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([17], xx(5, 2), xxSE(5, 2), 'k^', 'MarkerFaceColor', colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([19], xx(5, 3), xxSE(5, 3), 'k^', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

errorbar([16], xxW(5, 1), xxWSE(5, 1), 'ko', 'MarkerFaceColor', colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([18], xxW(5, 2), xxWSE(5, 2), 'ko', 'MarkerFaceColor',  colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([20], xxW(5, 3), xxWSE(5, 3), 'ko', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

xlim([0 21])
ylim([-85 85])
title('Slow Leg', 'Color', 'b')
ylabel('Map Test: Step Length (mm) relative to Mid')
%%
subplot(1, 2, 2);%This is for the Fast leg only
patch([0 21 21 0 0],  [-10 -10 10 10 -10], [.9 .9 .9], 'EdgeColor', 'none'); hold on
patch([0 21 21 0 0],  [50 50 70 70 50], [.9 .9 .9], 'EdgeColor', 'none'); hold on
patch([0 21 21 0 0],  [-70 -70 -50 -50 -70], [.9 .9 .9], 'EdgeColor', 'none'); hold on
plot([0 21], [0 0], 'k')
plot([0 21], [60 60], ':k')
plot([0 21], [-60 -60], ':k')

% Short Target
errorbar([1], xx(2, 1), xxSE(2, 1), 'k^', 'MarkerFaceColor',  colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([3], xx(2, 2), xxSE(2, 2), 'k^', 'MarkerFaceColor', colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([5], xx(2, 3), xxSE(2, 3), 'k^', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

errorbar([2], xxW(2, 1), xxWSE(2, 1), 'ko', 'MarkerFaceColor', colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([4], xxW(2, 2), xxWSE(2, 2), 'ko', 'MarkerFaceColor',  colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([6], xxW(2, 3), xxWSE(2, 3), 'ko', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

% Mid Target
errorbar([8], xx(4, 1), xxSE(4, 1), 'k^', 'MarkerFaceColor',  colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([10], xx(4, 2), xxSE(4, 2), 'k^', 'MarkerFaceColor', colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([12], xx(4, 3), xxSE(4, 3), 'k^', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

errorbar([9], xxW(4, 1), xxWSE(4, 1), 'ko', 'MarkerFaceColor', colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([11], xxW(4, 2), xxWSE(4, 2), 'ko', 'MarkerFaceColor', colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([13], xxW(4, 3), xxWSE(4, 3), 'ko', 'MarkerFaceColor',colorOrder(3, :), 'MarkerSize', 15); hold on

% Long Target
errorbar([15], xx(6, 1), xxSE(6, 1), 'k^', 'MarkerFaceColor',  colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([17], xx(6, 2), xxSE(6, 2), 'k^', 'MarkerFaceColor', colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([19], xx(6, 3), xxSE(6, 3), 'k^', 'MarkerFaceColor',  colorOrder(3, :), 'MarkerSize', 15); hold on

errorbar([16], xxW(6, 1), xxWSE(6, 1), 'ko', 'MarkerFaceColor',  colorOrder(1, :), 'MarkerSize', 15); hold on
errorbar([18], xxW(6, 2), xxWSE(6, 2), 'ko', 'MarkerFaceColor',  colorOrder(2, :), 'MarkerSize', 15); hold on
errorbar([20], xxW(6, 3), xxWSE(6, 3), 'ko', 'MarkerFaceColor', colorOrder(3, :), 'MarkerSize', 15); hold on

xlim([0 21])
ylim([-85 85])
title('Fast Leg', 'Color', 'r')
ylabel('Map Test: Step Length (mm) relative to Mid')

%% Pretty
fh=gcf;
ah=findobj(fh,'Type','Axes');
topRow=[ah(1).YLim; ah(2).YLim];
set(ah([1 2]),'Ylim',[min(topRow(:, 1)) max(topRow(:, 2))]);

set(gcf,'Renderer','painters');

%% New 2/14/2019 -- Happy Valentines Day
G1C=find(results.BaselineMapShort.indiv.stepLengthSlow(:,1) ==1);
G1=find(results.BaselineMapShort.indiv.stepLengthSlow(:,1) == 2);
G2C=find(results.BaselineMapShort.indiv.stepLengthSlow(:,1) ==3);
G2=find(results.BaselineMapShort.indiv.stepLengthSlow(:,1) == 4);
G3C=find(results.BaselineMapShort.indiv.stepLengthSlow(:,1) ==5);
G3=find(results.BaselineMapShort.indiv.stepLengthSlow(:,1) == 6);

% MapStats= [repmat([ones(9,1); 2.*ones(9,1); 3.*ones(9, 1)], 4, 1), ... %Group
%      [repmat([1:27]', 4,1)],...%ID
%      [ones(27, 1); 2.*ones(27, 1);ones(27, 1); 2.*ones(27, 1)],...%Session
%      [ones(54, 1); 2.*ones(54, 1)],...% epoch
%      [results.BaselineMapShort.indiv.stepLengthSlow(G1C,2); results.BaselineMapMid.indiv.stepLengthSlow(G2C,2); results.BaselineMapLong.indiv.stepLengthSlow(G3C,2);... %Baseline Slow leg:Control
%       results.BaselineMapShort.indiv.stepLengthSlow(G1C,2); results.BaselineMapMid.indiv.stepLengthSlow(G2C,2); results.BaselineMapLong.indiv.stepLengthSlow(G3C,2);... %Baseline Slow leg:Split
%     results.WashoutMapShort.indiv.stepLengthSlow(G1C,2); results.WashoutMapMid.indiv.stepLengthSlow(G2C,2); results.WashoutMapLong.indiv.stepLengthSlow(G3C,2);... %Washout Slow leg:Control
%      results.WashoutMapShort.indiv.stepLengthSlow(G1,2); results.WashoutMapMid.indiv.stepLengthSlow(G2,2); results.WashoutMapLong.indiv.stepLengthSlow(G3,2)],...%Washout Slow leg:Split
%           [results.BaselineMapShort.indiv.stepLengthFast(G1C,2); results.BaselineMapMid.indiv.stepLengthFast(G2C,2); results.BaselineMapLong.indiv.stepLengthFast(G3C,2);... %Baseline Fast leg:Control
%       results.BaselineMapShort.indiv.stepLengthFast(G1C,2); results.BaselineMapMid.indiv.stepLengthFast(G2C,2); results.BaselineMapLong.indiv.stepLengthFast(G3C,2);... %Baseline Fast leg:Split
%     results.WashoutMapShort.indiv.stepLengthFast(G1C,2); results.WashoutMapMid.indiv.stepLengthFast(G2C,2); results.WashoutMapLong.indiv.stepLengthFast(G3C,2);... %Washout Fast leg:Control
%      results.WashoutMapShort.indiv.stepLengthFast(G1,2); results.WashoutMapMid.indiv.stepLengthFast(G2,2); results.WashoutMapLong.indiv.stepLengthFast(G3,2)],...%Washout Fast leg:Split
%      [results.BaselineMapShort.indiv.stepLengthSlow(G1C,2); results.BaselineMapMid.indiv.stepLengthSlow(G2C,2); results.BaselineMapLong.indiv.stepLengthSlow(G3C,2);... %Baseline Slow leg:Control
%       results.BaselineMapShort.indiv.stepLengthSlow(G1C,2); results.BaselineMapMid.indiv.stepLengthSlow(G2C,2); results.BaselineMapLong.indiv.stepLengthSlow(G3C,2); NaN.*(ones(54, 1))],... %Baseline Slow leg:Split
%       [results.BaselineMapShort.indiv.stepLengthFast(G1C,2); results.BaselineMapMid.indiv.stepLengthFast(G2C,2); results.BaselineMapLong.indiv.stepLengthFast(G3C,2);... %Baseline Fast leg:Control
%       results.BaselineMapShort.indiv.stepLengthFast(G1C,2); results.BaselineMapMid.indiv.stepLengthFast(G2C,2); results.BaselineMapLong.indiv.stepLengthFast(G3C,2); NaN.*(ones(54, 1))]];%


% % % % MapStats=[repmat([ones(9,1); 2.*ones(9,1); 3.*ones(9, 1)], 2, 1), ... %Group
% % % %     [repmat([1:27]', 2,1)],...%ID
% % % %     [ones(27, 1); 2.*ones(27, 1)],...%Epoch
% % % %     [ones(27, 1); 2.*ones(27, 1)],...%Session
% % % %     [ones(27, 1); 2.*ones(27, 1)],...%Leg
% % % %     [results.BaselineMapShort.indiv.stepLengthSlow(G1C,2); results.BaselineMapMid.indiv.stepLengthSlow(G2C,2); results.BaselineMapLong.indiv.stepLengthSlow(G3C,2);... %By Leg: Slow Leg: Baseline: Tied --> Split
% % % %     results.BaselineMapShort.indiv.stepLengthSlow(G1,2); results.BaselineMapMid.indiv.stepLengthSlow(G2,2); results.BaselineMapLong.indiv.stepLengthSlow(G3,2)],...
% % % %     [results.BaselineMapShort.indiv.stepLengthFast(G1C,2); results.BaselineMapMid.indiv.stepLengthFast(G2C,2); results.BaselineMapLong.indiv.stepLengthFast(G3C,2);... %By Leg: Fast Leg: Baseline: Tied --> Split
% % % %     results.BaselineMapShort.indiv.stepLengthFast(G1,2); results.BaselineMapMid.indiv.stepLengthFast(G2,2); results.BaselineMapLong.indiv.stepLengthFast(G3,2)],....
% % % %     [results.WashoutMapShort.indiv.stepLengthSlow(G1C,2); results.WashoutMapMid.indiv.stepLengthSlow(G2C,2); results.WashoutMapLong.indiv.stepLengthSlow(G3C,2);... %By Leg: Slow Leg: Washout: Tied --> Split
% % % %     results.WashoutMapShort.indiv.stepLengthSlow(G1,2); results.WashoutMapMid.indiv.stepLengthSlow(G2,2); results.WashoutMapLong.indiv.stepLengthSlow(G3,2)],...
% % % %     [results.WashoutMapShort.indiv.stepLengthFast(G1C,2); results.WashoutMapMid.indiv.stepLengthFast(G2C,2); results.WashoutMapLong.indiv.stepLengthFast(G3C,2);... %By Leg: Fast Leg: Washout: Tied --> Split
% % % %     results.WashoutMapShort.indiv.stepLengthFast(G1,2); results.WashoutMapMid.indiv.stepLengthFast(G2,2); results.WashoutMapLong.indiv.stepLengthFast(G3,2)],...
% % % %     [results.BaselineMapShort.indiv.stepLengthSlow(G1C,2); results.BaselineMapMid.indiv.stepLengthSlow(G2C,2); results.BaselineMapLong.indiv.stepLengthSlow(G3C,2);...%By Session: Tied : Slow: Base --> Wash
% % % %     results.WashoutMapShort.indiv.stepLengthSlow(G1C,2); results.WashoutMapMid.indiv.stepLengthSlow(G2C,2); results.WashoutMapLong.indiv.stepLengthSlow(G3C,2)],...
% % % %     [results.BaselineMapShort.indiv.stepLengthFast(G1C,2); results.BaselineMapMid.indiv.stepLengthFast(G2C,2); results.BaselineMapLong.indiv.stepLengthFast(G3C,2);...%By Session: Tied : FAst: Base --> Wash
% % % %     results.WashoutMapShort.indiv.stepLengthFast(G1C,2); results.WashoutMapMid.indiv.stepLengthFast(G2C,2); results.WashoutMapLong.indiv.stepLengthFast(G3C,2)],...
% % % %     [results.BaselineMapShort.indiv.stepLengthSlow(G1,2); results.BaselineMapMid.indiv.stepLengthSlow(G2,2); results.BaselineMapLong.indiv.stepLengthSlow(G3,2);...%By Session: Split : Slow: Base --> Wash
% % % %     results.WashoutMapShort.indiv.stepLengthSlow(G1,2); results.WashoutMapMid.indiv.stepLengthSlow(G2,2); results.WashoutMapLong.indiv.stepLengthSlow(G3,2)],...
% % % %     [results.BaselineMapShort.indiv.stepLengthFast(G1,2); results.BaselineMapMid.indiv.stepLengthFast(G2,2); results.BaselineMapLong.indiv.stepLengthFast(G3,2);...%By Session: Split : FAst: Base --> Wash
% % % %     results.WashoutMapShort.indiv.stepLengthFast(G1,2); results.WashoutMapMid.indiv.stepLengthFast(G2,2); results.WashoutMapLong.indiv.stepLengthFast(G3,2)]];   
      

MapStats=[repmat([ones(9,1); 2.*ones(9,1); 3.*ones(9, 1)], 2, 1), ... %Group
    [repmat([1:27]', 2,1)],...%ID
    [ones(27, 1); 2.*ones(27, 1)],...%Epoch
    [ones(27, 1); 2.*ones(27, 1)],...%Session
    [ones(27, 1); 2.*ones(27, 1)],...%Leg
    [results.BaselineMapShort.indiv.stepLengthSlow(G1C,2); results.BaselineMapMid.indiv.stepLengthSlow(G2C,2); results.BaselineMapLong.indiv.stepLengthSlow(G3C,2);... %By Leg: Slow Leg: Baseline: Tied --> Split
    results.BaselineMapShort.indiv.stepLengthSlow(G1,2); results.BaselineMapMid.indiv.stepLengthSlow(G2,2); results.BaselineMapLong.indiv.stepLengthSlow(G3,2)],...
    [results.BaselineMapShort.indiv.stepLengthFast(G1C,2); results.BaselineMapMid.indiv.stepLengthFast(G2C,2); results.BaselineMapLong.indiv.stepLengthFast(G3C,2);... %By Leg: Fast Leg: Baseline: Tied --> Split
    results.BaselineMapShort.indiv.stepLengthFast(G1,2); results.BaselineMapMid.indiv.stepLengthFast(G2,2); results.BaselineMapLong.indiv.stepLengthFast(G3,2)],....
    [results.WashoutMapShort.indiv.stepLengthSlow(G1C,2); results.WashoutMapMid.indiv.stepLengthSlow(G2C,2); results.WashoutMapLong.indiv.stepLengthSlow(G3C,2);... %By Leg: Slow Leg: Washout: Tied --> Split
    results.WashoutMapShort.indiv.stepLengthSlow(G1,2); results.WashoutMapMid.indiv.stepLengthSlow(G2,2); results.WashoutMapLong.indiv.stepLengthSlow(G3,2)],...
    [results.WashoutMapShort.indiv.stepLengthFast(G1C,2); results.WashoutMapMid.indiv.stepLengthFast(G2C,2); results.WashoutMapLong.indiv.stepLengthFast(G3C,2);... %By Leg: Fast Leg: Washout: Tied --> Split
    results.WashoutMapShort.indiv.stepLengthFast(G1,2); results.WashoutMapMid.indiv.stepLengthFast(G2,2); results.WashoutMapLong.indiv.stepLengthFast(G3,2)],...
    [results.ErrorBMapShort.indiv.stepLengthSlow(G1C,2); results.ErrorBMapMid.indiv.stepLengthSlow(G2C,2); results.ErrorBMapLong.indiv.stepLengthSlow(G3C,2);...%By Session: Tied : Slow: Base --> Wash
    results.ErrorWMapShort.indiv.stepLengthSlow(G1C,2); results.ErrorWMapMid.indiv.stepLengthSlow(G2C,2); results.ErrorWMapLong.indiv.stepLengthSlow(G3C,2)],...
    [results.ErrorBMapShort.indiv.stepLengthFast(G1C,2); results.ErrorBMapMid.indiv.stepLengthFast(G2C,2); results.ErrorBMapLong.indiv.stepLengthFast(G3C,2);...%By Session: Tied : FAst: Base --> Wash
    results.ErrorWMapShort.indiv.stepLengthFast(G1C,2); results.ErrorWMapMid.indiv.stepLengthFast(G2C,2); results.ErrorWMapLong.indiv.stepLengthFast(G3C,2)],...
    [results.ErrorBMapShort.indiv.stepLengthSlow(G1,2); results.ErrorBMapMid.indiv.stepLengthSlow(G2,2); results.ErrorBMapLong.indiv.stepLengthSlow(G3,2);...%By Session: Split : Slow: Base --> Wash
    results.ErrorWMapShort.indiv.stepLengthSlow(G1,2); results.ErrorWMapMid.indiv.stepLengthSlow(G2,2); results.ErrorWMapLong.indiv.stepLengthSlow(G3,2)],...
    [results.ErrorBMapShort.indiv.stepLengthFast(G1,2); results.ErrorBMapMid.indiv.stepLengthFast(G2,2); results.ErrorBMapLong.indiv.stepLengthFast(G3,2);...%By Session: Split : FAst: Base --> Wash
    results.ErrorWMapShort.indiv.stepLengthFast(G1,2); results.ErrorWMapMid.indiv.stepLengthFast(G2,2); results.ErrorWMapLong.indiv.stepLengthFast(G3,2)]];   
    

MapStatsExtra=[[repmat([1:27]', 4,1)],...%ID
    repmat([ones(27, 1); 2.*ones(27, 1)], 2, 1),...% Session
    [ones(54, 1); 2.*ones(54, 1)], ...%Epoch
    [results.ErrorBMapShort.indiv.stepLengthSlow(G1C,2); results.ErrorBMapMid.indiv.stepLengthSlow(G2C,2); results.ErrorBMapLong.indiv.stepLengthSlow(G3C,2);... % Slow Leg: 
    results.ErrorBMapShort.indiv.stepLengthSlow(G1,2); results.ErrorBMapMid.indiv.stepLengthSlow(G2,2); results.ErrorBMapLong.indiv.stepLengthSlow(G3,2);...
    results.ErrorWMapShort.indiv.stepLengthSlow(G1C,2); results.ErrorWMapMid.indiv.stepLengthSlow(G2C,2); results.ErrorWMapLong.indiv.stepLengthSlow(G3C,2);...
    results.ErrorWMapShort.indiv.stepLengthSlow(G1,2); results.ErrorWMapMid.indiv.stepLengthSlow(G2,2); results.ErrorWMapLong.indiv.stepLengthSlow(G3,2)],...
    [results.ErrorBMapShort.indiv.stepLengthFast(G1C,2); results.ErrorBMapMid.indiv.stepLengthFast(G2C,2); results.ErrorBMapLong.indiv.stepLengthFast(G3C,2);... %Fast Leg
    results.ErrorBMapShort.indiv.stepLengthFast(G1,2); results.ErrorBMapMid.indiv.stepLengthFast(G2,2); results.ErrorBMapLong.indiv.stepLengthFast(G3,2);...
    results.ErrorWMapShort.indiv.stepLengthFast(G1C,2); results.ErrorWMapMid.indiv.stepLengthFast(G2C,2); results.ErrorWMapLong.indiv.stepLengthFast(G3C,2);... 
    results.ErrorWMapShort.indiv.stepLengthFast(G1,2); results.ErrorWMapMid.indiv.stepLengthFast(G2,2); results.ErrorWMapLong.indiv.stepLengthFast(G3,2)]];
end


