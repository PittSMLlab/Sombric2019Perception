%% Perception Study -- Publication Reproducibility

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Active Perception Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc

load('NormalizedStudyData.mat')
load('R_Active.mat')

%% After-Effects Figure -- Step Lengths
params = {'stepLengthSlow', 'stepLengthFast'}; 
groups = {'PerceptionControl', 'PerceptionAbrupt',...
    'PerceptionControlLong', 'PerceptionAbruptLong',...
    'PerceptionControlSlowShort', 'PerceptionAbruptSlowShort'};
epochs={'NormBFAfter1','Catch', 'NormECm', 'EarlyWash'};
ActivePerceptionFigure(NormalizedStudyData,params,groups, R_Active, epochs)


params = {'netContributionNorm2', 'netContributionNorm2'}; 
epochs={'NormBFAfter1','Catch', 'NormECm', 'EarlyWash'};
ActivePerceptionFigure(NormalizedStudyData,params,groups, R_Active, epochs)


%% Map Results
params = {'stepLengthSlow','stepLengthFast'}; 
load('R_PT.mat'); % All Perceptual Stuff
[ActiveMapStats, ActiveMapStats2]=PerceptionMapBoxWhisker(R_PT, params);
return

%% Decomposition of Perceptual After-Effects
groups={'PerceptionAbrupt', 'PerceptionAbruptLong', 'PerceptionAbruptSlowShort'};

conds={'stepLengthSlow', 'stepLengthFast', 'target'};
PerceptualDecayAnalysis(NormalizedStudyData, conds, groups)

conds={'alphaSlow', 'alphaFast', 'target'};
PerceptualDecayAnalysis(NormalizedStudyData, conds, groups)

conds={'XSlow', 'XFast', 'target'};
PerceptualDecayAnalysis(NormalizedStudyData, conds, groups)
return

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Passive Perception Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
clear all
clc

load('NormalizedStudyData.mat')
load('R_Passive'); 

%% After-Effects Figure
params = {'stepLengthSlow', 'stepLengthFast'}; 
groups = {'PassivePerceptionGradual', 'PassivePerceptionGradual'};
epochs={'NormBFAfter1_short','NormBFAfter1_med', 'NormBFAfter1_long','EarlyWash'};
ActivePerceptionFigure(NormalizedStudyData,params,groups, R_Passive, epochs)


params = {'netContributionNorm2', 'netContributionNorm2'}; 
groups = {'PassivePerceptionGradual', 'PassivePerceptionGradual'};
epochs={'EarlyWash','EarlyWash', 'EarlyWash','EarlyWash'};
ActivePerceptionFigure(NormalizedStudyData,params,groups, R_Passive, epochs)

%% Map Results
params = {'stepLengthSlow', 'stepLengthFast'}; 
figure
[PassiveMapStats]=PassiveMapMaintainanceSingle(R_Passive, 1, 2, 1, params{1});
PassiveMapMaintainanceSingle(R_Passive, 1, 2, 2, params{2});
return
