function PerceptualDecayAnalysis(DumbTester7NormAdj, conds, groups)


%% 1 -- Acquire and organizethe data that I want.

% (2) From within Dumb Tester 7, I need to get the target and step length
% data from the washout error clamp epoch
MS_Slow_Short=NaN.*ones(410, 9);
MS_Slow_Long=NaN.*ones(410, 9);
MS_Fast_Short=NaN.*ones(410, 9);
MS_Fast_Long=NaN.*ones(410, 9);
MS_Slow=NaN.*ones(410, 9);
MS_Fast=NaN.*ones(410, 9);

ML_Slow_Short=NaN.*ones(410, 9);
ML_Slow_Long=NaN.*ones(410, 9);
ML_Fast_Short=NaN.*ones(410, 9);
ML_Fast_Long=NaN.*ones(410, 9);

SS_Slow_Short=NaN.*ones(410, 9);
SS_Slow_Long=NaN.*ones(410, 9);
SS_Fast_Short=NaN.*ones(410, 9);
SS_Fast_Long=NaN.*ones(410, 9);

% for the baseline
MS_Slow_Short_Base=NaN.*ones(410, 9);
MS_Slow_Long_Base=NaN.*ones(410, 9);
MS_Fast_Short_Base=NaN.*ones(410, 9);
MS_Fast_Long_Base=NaN.*ones(410, 9);

ML_Slow_Short_Base=NaN.*ones(410, 9);
ML_Slow_Long_Base=NaN.*ones(410, 9);
ML_Fast_Short_Base=NaN.*ones(410, 9);
ML_Fast_Long_Base=NaN.*ones(410, 9);

SS_Slow_Short_Base=NaN.*ones(410, 9);
SS_Slow_Long_Base=NaN.*ones(410, 9);
SS_Fast_Short_Base=NaN.*ones(410, 9);
SS_Fast_Long_Base=NaN.*ones(410, 9);
%
ML_ShortIndex_Base=NaN.*ones(410, 9);
ML_LongIndex_Base=NaN.*ones(410, 9);

SavingName={'MS', 'ML', 'SS'};

