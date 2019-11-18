function ActivePerceptionFigure(DumbTester7NormAdj,params,groups, RESULTS, epochs)
% This figure is to show the kinetic timecourses as well as the bar plots
% including stats


%% Set up the physical Figure
axesFontSize=10;
labelFontSize=0;
titleFontSize=12;
%row=length(params); col=3; subers1=[1; 4];subers2=[2; 5];subers3=subers2+1;subers4=subers3+1;BarWhere=[1:6];
row=1; col=10; subers1=[1:2]; subers2=[3:4];subers3=[5];subers4=[6]; subers5=[7]; subers6=[8]; subers7=[9]; subers8=[10];

[ah,figHandle]=optimizedSubPlot(row*col,row,col,'tb',axesFontSize,labelFontSize,titleFontSize);


%% Manditory Color Order
poster_colors;
if length(groups)==6%isempty(Filling)==1
    %% Active Percetption Experiments
    
    %% Perceptual Shifts Slow and Fast
    sub=subers1;
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(1),0,[],[], row, col, sub)
    
    sub=subers2;
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(1),0,[],[], row, col, sub)

    %colorOrder=[[(204/255) 0 (204/255)];p_fade_green];
    colorOrder=[[153,100,179]./255; [0 204 102]./255];% Better greeen:[102 255 178]./255
    groups={'Medium', 'Slow'};
    
    %% Motor After-Effects
    sub=subers3;
    barGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(2),1,colorOrder,[], row, col, sub, 1)
    
    sub=subers4;
    barGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(2),1,colorOrder,[], row, col, sub, 1)
    
    %% Slow Leg: Late Percpetual Task amd Washout
    sub=subers5;
    barGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(3),1,colorOrder,[], row, col, sub, 1)
    
    sub=subers6;
    barGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(4),1,colorOrder,[], row, col, sub, 1)
    %RefGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(2),0,colorOrder,[], row, col, sub, 1)
    RefGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(1),{'Catch'},0,colorOrder,[], row, col, sub, 1)
    
    %% Slow Leg: Late Percpetual Task amd Washout
    sub=subers7;
    barGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(3),1,colorOrder,[], row, col, sub, 1)
    
    sub=subers8;
    barGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(4),1,colorOrder,[], row, col, sub, 1)
    %RefGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(2),0,colorOrder,[], row, col, sub, 1)
    RefGroupsSingle(DumbTester7NormAdj,RESULTS,groups,params(2),{'Catch'},0,colorOrder,[], row, col, sub, 1)
    
elseif length(groups)==2%isempty(Filling)==1
    %% Passive Percetption Experiments
    colorOrder=[[160 160 160]/255; [160 160 160]/255];
    
    %% Perceptual After-Effects Slow Leg
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(1),0,[],[], row, col, 1)
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(2),0,[],[], row, col, 2)
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(3),0,[],[], row, col, 3)

    %% Perceptual After-Effects Fast Leg
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(1),0,[],[], row, col, 4)
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(2),0,[],[], row, col, 5)
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(3),0,[],[], row, col, 6)
   
    
    %% Slow Leg: Late Percpetual Task amd Washout
    sub=subers7;
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(1),epochs(4),0,[],[], row, col, sub)
    
    sub=subers8;
    barGroupsSingleSpecial(DumbTester7NormAdj,RESULTS,groups,params(2),epochs(4),0,[],[], row, col, sub)
    
end


%% Pretty
fh=gcf;
ah=findobj(fh,'Type','Axes');

AllRow=[ ah(1).YLim;ah(2).YLim;ah(3).YLim;ah(4).YLim;ah(5).YLim;ah(6).YLim;ah(7).YLim; ah(8).YLim];%; ah(9).YLim; ah(10).YLim ];
set(ah([1:10]),'Ylim',[min(AllRow(:, 1)) max(AllRow(:, 2))]);


% topRow=[ ah(8).YLim; ah(6).YLim; ah(4).YLim; ah(2).YLim ];
% bottomRow=[ah(7).YLim; ah(5).YLim; ah(3).YLim; ah(1).YLim ];
% 
% set(ah([8 6 4 2]),'Ylim',[min(topRow(:, 1)) max(topRow(:, 2))]);
% set(ah([7 5 3 1]),'Ylim',[min(bottomRow(:, 1)) max(bottomRow(:, 2))]);
set(gcf,'color','w')
set(gcf,'Renderer','painters');

% %% New Figure
% figure
% 
% [ah2,figHandle]=optimizedSubPlot(2,2,4,'tb',axesFontSize,labelFontSize,titleFontSize);
% CorrelationsSingle(DumbTester7NormAdj, RESULTS,['NormBFAfter1'],params(1), RESULTS,['DelA'],params(1), groups, [], 2, 2, 1, figHandle.Number)
% CorrelationsSingle(DumbTester7NormAdj, RESULTS,['NormBFAfter1'],params(2), RESULTS,['DelA'],params(2), groups, [], 2, 2, 2, figHandle.Number)


