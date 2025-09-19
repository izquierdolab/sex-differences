clear, clc
close all

load('AB_SEX_DATA_FIGS.mat')

%%
AO_resample.tbl_trials  = AO_resample.tbl_trials(AO_resample.tbl_trials.day<=1,:); 

%%
DTRIALS=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==0,:)); 

DTRIALS_MALE=(DTRIALS(DTRIALS.sex==1,:)); 
DTRIALS_FEMALE=(DTRIALS(DTRIALS.sex==0,:)); 

DTRIALS_MALE_Mean=splitapply(@mean,DTRIALS_MALE.CorrectPercent,DTRIALS_MALE.ContTrial);
DTRIALS_MALE_SEM=splitapply(@std,DTRIALS_MALE.CorrectPercent,DTRIALS_MALE.ContTrial)./sqrt(splitapply(@length,DTRIALS_MALE.CorrectPercent,DTRIALS_MALE.ContTrial));

DTRIALS_FEMALE_Mean=splitapply(@mean,DTRIALS_FEMALE.CorrectPercent,DTRIALS_FEMALE.ContTrial);
DTRIALS_FEMALE_SEM=splitapply(@std,DTRIALS_FEMALE.CorrectPercent,DTRIALS_FEMALE.ContTrial)./sqrt(splitapply(@length,DTRIALS_FEMALE.CorrectPercent,DTRIALS_FEMALE.ContTrial));

% MovMean (sliding trials of 10)

DTRIALSMALEmovmean = movmean(DTRIALS_MALE_Mean,[10 0]); %sliding trials of 10
DTRIALSMALEmovSEM= movmean(DTRIALS_MALE_SEM,[10 0]);

DTRIALSFEMALEmovmean = movmean(DTRIALS_FEMALE_Mean,[10 0]); %sliding trials of 10
DTRIALSFEMALEmovSEM= movmean(DTRIALS_FEMALE_SEM,[10 0]);

%%

figure 
plot(1:size(DTRIALSMALEmovmean),DTRIALSMALEmovmean,'color',[0.5, 0, 0.5],'LineStyle', '-');
hold on
plot(1:size(DTRIALSFEMALEmovmean),DTRIALSFEMALEmovmean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(DTRIALSMALEmovmean),DTRIALSMALEmovmean,DTRIALSMALEmovSEM, 'lineprops', {'color',[0.5, 0, 0.5],'LineStyle', '-'})
shadedErrorBar(1:length(DTRIALSFEMALEmovmean),DTRIALSFEMALEmovmean,DTRIALSFEMALEmovSEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 200],[0.5,0.5],'--k')
hold off

title('Male vs. Female Discrimination (100/0)')
legend ({'Male(n=11)','Female(n=13)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 200])
set(gca,'XTick',[0 50 100 150 200],'XTickLabel',{'0','50','100','150','200'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%Create R100 (R1 & R2) & R90 (R3 & R4) table from larger mat file 

R1Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==1,:)); 
R2Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==2,:)); 
R3Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==3,:)); 
R4Trials=(AO_resample.tbl_trials(AO_resample.tbl_trials.phase==4,:)); 

%%
%AB R1 
 
R1Trials_MALE=R1Trials(R1Trials.sex==1,:);  
R1Trials_FEMALE=R1Trials(R1Trials.sex==0,:); 

R1Trials_MALEMean=splitapply(@mean,R1Trials_MALE.CorrectPercent,R1Trials_MALE.ContTrial);
R1Trials_MALESEM=splitapply(@std,R1Trials_MALE.CorrectPercent,R1Trials_MALE.ContTrial)./sqrt(splitapply(@length,R1Trials_MALE.CorrectPercent,R1Trials_MALE.ContTrial));

R1Trials_FEMALEMean=splitapply(@mean,R1Trials_FEMALE.CorrectPercent,R1Trials_FEMALE.ContTrial);
R1Trials_FEMALESEM=splitapply(@std,R1Trials_FEMALE.CorrectPercent,R1Trials_FEMALE.ContTrial)./sqrt(splitapply(@length,R1Trials_FEMALE.CorrectPercent,R1Trials_FEMALE.ContTrial));

R1TrialsMALEmovmean = movmean(R1Trials_MALEMean,[10 0]); %sliding trials of 10
R1TrialsMALEmovSEM= movmean(R1Trials_MALESEM,[10 0]);