for g=1:length(groups)
    for s=1:length(DumbTester7NormAdj.PerceptionAbrupt.ID)
        adaptData=DumbTester7NormAdj.(groups{g}).adaptData{s};
        adaptData=adaptData.removeBadStrides;
        
        %% Washout Data
        Data{1, s}=adaptData.getParamInCond(conds,'Washout Error Clamp');
        Data{s}(1, :)=[];
        
        ShortIndex=find(Data{1, s}(:, 3)<(nanmean(Data{1, s}(:, 3))-.03));
        LongIndex=find(Data{1, s}(:, 3)>(nanmean(Data{1, s}(:, 3))+.03));
        
        eval([SavingName{g} '_Slow_Short(ShortIndex, ', num2str(s), ')=Data{1, ' num2str(s), '}(ShortIndex , 1);']); %MS_Slow_Short(ShortIndex, s)=Data{1, s}(ShortIndex, 1);
        eval([SavingName{g} '_Slow_Long(LongIndex, ', num2str(s), ')=Data{1, ' num2str(s), '}(LongIndex , 1);']);   % MS_Slow_Long(LongIndex, s)=Data{1, s}(LongIndex, 1);
        eval([SavingName{g} '_Fast_Short(ShortIndex, ', num2str(s), ')=Data{1, ' num2str(s), '}(ShortIndex , 2);']); %MS_Fast_Short(ShortIndex, s)=Data{1, s}(ShortIndex, 2);
        eval([SavingName{g} '_Fast_Long(LongIndex, ', num2str(s), ')=Data{1, ' num2str(s), '}(LongIndex , 2);']);   % MS_Fast_Long(LongIndex, s)=Data{1, s}(LongIndex, 2);
        
        eval([SavingName{g} '_Slow([1:length(Data{1, ' num2str(s), '}(:,1))], ' num2str(s), ')=Data{1, ', num2str(s), '}(:, 1);']);% MS_Slow([1:length(MS_Data{1, s}(:,1))], s)=Data{1, s}(:, 1);
        eval([SavingName{g} '_Fast([1:length(Data{1, ' num2str(s), '}(:,1))], ' num2str(s), ')=Data{1, ', num2str(s), '}(:, 2);']);% MS_Fast([1:length(MS_Data{1, s}(:,1))], s)=Data{1, s}(:, 2);
        
        clear ShortIndex LongIndex Data
        
        %% Baseline Data
        Data{1, s}=adaptData.getParamInCond(conds,'Error Clamp');
        Data{s}(1, :)=[];
        
        ShortIndex=find(Data{1, s}(:, 3)<(nanmean(Data{1, s}(:, 3))-.03));
        LongIndex=find(Data{1, s}(:, 3)>(nanmean(Data{1, s}(:, 3))+.03));
        
        eval([SavingName{g} '_ShortIndex_Base(ShortIndex, ', num2str(s), ')=1;']); %MS_Slow_Short(ShortIndex, s)=Data{1, s}(ShortIndex, 1);
        eval([SavingName{g} '_LongIndex_Base(LongIndex, ', num2str(s), ')=1;']);   % MS_Slow_Long(LongIndex, s)=Data{1, s}(LongIndex, 1);
        
        eval([SavingName{g} '_Slow_Short_Base(ShortIndex, ', num2str(s), ')=Data{1, ' num2str(s), '}(ShortIndex , 1);']); %MS_Slow_Short(ShortIndex, s)=Data{1, s}(ShortIndex, 1);
        eval([SavingName{g} '_Slow_Long_Base(LongIndex, ', num2str(s), ')=Data{1, ' num2str(s), '}(LongIndex , 1);']);   % MS_Slow_Long(LongIndex, s)=Data{1, s}(LongIndex, 1);
        eval([SavingName{g} '_Fast_Short_Base(ShortIndex, ', num2str(s), ')=Data{1, ' num2str(s), '}(ShortIndex , 2);']); %MS_Fast_Short(ShortIndex, s)=Data{1, s}(ShortIndex, 2);
        eval([SavingName{g} '_Fast_Long_Base(LongIndex, ', num2str(s), ')=Data{1, ' num2str(s), '}(LongIndex , 2);']);   % MS_Fast_Long(LongIndex, s)=Data{1, s}(LongIndex, 2);
        
        eval([SavingName{g} '_Slow_Base([1:length(Data{1, ' num2str(s), '}(:,1))], ' num2str(s), ')=Data{1, ', num2str(s), '}(:, 1);']);% MS_Slow([1:length(MS_Data{1, s}(:,1))], s)=Data{1, s}(:, 1);
        eval([SavingName{g} '_Fast_Base([1:length(Data{1, ' num2str(s), '}(:,1))], ' num2str(s), ')=Data{1, ', num2str(s), '}(:, 2);']);% MS_Fast([1:length(MS_Data{1, s}(:,1))], s)=Data{1, s}(:, 2);
        
        clear ShortIndex LongIndex Data
    end
    
%% There are many ways of removing bias or calculating symmetry here, see older backups for other methods
    
%% Perception Washout -Baseline Behavior
if sum(strcmp(conds, {'stepLengthSlow', 'stepLengthFast', 'target'}))==3
            %mean
            eval([SavingName{g} '_Slow_Short_mean=mean(', SavingName{g}, '_Slow_Short, 2)-mean(', SavingName{g}, '_Slow_Short_Base, 2);']);
            eval([SavingName{g} '_Slow_Long_mean=mean(', SavingName{g}, '_Slow_Long, 2)-mean(', SavingName{g}, '_Slow_Long_Base, 2);']);
            eval([SavingName{g} '_Fast_Short_mean=mean(', SavingName{g}, '_Fast_Short, 2)-mean(', SavingName{g}, '_Fast_Short_Base, 2);']);
            eval([SavingName{g} '_Fast_Long_mean=mean(', SavingName{g}, '_Fast_Long, 2)-mean(', SavingName{g}, '_Fast_Long_Base, 2);']);
        display('SHOWING BASELINE REMOVED WASHOUT')
    
