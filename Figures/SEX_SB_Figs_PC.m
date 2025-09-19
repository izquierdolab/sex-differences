clear, clc
close all

load('SB_SEX_DATA_FIGS.mat')

%%
%DIS 

DTRIALS=SO_resample.tbl_day(SO_resample.tbl_day.phase==0,:); 

DTRIALS_MALE=(DTRIALS(DTRIALS.sex==1,:)); 
DTRIALS_FEMALE=(DTRIALS(DTRIALS.sex==0,:)); 

%remove any NaNs 
DTRIALS_MALE(isnan(DTRIALS_MALE.CorrectPercent), :) = [];
DTRIALS_FEMALE(isnan(DTRIALS_FEMALE.CorrectPercent), :) = [];

DTRIALS_MALEMean=splitapply(@mean,DTRIALS_MALE.CorrectPercent,DTRIALS_MALE.day);
DTRIALS_MALESEM=splitapply(@std,DTRIALS_MALE.CorrectPercent,DTRIALS_MALE.day)./sqrt(splitapply(@length,DTRIALS_MALE.CorrectPercent,DTRIALS_MALE.day));

DTRIALS_FEMALEMean=splitapply(@mean,DTRIALS_FEMALE.CorrectPercent,DTRIALS_FEMALE.day);
DTRIALS_FEMALESEM=splitapply(@std,DTRIALS_FEMALE.CorrectPercent,DTRIALS_FEMALE.day)./sqrt(splitapply(@length,DTRIALS_FEMALE.CorrectPercent,DTRIALS_FEMALE.day));

%
figure 
plot(1:size(DTRIALS_MALEMean),DTRIALS_MALEMean,'color',[1, 0.5, 0],'LineStyle', '-');
hold on
plot(1:size(DTRIALS_FEMALEMean),DTRIALS_FEMALEMean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(DTRIALS_MALEMean),DTRIALS_MALEMean,DTRIALS_MALESEM, 'lineprops', {'color',[1, 0.5, 0],'LineStyle', '-'})
shadedErrorBar(1:length(DTRIALS_FEMALEMean),DTRIALS_FEMALEMean,DTRIALS_FEMALESEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 10],[0.5,0.5],'--k')
hold off

