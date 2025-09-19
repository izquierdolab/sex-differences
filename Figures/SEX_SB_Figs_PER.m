clear, clc
close all

load('SEX_EGFP_SB_CLEAN.mat')

%%
%set figure colors 

MaleDarkSB = [0.8500, 0.3250, 0.0980]; %dark orange
FemaleDarkSB=[105 105 105]./255; %dark grey
MaleLightSB=[1.0000, 0.8000, 0.6000]; %light 
FemaleLightSB=[224 224 224]./255; %light grey
   
%%
%Create table from larger mat file 
REV=(SO_resample.tbl(SO_resample.tbl.phase~=0,:));  
REVday=(SO_resample.tbl_day(SO_resample.tbl_day.phase~=0,:));  
REVD1=(REVday(REVday.day==1,:)); 
REVD5=(REVday(REVday.day==5,:)); 

%%
%Create INOM data tables 
MALE_REVINOM=REV(REV.sex==1,'inom_5day'); 
FEMALE_REVINOM=REV(REV.sex==0,'inom_5day'); 

%convert tables to array with numerical values 
MALE_REVINOM = table2array(MALE_REVINOM);
FEMALE_REVINOM = table2array(FEMALE_REVINOM);

%remove any NaNs in array 
MALE_REVINOM(isnan(MALE_REVINOM))=[];
FEMALE_REVINOM(isnan(FEMALE_REVINOM))=[];

%Calculate Means & SEMs

%FEMALE 
FEMALE_REVINOMMean = mean(FEMALE_REVINOM); %calculate mean 
FEMALE_REVINOMSTD = std(FEMALE_REVINOM); %calculate std
FEMALE_REVINOMSEM = FEMALE_REVINOMSTD./sqrt(height(FEMALE_REVINOM)); %calculate SEM

%MALE 
MALE_REVINOMMean = mean(MALE_REVINOM); %calculate mean 
MALE_REVINOMSTD = std(MALE_REVINOM); %calculate std
MALE_REVINOMSEM = MALE_REVINOMSTD./sqrt(height(MALE_REVINOM)); %calculate SEM

%%

figure
b1=bar(1,MALE_REVINOMMean,'BarWidth',1.5,'LineWidth',1);
hold on
s1 = scatter(ones(length(MALE_REVINOM(:,1)),1),MALE_REVINOM(:,1),'ko'); %creates individual datapoint/animal
hold on
b2=bar(2,0); %space in between bars
hold on
b3=bar(3,FEMALE_REVINOMMean,'BarWidth',1.5,'LineWidth',1);
hold on
s3 = scatter(3*ones(length(FEMALE_REVINOM(:,1)),1),FEMALE_REVINOM(:,1),'ko'); %creates individual datapoint/animal
hold on
b4=bar(4,0); %space in between bars
hold on


hold off
b1.FaceColor =MaleDarkSB;
b1.EdgeColor = [0 0 0]./255;

s1.MarkerFaceColor=MaleLightSB;
s1.MarkerEdgeColor = [0 0 0]./255;

b3.FaceColor =FemaleDarkSB;
b3.EdgeColor = [0 0 0]./255;

s3.MarkerFaceColor=FemaleLightSB;
s3.MarkerEdgeColor = [0 0 0]./255;