else %For when you want to computs X and alpha symmetry
    %% Pablo's Idea to compute the symmetry behavior which does not include the baseline behavior
    eval([SavingName{g} '_Slow_Short_mean=mean(', SavingName{g}, '_Slow_Short, 2)-mean(', SavingName{g}, '_Fast_Short, 2);']);
    eval([SavingName{g} '_Fast_Short_mean=mean(', SavingName{g}, '_Slow_Short, 2)-mean(', SavingName{g}, '_Fast_Short, 2);']);
    eval([SavingName{g} '_Slow_Long_mean=mean(', SavingName{g}, '_Slow_Long, 2)-mean(', SavingName{g}, '_Fast_Long, 2);']);
    eval([SavingName{g} '_Fast_Long_mean=mean(', SavingName{g}, '_Slow_Long, 2)-mean(', SavingName{g}, '_Fast_Long, 2);']);
    display('PERFORMING A SYMMETRY MEASURE HERE')
end
%%
eval(['Stride', SavingName{g} '=transpose([1:length(', SavingName{g}, '_Slow_Short_mean)]);']);%StrideMS=[1:length(MS_Slow_Short_mean)]';

end
close all

StrideM=transpose([1:length(MS_Fast_Long_mean)]);
%% If I want to splice together the
if sum(strcmp(conds, {'stepLengthSlow', 'stepLengthFast', 'target'}))~=3
M_Fast_Long_mean=nansum([MS_Fast_Long_mean ML_Fast_Long_mean], 2); M_Fast_Long_mean(find(M_Fast_Long_mean==0))=NaN;
M_Fast_Short_mean=nansum([MS_Fast_Short_mean ML_Fast_Short_mean], 2); M_Fast_Short_mean(find(M_Fast_Short_mean==0))=NaN;
M_Slow_Long_mean=nansum([MS_Slow_Long_mean ML_Slow_Long_mean], 2); M_Slow_Long_mean(find(M_Slow_Long_mean==0))=NaN;
M_Slow_Short_mean=nansum([MS_Slow_Short_mean ML_Slow_Short_mean], 2); M_Slow_Short_mean(find(M_Slow_Short_mean==0))=NaN;
end



% (4) I need to try to fit the data, either on an individual level, but
% most likely on a group avrerage level
if strcmp(conds{1}, 'alphaSlow')==1 || strcmp(conds{1}, 'netContributionNorm2')==1
    if exist('M_Fast_Long_mean')==1
        [fitresult_M, gof_M] = LegAlphaDecays(StrideM, M_Fast_Long_mean, M_Fast_Short_mean, M_Slow_Long_mean, M_Slow_Short_mean);
    else
        fitresult_M=NaN;
        gof_M=NaN;
    end
    
    
    [fitresult_MS, gof_MS] = LegAlphaDecays(StrideMS, MS_Fast_Long_mean, MS_Fast_Short_mean, MS_Slow_Long_mean, MS_Slow_Short_mean);
    [fitresult_ML, gof_ML] = LegAlphaDecays(StrideML, ML_Fast_Long_mean, ML_Fast_Short_mean, ML_Slow_Long_mean, ML_Slow_Short_mean);
    [fitresult_SS, gof_SS] = LegAlphaDecays(StrideSS, SS_Fast_Long_mean, SS_Fast_Short_mean, SS_Slow_Long_mean, SS_Slow_Short_mean);
else
    if exist('M_Fast_Long_mean')==1
        [fitresult_M, gof_M] = LegDecayFits(StrideM, M_Fast_Long_mean, M_Fast_Short_mean, M_Slow_Long_mean, M_Slow_Short_mean);
    else
        fitresult_M=NaN;
        gof_M=NaN;
    end
    [fitresult_MS, gof_MS] = LegDecayFits(StrideMS, MS_Fast_Long_mean, MS_Fast_Short_mean, MS_Slow_Long_mean, MS_Slow_Short_mean);
    [fitresult_ML, gof_ML] = LegDecayFits(StrideML, ML_Fast_Long_mean, ML_Fast_Short_mean, ML_Slow_Long_mean, ML_Slow_Short_mean);
    [fitresult_SS, gof_SS] = LegDecayFits(StrideSS, SS_Fast_Long_mean, SS_Fast_Short_mean, SS_Slow_Long_mean, SS_Slow_Short_mean);