title('Male vs. Female Discrimination (100/0)')
legend ({'Male(n=10)','Female(n=7)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%Create R100 (R1 & R2) & R90 (R3 & R4) table from larger mat file 

R1Days=(SO_resample.tbl_day(SO_resample.tbl_day.phase==1,:)); 
R2Days=(SO_resample.tbl_day(SO_resample.tbl_day.phase==2,:)); 
R3Days=(SO_resample.tbl_day(SO_resample.tbl_day.phase==3,:)); 
R4Days=(SO_resample.tbl_day(SO_resample.tbl_day.phase==4,:)); 

%%
%AB R1 
 
R1Days_MALE=R1Days(R1Days.sex==1,:);  
R1Days_FEMALE=R1Days(R1Days.sex==0,:); 

R1Days_MALE(isnan(R1Days_MALE.CorrectPercent), :) = [];
R1Days_FEMALE(isnan(R1Days_FEMALE.CorrectPercent), :) = [];

R1Days_MALEMean=splitapply(@mean,R1Days_MALE.CorrectPercent,R1Days_MALE.day);
R1Days_MALESEM=splitapply(@std,R1Days_MALE.CorrectPercent,R1Days_MALE.day)./sqrt(splitapply(@length,R1Days_MALE.CorrectPercent,R1Days_MALE.day));


R1Days_FEMALEMean=splitapply(@mean,R1Days_FEMALE.CorrectPercent,R1Days_FEMALE.day);
R1Days_FEMALESEM=splitapply(@std,R1Days_FEMALE.CorrectPercent,R1Days_FEMALE.day)./sqrt(splitapply(@length,R1Days_FEMALE.CorrectPercent,R1Days_FEMALE.day));


%%
%Plot figure 

figure 
plot(1:size(R1Days_MALEMean),R1Days_MALEMean,'color',[1, 0.5, 0],'LineStyle', '-');
hold on
plot(1:size(R1Days_FEMALEMean),R1Days_FEMALEMean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(R1Days_MALEMean),R1Days_MALEMean,R1Days_MALESEM, 'lineprops', {'color',[1, 0.5, 0],'LineStyle', '-'})
shadedErrorBar(1:length(R1Days_FEMALEMean),R1Days_FEMALEMean,R1Days_FEMALESEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 10],[0.5,0.5],'--k')
hold off
 
title('Male vs. Female R1 (100/0)')
legend ({'Male(n=10)','Female(n=7)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
% ylim([0.2 0.8])
% set(gca,'YTick',[0.2 0.4 0.6 0.8],'YTickLabel', {'0.2','0.4','0.6','0.8'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
% xlim([1 10])
% set(gca,'XTick',[0 1 2 3 4 5 6 7 8 9 10],'XTickLabel',{'0','1','2','3','4','5','6','7','8','9','10'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%%
%AB R2 
 
R2Days_MALE=R2Days(R2Days.sex==1,:);  
R2Days_FEMALE=R2Days(R2Days.sex==0,:); 

R2Days_MALE(isnan(R2Days_MALE.CorrectPercent), :) = [];
R2Days_FEMALE(isnan(R2Days_FEMALE.CorrectPercent), :) = [];

R2Days_MALEMean=splitapply(@mean,R2Days_MALE.CorrectPercent,R2Days_MALE.day);
R2Days_MALESEM=splitapply(@std,R2Days_MALE.CorrectPercent,R2Days_MALE.day)./sqrt(splitapply(@length,R2Days_MALE.CorrectPercent,R2Days_MALE.day));


R2Days_FEMALEMean=splitapply(@mean,R2Days_FEMALE.CorrectPercent,R2Days_FEMALE.day);
R2Days_FEMALESEM=splitapply(@std,R2Days_FEMALE.CorrectPercent,R2Days_FEMALE.day)./sqrt(splitapply(@length,R2Days_FEMALE.CorrectPercent,R2Days_FEMALE.day));

%%
%Plot figure 

figure 
plot(1:size(R2Days_MALEMean),R2Days_MALEMean,'color',[1, 0.5, 0],'LineStyle', '-');
hold on
plot(1:size(R2Days_FEMALEMean),R2Days_FEMALEMean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(R2Days_MALEMean),R2Days_MALEMean,R2Days_MALESEM, 'lineprops', {'color',[1, 0.5, 0],'LineStyle', '-'})
shadedErrorBar(1:length(R2Days_FEMALEMean),R2Days_FEMALEMean,R2Days_FEMALESEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 10],[0.5,0.5],'--k')
hold off
 
title('Male vs. Female R2 (100/0)')
legend ({'Male(n=10)','Female(n=7)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB R3 
 
R3Days_MALE=R3Days(R3Days.sex==1,:);  
R3Days_FEMALE=R3Days(R3Days.sex==0,:); 

R3Days_MALE(isnan(R3Days_MALE.CorrectPercent), :) = [];
R3Days_FEMALE(isnan(R3Days_FEMALE.CorrectPercent), :) = [];

R3Days_MALEMean=splitapply(@mean,R3Days_MALE.CorrectPercent,R3Days_MALE.day);
R3Days_MALESEM=splitapply(@std,R3Days_MALE.CorrectPercent,R3Days_MALE.day)./sqrt(splitapply(@length,R3Days_MALE.CorrectPercent,R3Days_MALE.day));


R3Days_FEMALEMean=splitapply(@mean,R3Days_FEMALE.CorrectPercent,R3Days_FEMALE.day);
R3Days_FEMALESEM=splitapply(@std,R3Days_FEMALE.CorrectPercent,R3Days_FEMALE.day)./sqrt(splitapply(@length,R3Days_FEMALE.CorrectPercent,R3Days_FEMALE.day));

%%
%Plot figure 

figure 
plot(1:size(R3Days_MALEMean),R3Days_MALEMean,'color',[1, 0.5, 0],'LineStyle', '-');
hold on
plot(1:size(R3Days_FEMALEMean),R3Days_FEMALEMean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(R3Days_MALEMean),R3Days_MALEMean,R3Days_MALESEM, 'lineprops', {'color',[1, 0.5, 0],'LineStyle', '-'})
shadedErrorBar(1:length(R3Days_FEMALEMean),R3Days_FEMALEMean,R3Days_FEMALESEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 10],[0.5,0.5],'--k')
hold off
 
title('Male vs. Female R3 (90/10)')
legend ({'Male(n=10)','Female(n=7)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB R4 
 
R4Days_MALE=R4Days(R4Days.sex==1,:);  
R4Days_FEMALE=R4Days(R4Days.sex==0,:); 

R4Days_MALE(isnan(R4Days_MALE.CorrectPercent), :) = [];
R4Days_FEMALE(isnan(R4Days_FEMALE.CorrectPercent), :) = [];

R4Days_MALEMean=splitapply(@mean,R4Days_MALE.CorrectPercent,R4Days_MALE.day);
R4Days_MALESEM=splitapply(@std,R4Days_MALE.CorrectPercent,R4Days_MALE.day)./sqrt(splitapply(@length,R4Days_MALE.CorrectPercent,R4Days_MALE.day));

R4Days_FEMALEMean=splitapply(@mean,R4Days_FEMALE.CorrectPercent,R4Days_FEMALE.day);
R4Days_FEMALESEM=splitapply(@std,R4Days_FEMALE.CorrectPercent,R4Days_FEMALE.day)./sqrt(splitapply(@length,R4Days_FEMALE.CorrectPercent,R4Days_FEMALE.day));

%%
%Plot figure 

figure 
plot(1:size(R4Days_MALEMean),R4Days_MALEMean,'color',[1, 0.5, 0],'LineStyle', '-');
hold on
plot(1:size(R4Days_FEMALEMean),R4Days_FEMALEMean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(R4Days_MALEMean),R4Days_MALEMean,R4Days_MALESEM, 'lineprops', {'color',[1, 0.5, 0],'LineStyle', '-'})
shadedErrorBar(1:length(R4Days_FEMALEMean),R4Days_FEMALEMean,R4Days_FEMALESEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 5],[0.5,0.5],'--k')
hold off
 
title('Male vs. Female R4 (90/10)')
legend ({'Male(n=10)','Female(n=7)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 5])
set(gca,'XTick',[0 1 2 3 4 5],'XTickLabel',{'0','1','2','3','4','5'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Sessions'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')
