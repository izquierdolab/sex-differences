clear, clc
close all

load('SEX_AB_DATA.mat')

%%
%DISCRIMINATION LEARNING
DIStrials  = AO_resample.tbl_trials(AO_resample.tbl_trials.phase==0 & AO_resample.tbl_trials.day<=2,:); 

'Percent Correct (Full Model- DISCRIM TRIALS)'
glmepc = fitglme(DIStrials,'CorrectPercent~1+ContTrial+sex+(1+ContTrial|rati)')

%%
%DISCRIMINATION INOMS & REWARDS (2 days)
DIS  = AO_resample.tbl(AO_resample.tbl.phase==0,:); 

'Rewards (DIS)'
glmerew = fitglme(DIS,'rew_2day~1+sex+(1|rati)')

'Initiation Omissions (DIS)'
glmeinom = fitglme(DIS,'inom_2day~1+sex+(1|rati)')

%%
%DISCRIMINATION Latencies & WSLS

'Initiation Latencies (DIS)'
glmeinlatmed = fitglme(DIS,'inlatmed~1+sex+(1|rati)')

'Correct Choice Latencies (DIS)'
glmecorrlatmed = fitglme(DIS,'corrlatmed~1+sex+(1|rati)')

'Incorrect Choice Latencies (DIS))'
glmeincorrlatmed = fitglme(DIS,'incorrlatmed~1+sex+(1|rati)')

'Reward Latencies (DIS)'
glmerewlatmed = fitglme(DIS,'rewlatmed~1+sex+(1|rati)')

'Win-Stay (DIS)'
glmewstay_stim = fitglme(DIS,'wstay_stim~1+sex+(1|rati)')

'Lose-Shift (DIS)'
glmelshift_stim = fitglme(DIS,'lshift_stim~1+sex+(1|rati)')  

%%
%REVERSAL LEARNING (R1-R4)
REVtrials  = AO_resample.tbl_trials(AO_resample.tbl_trials.day<=2 & AO_resample.tbl_trials.phase~=0 & AO_resample.tbl_trials.phase<=4,:); 

'Percent Correct (D1-D2 Trials- Full Model)'
glmepc = fitglme(REVtrials,'CorrectPercent~1+drug+TrialNumber+day*phase*sex+(1+TrialNumber+day*phase|rati)')

%%
%REVERSAL: REWARDS, INITIATION OMISSIONS- BY DAY
REVdays  = AO_resample.tbl_day(AO_resample.tbl_day.day<=2 & AO_resample.tbl_day.phase~=0 & AO_resample.tbl_day.phase<=4,:); 
REV_D1  = REVdays(REVdays.day==1,:); 
REV_D2  = REVdays(REVdays.day==2,:);

'Initiation Omission (D1-D2)'
glme_inom = fitglme(REVdays,'inom_day~1+day+phase*sex+drug+(1+day+phase|rati)')

    'Initiation Omission (D1)'
    glme_inom = fitglme(REV_D1,'inom_day~1+phase*sex+drug+(1+phase|rati)')
    
    'Initiation Omission (D2)'
    glme_inom = fitglme(REV_D2,'inom_day~1+phase*sex+drug+(1+phase|rati)')


'Rewards (D1-D2)'
glme_rew = fitglme(REVdays,'rew_day~1+day+phase*sex+drug+(1+day+phase|rati)')

    'Rewards (D1)'
    glme_rew = fitglme(REV_D1,'rew_day~1+phase*sex+drug+(1+phase|rati)')
    
    'Rewards (D2)'
    glme_rew = fitglme(REV_D2,'rew_day~1+phase*sex+drug+(1+phase|rati)')


%%
%REVERSALS: INITIATION LATENCIES- by day
REV_INLATdays  = INLATday(INLATday.day<=2 & INLATday.phase~=0 & INLATday.phase<=4,:); 
REV_INLATD1  = REV_INLATdays(REV_INLATdays.day==1,:); 
REV_INLATD2  = REV_INLATdays(REV_INLATdays.day==2,:); 

'Initiation Latencies (D1-D2)'
glme_inlat = fitglme(REV_INLATdays,'INLATmean~1+day+phase*sex+drug+(1+day+phase|rati)')

    'Initiation Latencies (D1)'
    glme_inlat = fitglme(REV_INLATD1,'INLATmean~1+phase*sex+drug+(1+phase|rati)')
    
    'Initiation Latencies (D2)'
    glme_inlat = fitglme(REV_INLATD2,'INLATmean~1+phase*sex+drug+(1+phase|rati)')


%%
%REVERSAL: INOMS & REWARDS (2 days)
REV  = AO_resample.tbl(AO_resample.tbl.phase~=0 & AO_resample.tbl.phase<=4,:); 

'Rewards (R1-R4)'
glme_rew = fitglme(REV,'rew_2day~1+phase*sex+drug+(1+phase|rati)')

'Initiation Omission (R1-R4)'
glme_inom = fitglme(REV,'inom_2day~1+phase*sex+drug+(1+phase|rati)')

%%
%REVERSAL Latencies & WSLS

'Initiation Latencies (R1-R4)'
glmeinlatmed = fitglme(REV,'inlatmed~1+phase*sex+drug+(1+phase|rati)')

'Correct Choice Latencies (R1-R4)'
glmecorrlatmed = fitglme(REV,'corrlatmed~1+phase*sex+drug+(1+phase|rati)')

'Incorrect Choice Latencies (R1-R4))'
glmeincorrlatmed = fitglme(REV,'incorrlatmed~1+phase*sex+drug+(1+phase|rati)')

'Reward Latencies (R1-R4)'
glmerewlatmed = fitglme(REV,'rewlatmed~1+phase*sex+drug+(1+phase|rati)')

'Win-Stay (R1-R4)'
glmewstay_stim = fitglme(REV,'wstay_stim~1+phase*sex+drug+(1+phase|rati)')

'Lose-Shift (R1-R4)*'
glmelshift_stim = fitglme(REV,'lshift_stim~1+phase*sex+drug+(1+phase|rati)')  