end
close all


if exist('M_Fast_Long_mean')==1 % indicating pooled data
    
    SavingNameNew={'M', 'MS', 'ML', 'SS'};
    
    for g=1:length(SavingNameNew)
        eval(['[r_', SavingNameNew{g}, '1 r_', SavingNameNew{g}, '2 r_', SavingNameNew{g}, '3 r_', SavingNameNew{g}, '4]=gof_', SavingNameNew{g}, '.rsquare;']) ;%[r_MS1 r_MS2 r_MS3 r_MS4]=gof_MS.rsquare;
        eval(['CI_', SavingNameNew{g}, '1=confint(fitresult_', SavingNameNew{g}, '{1},0.95); T_', SavingNameNew{g}, '1=coeffvalues(fitresult_', SavingNameNew{g}, '{1});']);%CI_MS1=confint(fitresult_MS{1},0.95); T_MS1=coeffvalues(fitresult_MS{1});
        eval(['CI_', SavingNameNew{g}, '2=confint(fitresult_', SavingNameNew{g}, '{2},0.95); T_', SavingNameNew{g}, '2=coeffvalues(fitresult_', SavingNameNew{g}, '{2});']);%CI_MS2=confint(fitresult_MS{2},0.95); T_MS2=coeffvalues(fitresult_MS{2});
        eval(['CI_', SavingNameNew{g}, '3=confint(fitresult_', SavingNameNew{g}, '{3},0.95); T_', SavingNameNew{g}, '3=coeffvalues(fitresult_', SavingNameNew{g}, '{3});']);%CI_MS3=confint(fitresult_MS{3},0.95); T_MS3=coeffvalues(fitresult_MS{3});
        eval(['CI_', SavingNameNew{g}, '4=confint(fitresult_', SavingNameNew{g}, '{4},0.95); T_', SavingNameNew{g}, '4=coeffvalues(fitresult_', SavingNameNew{g}, '{4});']);%CI_MS4=confint(fitresult_MS{4},0.95); T_MS4=coeffvalues(fitresult_MS{4});
    end
    figure;
    subplot(1, 2, 2); hold on
    scatter(StrideM, M_Fast_Long_mean, '.', 'MarkerEdgeColor',[.5 .5 .5]); hold on
    scatter(StrideSS, SS_Fast_Long_mean, '.', 'MarkerEdgeColor',[.9 .9 .9]); hold on
    if sign(CI_M1(1, 2))==sign(CI_M1(2, 2)) && T_M1(2)<=0.1 && r_M1>.25 ; plot(StrideM, fitresult_M{1}(StrideM), 'c'); hold on; else; plot(StrideM, fitresult_M{1}(StrideM), ':c'); hold on; end
    if sign(CI_SS1(1, 2))==sign(CI_SS1(2, 2)) && T_SS1(2)<=0.1 && r_SS1>.25 ;plot(StrideSS, fitresult_SS{1}(StrideSS), 'k'); hold on; else; plot(StrideSS, fitresult_SS{1}(StrideSS), ':k'); hold on;  end
    legend({'Raw M', 'RawS', ...
        ['M: Tau=' num2str(1/T_M1(2)) '[' num2str(1/CI_M1(1, 2)) ', ' num2str(1/CI_M1(2, 2)) ']; R^2 =' num2str(r_M1)],...
        ['SS: Tau=' num2str(1/T_SS1(2)) '[' num2str(1/CI_SS1(1, 2)) ', ' num2str(1/CI_SS1(2, 2)) ']; R^2 =' num2str(r_SS1)]});
    xlim([0 400])
    title('Long Target')
    ylabel([conds{2}, ' - ', conds{1}])
    h=refline([0 0]); h.Color='k'; 
    
    subplot(1, 2, 1); hold on
    scatter(StrideM, M_Slow_Short_mean, '.', 'MarkerEdgeColor',[.5 .5 .5]); hold on
    scatter(StrideSS, SS_Slow_Short_mean, '.', 'MarkerEdgeColor',[.9 .9 .9]); hold on
    if sign(CI_M4(1, 2))==sign(CI_M4(2, 2)) && T_M4(2)<=0.1 && r_M4>.25 ; plot(StrideM, fitresult_M{4}(StrideM), 'c'); hold on; else; plot(StrideM, fitresult_M{4}(StrideM), ':c'); hold on; end
    if sign(CI_SS4(1, 2))==sign(CI_SS4(2, 2)) && T_SS4(2)<=0.1 && r_SS4>.25 ;plot(StrideSS, fitresult_SS{4}(StrideSS), 'k'); hold on; else; plot(StrideSS, fitresult_SS{4}(StrideSS), ':k'); hold on;  end
    legend({'Raw M', 'RawS',...
        ['M: Tau=' num2str(1/T_M4(2)) '[' num2str(1/CI_M4(1, 2)) ', ' num2str(1/CI_M4(2, 2)) ']; R^2 =' num2str(r_M4)],...
        ['SS: Tau=' num2str(1/T_SS4(2)) '[' num2str(1/CI_SS4(1, 2)) ', ' num2str(1/CI_SS4(2, 2)) ']; R^2 =' num2str(r_SS4)]});
    xlim([0 400])
    title('Short Target')
    ylabel([conds{2}, ' - ', conds{1}])
    h=refline([0 0]); h.Color='k';
    
    fh=gcf;
    ah=findobj(fh,'Type','Axes');

  