title ('Initiation Omissions (All Reversals)')    
ylabel('Initiation Omissions','FontSize',20,'FontName','Arial','FontWeight','bold')
xlim([0 4])
set(gca,'XTick',[1 3],'XTickLabel',{'Male','Female'},'XTickLabelRotation',0,'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylim([0 150])
set(gca,'YTick',[0 50 100 150],'YTickLabel', {'0','50','100','150'}, 'fontsize',18,'fontname','Arial','FontWeight','bold');
set(gca,'LineWidth',1.5);
box off 
pbaspect([1 1.36 1])
set(gcf,'color','w');
%%
%Calculate INOM mean by day 

%Create INOM data tables 
MALE_REVD1INOM=REVD1(REVD1.sex==1,'inom_day'); 
FEMALE_REVD1INOM=REVD1(REVD1.sex==0,'inom_day'); 
MALE_REVD5INOM=REVD5(REVD5.sex==1,'inom_day'); 
FEMALE_REVD5INOM=REVD5(REVD5.sex==0,'inom_day'); 

%convert tables to array with numerical values 
MALE_REVD1INOM = table2array(MALE_REVD1INOM);
FEMALE_REVD1INOM = table2array(FEMALE_REVD1INOM);
MALE_REVD5INOM = table2array(MALE_REVD5INOM);
FEMALE_REVD5INOM = table2array(FEMALE_REVD5INOM);

%remove any NaNs in array 
MALE_REVD1INOM(isnan(MALE_REVD1INOM))=[];
FEMALE_REVD1INOM(isnan(FEMALE_REVD1INOM))=[];
MALE_REVD5INOM(isnan(MALE_REVD5INOM))=[];
FEMALE_REVD5INOM(isnan(FEMALE_REVD5INOM))=[];

%Calculate Means & SEMs

%FEMALE 
FEMALE_REVD1INOMMean = mean(FEMALE_REVD1INOM); %calculate mean 
FEMALE_REVD1INOMSTD = std(FEMALE_REVD1INOM); %calculate std
FEMALE_REVD1INOMSEM = FEMALE_REVD1INOMSTD./sqrt(height(FEMALE_REVD1INOM)); %calculate SEM

FEMALE_REVD5INOMMean = mean(FEMALE_REVD5INOM); %calculate mean 
FEMALE_REVD5INOMSTD = std(FEMALE_REVD5INOM); %calculate std
FEMALE_REVD5INOMSEM = FEMALE_REVD5INOMSTD./sqrt(height(FEMALE_REVD5INOM)); %calculate SEM


%MALE 
MALE_REVD1INOMMean = mean(MALE_REVD1INOM); %calculate mean 
MALE_REVD1INOMSTD = std(MALE_REVD1INOM); %calculate std
MALE_REVD1INOMSEM = MALE_REVD1INOMSTD./sqrt(height(MALE_REVD1INOM)); %calculate SEM

MALE_REVD5INOMMean = mean(MALE_REVD5INOM); %calculate mean 
MALE_REVD5INOMSTD = std(MALE_REVD5INOM); %calculate std
MALE_REVD5INOMSEM = MALE_REVD5INOMSTD./sqrt(height(MALE_REVD5INOM)); %calculate SEM


%%
%Plot INOM male vs. female (all reversals) - by day 

figure

b1=bar(1,0); 
hold on
b2=bar(2,MALE_REVD1INOMMean,'BarWidth',1.5,'LineWidth',1);
hold on
s2 = scatter(2*ones(length(MALE_REVD1INOM(:,1)),1),MALE_REVD1INOM(:,1),'ko'); %creates individual datapoint/animal
hold on
b3=bar(3,0); %space in between bars
hold on
b4=bar(4,FEMALE_REVD1INOMMean,'BarWidth',1.5,'LineWidth',1);
hold on
s4 = scatter(4*ones(length(FEMALE_REVD1INOM(:,1)),1),FEMALE_REVD1INOM(:,1),'ko'); %creates individual datapoint/animal
hold on
b5=bar(5,0); 
hold on
b6=bar(6,0); 
hold on
b7=bar(7,MALE_REVD5INOMMean,'BarWidth',1.5,'LineWidth',1);
hold on
s7 = scatter(7*ones(length(MALE_REVD5INOM(:,1)),1),MALE_REVD5INOM(:,1),'ko'); %creates individual datapoint/animal
hold on
b8=bar(8,0); %space in between bars
hold on
b9=bar(9,FEMALE_REVD5INOMMean,'BarWidth',1.5,'LineWidth',1);
hold on
s9 = scatter(9*ones(length(FEMALE_REVD5INOM(:,1)),1),FEMALE_REVD5INOM(:,1),'ko'); %creates individual datapoint/animal
hold on

hold off
b2.FaceColor =MaleDarkSB;
b2.EdgeColor = [0 0 0]./255;

s2.MarkerFaceColor=MaleLightSB;
s2.MarkerEdgeColor = [0 0 0]./255;

b4.FaceColor =FemaleDarkSB;
b4.EdgeColor = [0 0 0]./255;

s4.MarkerFaceColor=FemaleLightSB;
s4.MarkerEdgeColor = [0 0 0]./255;

b7.FaceColor =MaleLightSB;
b7.EdgeColor = [0 0 0]./255;

s7.MarkerFaceColor=MaleDarkSB;
s7.MarkerEdgeColor = [0 0 0]./255;

b9.FaceColor =FemaleLightSB;
b9.EdgeColor = [0 0 0]./255;

s9.MarkerFaceColor=FemaleDarkSB;
s9.MarkerEdgeColor = [0 0 0]./255;


title ('Initiation Omissions (R1-R4)')    
legend ([b2(1) b4(1)],{'Male','Female'}, 'Location','northeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylabel('Initiation Omissions','FontSize',20,'FontName','Arial','FontWeight','bold')
xlim([0 10])
set(gca,'XTick',[0 3 8],'XTickLabel',{'','Session 1','Session 5'},'XTickLabelRotation',0,'fontsize',12,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylim([0 60])
set(gca,'YTick',[0 15 30 45 60],'YTickLabel', {'0','15','30','45','60'}, 'fontsize',18,'fontname','Arial','FontWeight','bold');
set(gca,'LineWidth',1.5);
box off 
% pbaspect([1 1.36 1])
set(gcf,'color','w');

%%
%Create tables 
REV_INLAT=(INLATday(INLATday.phase~=0 & INLATday.day<=5,:)); 
REVmale_INLAT=(REV_INLAT(REV_INLAT.sex==1,'INLATmean')); 
REVfemale_INLAT=(REV_INLAT(REV_INLAT.sex==0,'INLATmean')); 

%convert tables to array with numerical values 
REVmale_INLAT = table2array(REVmale_INLAT);
REVfemale_INLAT = table2array(REVfemale_INLAT);

%remove any NaNs in array 
REVmale_INLAT(isnan(REVmale_INLAT))=[];
REVfemale_INLAT(isnan(REVfemale_INLAT))=[];

%Calculate Means & SEMs

%MALE 
REVmale_INLATMean = mean(REVmale_INLAT); %calculate mean 
REVmale_INLATSTD = std(REVmale_INLAT); %calculate std
REVmale_INLATSEM = REVmale_INLATSTD./sqrt(height(REVmale_INLAT)); %calculate SEM

%FEMALE
REVfemale_INLATMean = mean(REVfemale_INLAT); %calculate mean 
REVfemale_INLATSTD = std(REVfemale_INLAT); %calculate std
REVfemale_INLATSEM = REVfemale_INLATSTD./sqrt(height(REVfemale_INLAT)); %calculate SEM

%%

figure
b1=bar(1,REVmale_INLATMean,'BarWidth',1.5,'LineWidth',1);
hold on
s1 = scatter(ones(length(REVmale_INLAT(:,1)),1),REVmale_INLAT(:,1),'ko'); %creates individual datapoint/animal
hold on
b2=bar(2,0); %space in between bars
hold on
b3=bar(3,REVfemale_INLATMean,'BarWidth',1.5,'LineWidth',1);
hold on
s3 = scatter(3*ones(length(REVfemale_INLAT(:,1)),1),REVfemale_INLAT(:,1),'ko'); %creates individual datapoint/animal
hold on
b4=bar(4,0); %space in between bars
hold on


hold off
b1.FaceColor =MaleDarkSB;
b1.EdgeColor = [0 0 0]./255;

s1.MarkerFaceColor=MaleLightSB;
s1.MarkerEdgeColor = [0 0 0]./255;

b3.FaceColor =FemaleDarkSB;
b3.EdgeColor = [0 0 0]./255;

s3.MarkerFaceColor=FemaleLightSB;
s3.MarkerEdgeColor = [0 0 0]./255;

title ('Initiation Latencies (All Reversals)')  
ylabel('Initiation Latencies(s)','FontSize',20,'FontName','Arial','FontWeight','bold')
xlim([0 4])
set(gca,'XTick',[1 3],'XTickLabel',{'Male','Female'},'XTickLabelRotation',0,'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylim([0 16])
set(gca,'YTick',[0 4 8 12 16],'YTickLabel', {'0','4','8','12','16'}, 'fontsize',18,'fontname','Arial','FontWeight','bold');
set(gca,'LineWidth',1.5);
box off 
pbaspect([1 1.36 1])
set(gcf,'color','w');

%%
%Create table from larger mat file 
REVD1_INLAT=(INLATday(INLATday.day==1,:)); 
REVD5_INLAT=(INLATday(INLATday.day==5,:)); 

%Create INLAT data tables 
MALE_REVD1_INLAT=REVD1_INLAT(REVD1_INLAT.sex==1,'INLATmean'); 
FEMALE_REVD1_INLAT=REVD1_INLAT(REVD1_INLAT.sex==0,'INLATmean'); 
MALE_REVD5_INLAT=REVD5_INLAT(REVD5_INLAT.sex==1,'INLATmean'); 
FEMALE_REVD5_INLAT=REVD5_INLAT(REVD5_INLAT.sex==0,'INLATmean'); 

%convert tables to array with numerical values 
MALE_REVD1_INLAT = table2array(MALE_REVD1_INLAT);
FEMALE_REVD1_INLAT = table2array(FEMALE_REVD1_INLAT);
MALE_REVD5_INLAT = table2array(MALE_REVD5_INLAT);
FEMALE_REVD5_INLAT = table2array(FEMALE_REVD5_INLAT);

%remove any NaNs in array 
MALE_REVD1_INLAT(isnan(MALE_REVD1_INLAT))=[];
FEMALE_REVD1_INLAT(isnan(FEMALE_REVD1_INLAT))=[];
MALE_REVD5_INLAT(isnan(MALE_REVD5_INLAT))=[];
FEMALE_REVD5_INLAT(isnan(FEMALE_REVD5_INLAT))=[];

%Calculate Means & SEMs

%FEMALE 
FEMALE_REVD1_INLATMean = mean(FEMALE_REVD1_INLAT); %calculate mean 
FEMALE_REVD1_INLATSTD = std(FEMALE_REVD1_INLAT); %calculate std
FEMALE_REVD1_INLATSEM = FEMALE_REVD1_INLATSTD./sqrt(height(FEMALE_REVD1_INLAT)); %calculate SEM

FEMALE_REVD5_INLATMean = mean(FEMALE_REVD5_INLAT); %calculate mean 
FEMALE_REVD5_INLATSTD = std(FEMALE_REVD5_INLAT); %calculate std
FEMALE_REVD5_INLATSEM = FEMALE_REVD5_INLATSTD./sqrt(height(FEMALE_REVD5_INLAT)); %calculate SEM

%MALE 
MALE_REVD1_INLATMean = mean(MALE_REVD1_INLAT); %calculate mean 
MALE_REVD1_INLATSTD = std(MALE_REVD1_INLAT); %calculate std
MALE_REVD1_INLATSEM = MALE_REVD1_INLATSTD./sqrt(height(MALE_REVD1_INLAT)); %calculate SEM

MALE_REVD5_INLATMean = mean(MALE_REVD5_INLAT); %calculate mean 
MALE_REVD5_INLATSTD = std(MALE_REVD5_INLAT); %calculate std
MALE_REVD5_INLATSEM = MALE_REVD5_INLATSTD./sqrt(height(MALE_REVD5_INLAT)); %calculate SEM

%%
%Plot INLAT male vs. female (all reversals) - by day 

figure

b1=bar(1,0); 
hold on
b2=bar(2,MALE_REVD1_INLATMean,'BarWidth',1.5,'LineWidth',1);
hold on
s2 = scatter(2*ones(length(MALE_REVD1_INLAT(:,1)),1),MALE_REVD1_INLAT(:,1),'ko'); %creates individual datapoint/animal
hold on
b3=bar(3,0); %space in between bars
hold on
b4=bar(4,FEMALE_REVD1_INLATMean,'BarWidth',1.5,'LineWidth',1);
hold on
s4 = scatter(4*ones(length(FEMALE_REVD1_INLAT(:,1)),1),FEMALE_REVD1_INLAT(:,1),'ko'); %creates individual datapoint/animal
hold on
b5=bar(5,0); 
hold on
b6=bar(6,0); 
hold on
b7=bar(7,MALE_REVD5_INLATMean,'BarWidth',1.5,'LineWidth',1);
hold on
s7 = scatter(7*ones(length(MALE_REVD5_INLAT(:,1)),1),MALE_REVD5_INLAT(:,1),'ko'); %creates individual datapoint/animal
hold on
b8=bar(8,0); %space in between bars
hold on
b9=bar(9,FEMALE_REVD5_INLATMean,'BarWidth',1.5,'LineWidth',1);
hold on
s9 = scatter(9*ones(length(FEMALE_REVD5_INLAT(:,1)),1),FEMALE_REVD5_INLAT(:,1),'ko'); %creates individual datapoint/animal
hold on

hold off
b2.FaceColor =MaleDarkSB;
b2.EdgeColor = [0 0 0]./255;

s2.MarkerFaceColor=MaleLightSB;
s2.MarkerEdgeColor = [0 0 0]./255;

b4.FaceColor =FemaleDarkSB;
b4.EdgeColor = [0 0 0]./255;

s4.MarkerFaceColor=FemaleLightSB;
s4.MarkerEdgeColor = [0 0 0]./255;

b7.FaceColor =MaleLightSB;
b7.EdgeColor = [0 0 0]./255;

s7.MarkerFaceColor=MaleDarkSB;
s7.MarkerEdgeColor = [0 0 0]./255;

b9.FaceColor =FemaleLightSB;
b9.EdgeColor = [0 0 0]./255;

s9.MarkerFaceColor=FemaleDarkSB;
s9.MarkerEdgeColor = [0 0 0]./255;


title ('Initiation Latencies (R1-R4)')    
legend ([b2(1) b4(1)],{'Male','Female'}, 'Location','northeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylabel('Initiation Latencies(s)','FontSize',20,'FontName','Arial','FontWeight','bold')
xlim([0 10])
set(gca,'XTick',[0 3 8],'XTickLabel',{'','Session 1','Session 5'},'XTickLabelRotation',0,'fontsize',12,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylim([0 16])
set(gca,'YTick',[0 4 8 12 16],'YTickLabel', {'0','4','8','12','16'}, 'fontsize',18,'fontname','Arial','FontWeight','bold');
set(gca,'LineWidth',1.5);
box off 
% pbaspect([1 1.36 1])
set(gcf,'color','w');

%%

%Create REWARDS data tables 
MALE_REVREW=REV(REV.sex==1,'rew_5day'); 
FEMALE_REVREW=REV(REV.sex==0,'rew_5day'); 

%convert tables to array with numerical values 
MALE_REVREW = table2array(MALE_REVREW);
FEMALE_REVREW = table2array(FEMALE_REVREW);

%remove any NaNs in array 
MALE_REVREW(isnan(MALE_REVREW))=[];
FEMALE_REVREW(isnan(FEMALE_REVREW))=[];

%Calculate Means & SEMs

%FEMALE 
FEMALE_REVREWMean = mean(FEMALE_REVREW); %calculate mean 
FEMALE_REVREWSTD = std(FEMALE_REVREW); %calculate std
FEMALE_REVREWSEM = FEMALE_REVREWSTD./sqrt(height(FEMALE_REVREW)); %calculate SEM

%MALE 
MALE_REVREWMean = mean(MALE_REVREW); %calculate mean 
MALE_REVREWSTD = std(MALE_REVREW); %calculate std
MALE_REVREWSEM = MALE_REVREWSTD./sqrt(height(MALE_REVREW)); %calculate SEM

%%

figure
b1=bar(1,MALE_REVREWMean,'BarWidth',1.5,'LineWidth',1);
hold on
s1 = scatter(ones(length(MALE_REVREW(:,1)),1),MALE_REVREW(:,1),'ko'); %creates individual datapoint/animal
hold on
b2=bar(2,0); %space in between bars
hold on
b3=bar(3,FEMALE_REVREWMean,'BarWidth',1.5,'LineWidth',1);
hold on
s3 = scatter(3*ones(length(FEMALE_REVREW(:,1)),1),FEMALE_REVREW(:,1),'ko'); %creates individual datapoint/animal
hold on
b4=bar(4,0); %space in between bars
hold on


hold off
b1.FaceColor =MaleDarkSB;
b1.EdgeColor = [0 0 0]./255;

s1.MarkerFaceColor=MaleLightSB;
s1.MarkerEdgeColor = [0 0 0]./255;

b3.FaceColor =FemaleDarkSB;
b3.EdgeColor = [0 0 0]./255;

s3.MarkerFaceColor=FemaleLightSB;
s3.MarkerEdgeColor = [0 0 0]./255;

title ('Rewards (All Reversals)')    
ylabel('Rewards Collected','FontSize',20,'FontName','Arial','FontWeight','bold')
xlim([0 4])
set(gca,'XTick',[1 3],'XTickLabel',{'Male','Female'},'XTickLabelRotation',0,'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylim([0 800])
set(gca,'YTick',[0 200 400 600 800],'YTickLabel', {'0','200','400','600','800'}, 'fontsize',18,'fontname','Arial','FontWeight','bold');
set(gca,'LineWidth',1.5);
box off 
pbaspect([1 1.36 1])
set(gcf,'color','w');


%%
%Calculate REW mean by day 

%Create REW data tables 
MALE_REVD1REW=REVD1(REVD1.sex==1,'rew_day'); 
FEMALE_REVD1REW=REVD1(REVD1.sex==0,'rew_day'); 
MALE_REVD5REW=REVD5(REVD5.sex==1,'rew_day'); 
FEMALE_REVD5REW=REVD5(REVD5.sex==0,'rew_day'); 

%convert tables to array with numerical values 
MALE_REVD1REW = table2array(MALE_REVD1REW);
FEMALE_REVD1REW = table2array(FEMALE_REVD1REW);
MALE_REVD5REW = table2array(MALE_REVD5REW);
FEMALE_REVD5REW = table2array(FEMALE_REVD5REW);

%remove any NaNs in array 
MALE_REVD1REW(isnan(MALE_REVD1REW))=[];
FEMALE_REVD1REW(isnan(FEMALE_REVD1REW))=[];
MALE_REVD5REW(isnan(MALE_REVD5REW))=[];
FEMALE_REVD5REW(isnan(FEMALE_REVD5REW))=[];

%Calculate Means & SEMs

%FEMALE 
FEMALE_REVD1REWMean = mean(FEMALE_REVD1REW); %calculate mean 
FEMALE_REVD1REWSTD = std(FEMALE_REVD1REW); %calculate std
FEMALE_REVD1REWSEM = FEMALE_REVD1REWSTD./sqrt(height(FEMALE_REVD1REW)); %calculate SEM

FEMALE_REVD5REWMean = mean(FEMALE_REVD5REW); %calculate mean 
FEMALE_REVD5REWSTD = std(FEMALE_REVD5REW); %calculate std
FEMALE_REVD5REWSEM = FEMALE_REVD5REWSTD./sqrt(height(FEMALE_REVD5REW)); %calculate SEM


%MALE 
MALE_REVD1REWMean = mean(MALE_REVD1REW); %calculate mean 
MALE_REVD1REWSTD = std(MALE_REVD1REW); %calculate std
MALE_REVD1REWSEM = MALE_REVD1REWSTD./sqrt(height(MALE_REVD1REW)); %calculate SEM

MALE_REVD5REWMean = mean(MALE_REVD5REW); %calculate mean 
MALE_REVD5REWSTD = std(MALE_REVD5REW); %calculate std
MALE_REVD5REWSEM = MALE_REVD5REWSTD./sqrt(height(MALE_REVD5REW)); %calculate SEM

%%
%Plot REW male vs. female (all reversals) - by day 

figure

b1=bar(1,0); 
hold on
b2=bar(2,MALE_REVD1REWMean,'BarWidth',1.5,'LineWidth',1);
hold on
s2 = scatter(2*ones(length(MALE_REVD1REW(:,1)),1),MALE_REVD1REW(:,1),'ko'); %creates individual datapoint/animal
hold on
b3=bar(3,0); %space in between bars
hold on
b4=bar(4,FEMALE_REVD1REWMean,'BarWidth',1.5,'LineWidth',1);
hold on
s4 = scatter(4*ones(length(FEMALE_REVD1REW(:,1)),1),FEMALE_REVD1REW(:,1),'ko'); %creates individual datapoint/animal
hold on
b5=bar(5,0); 
hold on
b6=bar(6,0); 
hold on
b7=bar(7,MALE_REVD5REWMean,'BarWidth',1.5,'LineWidth',1);
hold on
s7 = scatter(7*ones(length(MALE_REVD5REW(:,1)),1),MALE_REVD5REW(:,1),'ko'); %creates individual datapoint/animal
hold on
b8=bar(8,0); %space in between bars
hold on
b9=bar(9,FEMALE_REVD5REWMean,'BarWidth',1.5,'LineWidth',1);
hold on
s9 = scatter(9*ones(length(FEMALE_REVD5REW(:,1)),1),FEMALE_REVD5REW(:,1),'ko'); %creates individual datapoint/animal
hold on

hold off
b2.FaceColor =MaleDarkSB;
b2.EdgeColor = [0 0 0]./255;

s2.MarkerFaceColor=MaleLightSB;
s2.MarkerEdgeColor = [0 0 0]./255;

b4.FaceColor =FemaleDarkSB;
b4.EdgeColor = [0 0 0]./255;

s4.MarkerFaceColor=FemaleLightSB;
s4.MarkerEdgeColor = [0 0 0]./255;

b7.FaceColor =MaleLightSB;
b7.EdgeColor = [0 0 0]./255;

s7.MarkerFaceColor=MaleDarkSB;
s7.MarkerEdgeColor = [0 0 0]./255;

b9.FaceColor =FemaleLightSB;
b9.EdgeColor = [0 0 0]./255;

s9.MarkerFaceColor=FemaleDarkSB;
s9.MarkerEdgeColor = [0 0 0]./255;


title ('Rewards Collected (R1-R4)')    
legend ([b2(1) b4(1)],{'Male','Female'}, 'Location','northeast','FontSize',20,'FontWeight','normal')
legend('boxoff')
ylabel('Rewards Collected','FontSize',20,'FontName','Arial','FontWeight','bold')
xlim([0 10])
set(gca,'XTick',[0 3 8],'XTickLabel',{'','Session 1','Session 5'},'XTickLabelRotation',0,'fontsize',12,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylim([0 300])
set(gca,'YTick',[0 75 150 225 300],'YTickLabel', {'0','75','150','225','300'}, 'fontsize',18,'fontname','Arial','FontWeight','bold');
set(gca,'LineWidth',1.5);
box off 
% pbaspect([1 1.36 1])
set(gcf,'color','w');



%%
%Create WS data tables 
MALE_REVWS=REV(REV.sex==1,'wstay_stim'); 
FEMALE_REVWS=REV(REV.sex==0,'wstay_stim'); 

%convert tables to array with numerical values 
MALE_REVWS = table2array(MALE_REVWS);
FEMALE_REVWS = table2array(FEMALE_REVWS);

%remove any NaNs in array 
MALE_REVWS(isnan(MALE_REVWS))=[];
FEMALE_REVWS(isnan(FEMALE_REVWS))=[];

%Calculate Means & SEMs

%FEMALE R1
FEMALE_REVWSMean = mean(FEMALE_REVWS); %calculate mean 
FEMALE_REVWSSTD = std(FEMALE_REVWS); %calculate std
FEMALE_REVWSSEM = FEMALE_REVWSSTD./sqrt(height(FEMALE_REVWS)); %calculate SEM

%MALE R1
MALE_REVWSMean = mean(MALE_REVWS); %calculate mean 
MALE_REVWSSTD = std(MALE_REVWS); %calculate std
MALE_REVWSSEM = MALE_REVWSSTD./sqrt(height(MALE_REVWS)); %calculate SEM

%%
% plot R1

figure

b1=bar(1,MALE_REVWSMean,'BarWidth',1.5,'LineWidth',1);
hold on
s1 = scatter(ones(length(MALE_REVWS(:,1)),1),MALE_REVWS(:,1),'ko'); %creates individual datapoint/animal
hold on
b2=bar(2,0); %space in between bars
hold on
b3=bar(3,FEMALE_REVWSMean,'BarWidth',1.5,'LineWidth',1);
hold on
s3 = scatter(3*ones(length(FEMALE_REVWS(:,1)),1),FEMALE_REVWS(:,1),'ko'); %creates individual datapoint/animal
hold on
b4=bar(4,0); %space in between bars
hold on


hold off
b1.FaceColor =MaleDarkSB;
b1.EdgeColor = [0 0 0]./255;

s1.MarkerFaceColor=MaleLightSB;
s1.MarkerEdgeColor = [0 0 0]./255;

b3.FaceColor =FemaleDarkSB;
b3.EdgeColor = [0 0 0]./255;

s3.MarkerFaceColor=FemaleLightSB;
s3.MarkerEdgeColor = [0 0 0]./255;

title ('Win-Stay (All Reversals)')    
ylabel('p(Win-Stay)','FontSize',20,'FontName','Arial','FontWeight','bold')
xlim([0 4])
set(gca,'XTick',[1 3],'XTickLabel',{'Male','Female'},'XTickLabelRotation',0,'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1.0],'YTickLabel', {'0','.25','.50','.75','1.0'}, 'fontsize',18,'fontname','Arial','FontWeight','bold');
set(gca,'LineWidth',1.5);
box off 
pbaspect([1 1.36 1])
set(gcf,'color','w');

%%
%Create LS data tables 
MALE_REVLS=REV(REV.sex==1,'lshift_stim'); 
FEMALE_REVLS=REV(REV.sex==0,'lshift_stim'); 

%convert tables to array with numerical values 
MALE_REVLS = table2array(MALE_REVLS);
FEMALE_REVLS = table2array(FEMALE_REVLS);

%remove any NaNs in array 
MALE_REVLS(isnan(MALE_REVLS))=[];
FEMALE_REVLS(isnan(FEMALE_REVLS))=[];

%Calculate Means & SEMs

%FEMALE R1
FEMALE_REVLSMean = mean(FEMALE_REVLS); %calculate mean 
FEMALE_REVLSSTD = std(FEMALE_REVLS); %calculate std
FEMALE_REVLSSEM = FEMALE_REVLSSTD./sqrt(height(FEMALE_REVLS)); %calculate SEM

%MALE R1
MALE_REVLSMean = mean(MALE_REVLS); %calculate mean 
MALE_REVLSSTD = std(MALE_REVLS); %calculate std
MALE_REVLSSEM = MALE_REVLSSTD./sqrt(height(MALE_REVLS)); %calculate SEM

%%
% plot R1

figure

b1=bar(1,MALE_REVLSMean,'BarWidth',1.5,'LineWidth',1);
hold on
s1 = scatter(ones(length(MALE_REVLS(:,1)),1),MALE_REVLS(:,1),'ko'); %creates individual datapoint/animal
hold on
b2=bar(2,0); %space in between bars
hold on
b3=bar(3,FEMALE_REVLSMean,'BarWidth',1.5,'LineWidth',1);
hold on
s3 = scatter(3*ones(length(FEMALE_REVLS(:,1)),1),FEMALE_REVLS(:,1),'ko'); %creates individual datapoint/animal
hold on
b4=bar(4,0); %space in between bars
hold on


hold off
b1.FaceColor =MaleDarkSB;
b1.EdgeColor = [0 0 0]./255;

s1.MarkerFaceColor=MaleLightSB;
s1.MarkerEdgeColor = [0 0 0]./255;

b3.FaceColor =FemaleDarkSB;
b3.EdgeColor = [0 0 0]./255;

s3.MarkerFaceColor=FemaleLightSB;
s3.MarkerEdgeColor = [0 0 0]./255;

title ('Lose-Shift (All Reversals)')    
ylabel('p(Lose-Shift)','FontSize',20,'FontName','Arial','FontWeight','bold')
xlim([0 4])
set(gca,'XTick',[1 3],'XTickLabel',{'Male','Female'},'XTickLabelRotation',0,'fontsize',18,'fontname','Arial','FontWeight','bold','LineWidth',1); 
ylim([0 1])
set(gca,'YTick',[0 .25 .50 .75 1.0],'YTickLabel', {'0','.25','.50','.75','1.0'}, 'fontsize',18,'fontname','Arial','FontWeight','bold');
set(gca,'LineWidth',1.5);
box off 
pbaspect([1 1.36 1])
set(gcf,'color','w');
