function RefGroupsSingle(Study,results,groups,params,epochs,indivFlag,colorOrder,mode, row, col, sub,LT)
%Make a bar plot to compare groups for a given epoch and parameter
%   TO DO: make function be able to accept a group array that is different
%   thand the groups in the results matrix

if nargin<8 || isempty(mode)
    mode=1;
end

if nargin<12 || isempty(LT)
    LT=0;
end

if isempty(colorOrder)==1
poster_colors;
if length(groups)>2 %==3 I dont know about this
    colorOrder=[p_red;  p_orange;p_fade_green; p_fade_blue; p_plum; p_green; p_blue; p_fade_red; p_lime; p_yellow; [0 0 0]; p_red; p_orange; p_fade_green; p_fade_blue; p_plum];
elseif length(groups)==2
    %colorOrder=[ p_orange; p_fade_green;p_fade_blue; p_plum; p_green; p_blue; p_fade_red; p_lime; p_yellow;  p_red; p_orange;  p_fade_green; p_fade_blue; p_plum];
    colorOrder=[ p_fade_blue; p_plum;p_fade_green;  p_green; p_blue; p_fade_red; p_lime; p_yellow;  p_red; p_orange;  p_fade_green; p_fade_blue; p_plum];
    elseif length(groups)==1
        colorOrder=[  p_plum; p_plum; p_plum; p_plum; p_plum; p_plum; p_plum; p_plum; p_plum; p_plum; p_plum; p_plum];
    end

end

greyOrder=[0 0 0 ;1 1 1;0.5 0.5 0.5;0.2 0.2 0.2;0.9 0.9 0.9;0.1 0.1 0.1;0.8 0.8 0.8;0.3 0.3 0.3;0.7 0.7 0.7];

legendNAMES=[];
ngroups=length(groups);         
numPlots=length(epochs)*length(params);
numE=length(epochs);

%For the perception study 09/07/2018
if LT==0 
dgroups={'PerceptionControl','PerceptionAbrupt', 'PerceptionControlLong','PerceptionAbruptLong', 'PerceptionControlSlowShort','PerceptionAbruptSlowShort'};  %default groups for the getResults_BF matrix
else
    dgroups=groups;
end 


i=1;
for p=1:length(params)
     ReallyWhereStats=find(cellfun(@(x) strcmp(x, params{1}), fieldnames(results.(epochs{1}).indiv),'uniformoutput',1));
    limy=[];
   for t=1:numE
       subplot(row, col, sub)
       hold on
       for b=1:size(results.(epochs{t}).avg, 1)%ngroups
            indx=[1:size(results.(epochs{t}).avg, 1)];
           legendNAMES=[legendNAMES  groups{b}];%  Study.(groups{b}).ID];
           
           ind=b;
           switch mode
               case 1
                   if nargin>5 && indivFlag

                       %% Plot individual Subjects 4/18/19 %Moved it to the indivFlag part and commented out the previous code, MGR 07/12/2018
                       
                        bar(b,results.(epochs{t}).avg(indx(b),ReallyWhereStats),'facecolor',colorOrder(ind,:));
                       
                       for s=1:length(Study.(groups{b}).ID)
                           GroupIDPosition=find(results.(epochs{t}).indiv.(params{p})(:, 1)==b);
                          
                           s=scatter(b+((.35-.15).*rand(1) +.15),results.(epochs{t}).indiv.(params{p})(GroupIDPosition(s),2),20, 'k','filled'); %alpha(0.5)
                           s.MarkerFaceAlpha=0.5;
                       end
                       
                      

                   else
                       line([.5 2.5], [results.(epochs{t}).avg(b,ReallyWhereStats) results.(epochs{t}).avg(b,ReallyWhereStats)], 'Color', colorOrder(ind,:))
                   end
           end
         
       end
        
       
   end
   set(gcf,'Renderer','painters');

end

end