else %% NOT POOLED
    
    SavingNameNew={'MS', 'ML', 'SS'};
    
    for g=1:length(SavingNameNew)
        eval(['[r_', SavingNameNew{g}, '1 r_', SavingNameNew{g}, '2 r_', SavingNameNew{g}, '3 r_', SavingNameNew{g}, '4]=gof_', SavingNameNew{g}, '.rsquare;']) ;%[r_MS1 r_MS2 r_MS3 r_MS4]=gof_MS.rsquare;
        eval(['CI_', SavingNameNew{g}, '1=confint(fitresult_', SavingNameNew{g}, '{1},0.95); T_', SavingNameNew{g}, '1=coeffvalues(fitresult_', SavingNameNew{g}, '{1});']);%CI_MS1=confint(fitresult_MS{1},0.95); T_MS1=coeffvalues(fitresult_MS{1});
        eval(['CI_', SavingNameNew{g}, '2=confint(fitresult_', SavingNameNew{g}, '{2},0.95); T_', SavingNameNew{g}, '2=coeffvalues(fitresult_', SavingNameNew{g}, '{2});']);%CI_MS2=confint(fitresult_MS{2},0.95); T_MS2=coeffvalues(fitresult_MS{2});
        eval(['CI_', SavingNameNew{g}, '3=confint(fitresult_', SavingNameNew{g}, '{3},0.95); T_', SavingNameNew{g}, '3=coeffvalues(fitresult_', SavingNameNew{g}, '{3});']);%CI_MS3=confint(fitresult_MS{3},0.95); T_MS3=coeffvalues(fitresult_MS{3});
        eval(['CI_', SavingNameNew{g}, '4=confint(fitresult_', SavingNameNew{g}, '{4},0.95); T_', SavingNameNew{g}, '4=coeffvalues(fitresult_', SavingNameNew{g}, '{4});']);%CI_MS4=confint(fitresult_MS{4},0.95); T_MS4=coeffvalues(fitresult_MS{4});
    end
     figure;
    

