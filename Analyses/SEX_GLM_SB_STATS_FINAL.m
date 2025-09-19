clear, clc
close all

load('SEX_SB_DATA.mat')

%%
%DISCRIMINATION LEARNING
DISdays  = SO_resample.tbl_day(SO_resample.tbl_day.phase==0 & SO_resample.tbl_day.day<=5,:); 

'Percent Correct  (Full Model - DIS)'
glmepc = fitglme(DISdays,'CorrectPercent~1+day+sex+(1+day|rati)')

%%
%DISCRIMINATION INOMS & REWARDS 
DIS  = SO_resample.tbl(SO_resample.tbl.phase==0,:); 

'Rewards (DIS)'
glmerew = fitglme(DIS,'rew_5day~1+sex+(1|rati)')

'Initiation Omissions (DIS)'
glminom = fitglme(DIS,'inom_5day~1+sex+(1|rati)')

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
%REVERSAL LEARNING, REWARDS, INITIATION OMISSIONS- BY DAY
REVdays  = SO_resample.tbl_day(SO_resample.tbl_day.phase~=0 & SO_resample.tbl_day.day<=5,:); 
REVD1  = REVdays(REVdays.day==1,:);
REVD5  = REVdays(REVdays.day==5,:); 

'Percent Correct (Full Model)'
glmepc = fitglme(REVdays,'CorrectPercent~1+day+phase*sex+drug+(1+day+phase|rati)')


'Rewards (Full Model)'
glmerew = fitglme(REVdays,'rew_day~1+day+phase*sex+drug+(1+day+phase|rati)')

    'Rewards D1'
    glmerew = fitglme(REVD1,'rew_day~1+phase*sex+drug+(1+phase|rati)')

    'Rewards D5'
    glmerew = fitglme(REVD5,'rew_day~1+phase*sex+drug+(1+phase|rati)')


'Initiation Omissions (Full Model)'
glmeinom = fitglme(REVdays,'inom_day~1+day+phase*sex+drug+(1+day+phase|rati)')

    'Initiation Omissions D1'
    glmeinom = fitglme(REVD1,'inom_day~1+phase*sex+drug+(1+phase|rati)')

    'Initiation Omissions D5'
    glmeinom = fitglme(REVD5,'inom_day~1+phase*sex+drug+(1+phase|rati)')

%%
%REVERSALS (R1-R4) INITIATION LATENCIES- by day
REV_INLATdays  = INLATday(INLATday.day<=5 & INLATday.phase~=0,:); 
REV_INLATD1  = REV_INLATdays(REV_INLATdays.day==1,:);  
REV_INLATD5  = REV_INLATdays(REV_INLATdays.day==5,:); 

'Initiation Latencies (D1-D5)'
glme_inlat = fitglme(REV_INLATdays,'INLATmean~1+day+phase*sex+drug+(1+day+phase|rati)')

'Initiation Latencies (D1)'
glme_inlat = fitglme(REV_INLATD1,'INLATmean~1+phase*sex+drug+(1+phase|rati)')

'Initiation Latencies (D5)'
glme_inlat = fitglme(REV_INLATD5,'INLATmean~1+phase*sex+drug+(1+phase|rati)')


%%
%REVERSALS- INOMS & REWARDS 
REV  = SO_resample.tbl(SO_resample.tbl.phase~=0,:); 

'Rewards (Full Model)'
glmerew = fitglme(REV,'rew_5day~1+phase*sex+drug+(1+phase|rati)')

'Initiation Omissions(Full Model)'
glmeinom = fitglme(REV,'inom_5day~1+phase*sex+drug+(1+phase|rati)')

%%
%REVERSALS- Latencies & WSLS

'Initiation Latencies (All Days- Full Model)'
glmeinlat = fitglme(REV,'inlatmed~1+phase*sex+drug+(1+phase|rati)')

'Correct Choice Latencies (All Days- Full Model)'
glmecorrlatmed = fitglme(REV,'corrlatmed~1+phase*sex+drug+(1+phase|rati)')

'Incorrect Choice Latencies (All Days- Full Model)'
glmeincorrlatmed = fitglme(REV,'incorrlatmed~1+phase*sex+drug+(1+phase|rati)')

'Reward Latencies (All Days- Full Model)'
glmerewlatmed = fitglme(REV,'rewlatmed~1+phase*sex+drug+(1+phase|rati)')

'Win-Stay (All Days- Full Model)'
glmewstay_stim = fitglme(REV,'wstay_stim~1+phase*sex+drug+(1+phase|rati)')

'Lose-Shift (All Days- Full Model)'
glmelshift_stim = fitglme(REV,'lshift_stim~1+phase*sex+drug+(1+phase|rati)')