R1TrialsFEMALEmovmean = movmean(R1Trials_FEMALEMean,[10 0]); %sliding trials of 10
R1TrialsFEMALEmovSEM= movmean(R1Trials_FEMALESEM,[10 0]);

%%
%Plot figure 

figure 
plot(1:size(R1TrialsMALEmovmean),R1TrialsMALEmovmean,'color',[0.5, 0, 0.5],'LineStyle', '-');
hold on
plot(1:size(R1TrialsFEMALEmovmean),R1TrialsFEMALEmovmean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(R1TrialsMALEmovmean),R1TrialsMALEmovmean,R1TrialsMALEmovSEM, 'lineprops', {'color',[0.5, 0, 0.5],'LineStyle', '-'})
shadedErrorBar(1:length(R1TrialsFEMALEmovmean),R1TrialsFEMALEmovmean,R1TrialsFEMALEmovSEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 200],[0.5,0.5],'--k')
hold off
 
title('Male vs. Female R1 (100/0)')
legend ({'Male(n=11)','Female(n=13)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 200])
set(gca,'XTick',[0 50 100 150 200],'XTickLabel',{'0','50','100','150','200'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')


%%
%AB R2 
 
R2Trials_MALE=R2Trials(R2Trials.sex==1,:);  
R2Trials_FEMALE=R2Trials(R2Trials.sex==0,:); 

R2Trials_MALEMean=splitapply(@mean,R2Trials_MALE.CorrectPercent,R2Trials_MALE.ContTrial);
R2Trials_MALESEM=splitapply(@std,R2Trials_MALE.CorrectPercent,R2Trials_MALE.ContTrial)./sqrt(splitapply(@length,R2Trials_MALE.CorrectPercent,R2Trials_MALE.ContTrial));


R2Trials_FEMALEMean=splitapply(@mean,R2Trials_FEMALE.CorrectPercent,R2Trials_FEMALE.ContTrial);
R2Trials_FEMALESEM=splitapply(@std,R2Trials_FEMALE.CorrectPercent,R2Trials_FEMALE.ContTrial)./sqrt(splitapply(@length,R2Trials_FEMALE.CorrectPercent,R2Trials_FEMALE.ContTrial));


R2TrialsMALEmovmean = movmean(R2Trials_MALEMean,[10 0]); %sliding trials of 10
R2TrialsMALEmovSEM= movmean(R2Trials_MALESEM,[10 0]);

R2TrialsFEMALEmovmean = movmean(R2Trials_FEMALEMean,[10 0]); %sliding trials of 10
R2TrialsFEMALEmovSEM= movmean(R2Trials_FEMALESEM,[10 0]);


%%
%Plot figure 

figure 
plot(1:size(R2TrialsMALEmovmean),R2TrialsMALEmovmean,'color',[0.5, 0, 0.5],'LineStyle', '-');
hold on
plot(1:size(R2TrialsFEMALEmovmean),R2TrialsFEMALEmovmean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(R2TrialsMALEmovmean),R2TrialsMALEmovmean,R2TrialsMALEmovSEM, 'lineprops', {'color',[0.5, 0, 0.5],'LineStyle', '-'})
shadedErrorBar(1:length(R2TrialsFEMALEmovmean),R2TrialsFEMALEmovmean,R2TrialsFEMALEmovSEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 200],[0.5,0.5],'--k')
hold off
 
title('Male vs. Female R2 (100/0)')
legend ({'Male(n=11)','Female(n=13)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 200])
set(gca,'XTick',[0 50 100 150 200],'XTickLabel',{'0','50','100','150','200'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB R3 
 
R3Trials_MALE=R3Trials(R3Trials.sex==1,:);  
R3Trials_FEMALE=R3Trials(R3Trials.sex==0,:); 

R3Trials_MALEMean=splitapply(@mean,R3Trials_MALE.CorrectPercent,R3Trials_MALE.ContTrial);
R3Trials_MALESEM=splitapply(@std,R3Trials_MALE.CorrectPercent,R3Trials_MALE.ContTrial)./sqrt(splitapply(@length,R3Trials_MALE.CorrectPercent,R3Trials_MALE.ContTrial));


R3Trials_FEMALEMean=splitapply(@mean,R3Trials_FEMALE.CorrectPercent,R3Trials_FEMALE.ContTrial);
R3Trials_FEMALESEM=splitapply(@std,R3Trials_FEMALE.CorrectPercent,R3Trials_FEMALE.ContTrial)./sqrt(splitapply(@length,R3Trials_FEMALE.CorrectPercent,R3Trials_FEMALE.ContTrial));


R3TrialsMALEmovmean = movmean(R3Trials_MALEMean,[10 0]); %sliding trials of 10
R3TrialsMALEmovSEM= movmean(R3Trials_MALESEM,[10 0]);

R3TrialsFEMALEmovmean = movmean(R3Trials_FEMALEMean,[10 0]); %sliding trials of 10
R3TrialsFEMALEmovSEM= movmean(R3Trials_FEMALESEM,[10 0]);

%%
%Plot figure 

figure 
plot(1:size(R3TrialsMALEmovmean),R3TrialsMALEmovmean,'color',[0.5, 0, 0.5],'LineStyle', '-');
hold on
plot(1:size(R3TrialsFEMALEmovmean),R3TrialsFEMALEmovmean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(R3TrialsMALEmovmean),R3TrialsMALEmovmean,R3TrialsMALEmovSEM, 'lineprops', {'color',[0.5, 0, 0.5],'LineStyle', '-'})
shadedErrorBar(1:length(R3TrialsFEMALEmovmean),R3TrialsFEMALEmovmean,R3TrialsFEMALEmovSEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 200],[0.5,0.5],'--k')
hold off
 
title('Male vs. Female R3 (90/10)')
legend ({'Male(n=11)','Female(n=13)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 200])
set(gca,'XTick',[0 50 100 150 200],'XTickLabel',{'0','50','100','150','200'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')

%%
%AB R4 
 
R4Trials_MALE=R4Trials(R4Trials.sex==1,:);  
R4Trials_FEMALE=R4Trials(R4Trials.sex==0,:); 

R4Trials_MALEMean=splitapply(@mean,R4Trials_MALE.CorrectPercent,R4Trials_MALE.ContTrial);
R4Trials_MALESEM=splitapply(@std,R4Trials_MALE.CorrectPercent,R4Trials_MALE.ContTrial)./sqrt(splitapply(@length,R4Trials_MALE.CorrectPercent,R4Trials_MALE.ContTrial));


R4Trials_FEMALEMean=splitapply(@mean,R4Trials_FEMALE.CorrectPercent,R4Trials_FEMALE.ContTrial);
R4Trials_FEMALESEM=splitapply(@std,R4Trials_FEMALE.CorrectPercent,R4Trials_FEMALE.ContTrial)./sqrt(splitapply(@length,R4Trials_FEMALE.CorrectPercent,R4Trials_FEMALE.ContTrial));


R4TrialsMALEmovmean = movmean(R4Trials_MALEMean,[10 0]); %sliding trials of 10
R4TrialsMALEmovSEM= movmean(R4Trials_MALESEM,[10 0]);

R4TrialsFEMALEmovmean = movmean(R4Trials_FEMALEMean,[10 0]); %sliding trials of 10
R4TrialsFEMALEmovSEM= movmean(R4Trials_FEMALESEM,[10 0]);

%%
%Plot figure 

figure 
plot(1:size(R4TrialsMALEmovmean),R4TrialsMALEmovmean,'color',[0.5, 0, 0.5],'LineStyle', '-');
hold on
plot(1:size(R4TrialsFEMALEmovmean),R4TrialsFEMALEmovmean,'color',[0.5, 0.5, 0.5],'LineStyle','-');
shadedErrorBar(1:length(R4TrialsMALEmovmean),R4TrialsMALEmovmean,R4TrialsMALEmovSEM, 'lineprops', {'color',[0.5, 0, 0.5],'LineStyle', '-'})
shadedErrorBar(1:length(R4TrialsFEMALEmovmean),R4TrialsFEMALEmovmean,R4TrialsFEMALEmovSEM, 'lineprops', {'color',[0.5, 0.5, 0.5],'LineStyle','-'})

plot([0 200],[0.5,0.5],'--k')
hold off
 
title('Male vs. Female R4 (90/10)')
legend ({'Male(n=11)','Female(n=13)'}, 'Location','southeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1],'YTickLabel', {'0','.25','.50','.75','1'},'fontsize', 18,'fontname','Arial','FontWeight','bold');
xlim([1 200])
set(gca,'XTick',[0 50 100 150 200],'XTickLabel',{'0','50','100','150','200'},'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1.5); 
ylabel({'P(Correct)'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
xlabel({'Trials'},'FontSize',20,'FontName','Arial','FontWeight','bold'); 
set(gcf,'color','w');
pbaspect([1.5 1 1])
set(gca,'box','off')