subplot(2, 1, 2)
    scatter(StrideMS, MS_Fast_Short_mean, '.', 'MarkerEdgeColor',[.5 .5 .5]); hold on
    scatter(StrideML, ML_Fast_Long_mean, '.', 'MarkerEdgeColor',[.1 .1 .1]); hold on
    scatter(StrideSS, SS_Fast_Short_mean, '.', 'MarkerEdgeColor',[.9 .9 .9]); hold on
    if sign(CI_MS2(1, 2))==sign(CI_MS2(2, 2)) && T_MS2(2)<=0.1 && r_MS2>.25 ; plot(StrideMS, fitresult_MS{2}(StrideMS), 'r'); hold on; else; plot(StrideMS, fitresult_MS{2}(StrideMS), ':r'); hold on; end
    if sign(CI_ML1(1, 2))==sign(CI_ML1(2, 2)) && T_ML1(2)<=0.1 && r_ML1>.25 ; plot(StrideML, fitresult_ML{1}(StrideML), 'c'); hold on; else; plot(StrideML, fitresult_ML{1}(StrideML), ':c'); hold on; end
    if sign(CI_SS2(1, 2))==sign(CI_SS2(2, 2)) && T_SS2(2)<=0.1 && r_SS2>.25 ;plot(StrideSS, fitresult_SS{2}(StrideSS), 'k'); hold on;  else; plot(StrideSS, fitresult_SS{2}(StrideSS), ':k'); hold on; end
    legend({'Raw MS', 'Raw ML', 'RawS',...
        ['MS: Tau=' num2str(1/T_MS2(2)) '[' num2str(1/CI_MS2(1, 2)) ', ' num2str(1/CI_MS2(2, 2)) ']; R^2 =' num2str(r_MS2)],...
        ['ML: Tau=' num2str(1/T_ML1(2)) '[' num2str(1/CI_ML1(1, 2)) ', ' num2str(1/CI_ML1(2, 2)) ']; R^2 =' num2str(r_ML1)],...
        ['SS: Tau=' num2str(1/T_SS2(2)) '[' num2str(1/CI_SS2(1, 2)) ', ' num2str(1/CI_SS2(2, 2)) ']; R^2 =' num2str(r_SS2)]});
    title('Fast Short')
    ylabel(conds{2})
    xlim([0 400])
    h=refline([0 0]); h.Color='k';
    
    subplot(2, 1, 1)
    scatter(StrideMS, MS_Slow_Short_mean, '.', 'MarkerEdgeColor',[.5 .5 .5]); hold on
    scatter(StrideML, ML_Slow_Long_mean, '.', 'MarkerEdgeColor',[.1 .1 .1]); hold on
    scatter(StrideSS, SS_Slow_Short_mean, '.', 'MarkerEdgeColor',[.9 .9 .9]); hold on
    if sign(CI_MS4(1, 2))==sign(CI_MS4(2, 2)) && T_MS4(2)<=0.1 && r_MS4>.25 ; plot(StrideMS, fitresult_MS{4}(StrideMS), 'r'); hold on; else; plot(StrideMS, fitresult_MS{4}(StrideMS), ':r'); hold on; end
    if sign(CI_ML3(1, 2))==sign(CI_ML3(2, 2)) && T_ML3(2)<=0.1 && r_ML3>.25 ; plot(StrideML, fitresult_ML{3}(StrideML), 'c'); hold on; else; plot(StrideML, fitresult_ML{3}(StrideML), ':c'); hold on; end
    if sign(CI_SS4(1, 2))==sign(CI_SS4(2, 2)) && T_SS4(2)<=0.1 && r_SS4>.25 ;plot(StrideSS, fitresult_SS{4}(StrideSS), 'k'); hold on; else; plot(StrideSS, fitresult_SS{4}(StrideSS), ':k'); hold on;  end
    legend({'Raw MS', 'Raw ML', 'RawS',...
        ['MS: Tau=' num2str(1/T_MS4(2)) '[' num2str(1/CI_MS4(1, 2)) ', ' num2str(1/CI_MS4(2, 2)) ']; R^2 =' num2str(r_MS4)],...
        ['ML: Tau=' num2str(1/T_ML3(2)) '[' num2str(1/CI_ML3(1, 2)) ', ' num2str(1/CI_ML3(2, 2)) ']; R^2 =' num2str(r_ML3)],...
        ['SS: Tau=' num2str(1/T_SS4(2)) '[' num2str(1/CI_SS4(1, 2)) ', ' num2str(1/CI_SS4(2, 2)) ']; R^2 =' num2str(r_SS4)]});
    xlim([0 400])
    title(conds{1})
    ylabel(conds{1})
    h=refline([0 0]); h.Color='k';
    
    fh=gcf;
    ah=findobj(fh,'Type','Axes');
    topRow=[ah(1).YLim; ah(2).YLim; ];
    set(ah([1]),'Ylim',[-.255 .08]);
    set(ah([2]),'Ylim',[-.08 .146]);
end

set(gcf,'Renderer','painters');
