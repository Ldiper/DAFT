clear
close all
clc
addpath(genpath('./.'));

%% Parameter setting
m=1;   % Prediction step size.
F=1;   % Function:   1:with DAFT;   0:without DAFT. 

%% Data loading
load data_tr1.mat          %Traindata(Tr1)
traindata=sailing_data;
load data_te1.mat          %Testdata(Te1)
testdata=sailing_data;
clear sailing_data

%% Data processing
if F==1
    train=daft_g(traindata);
    [test,pstw]=daft_g(testdata);
else
    train=data_processing(traindata);
    test=data_processing(testdata);
end
gt = testdata.stw;
clear traindata testdata

train=(cell2mat(table2cell(struct2table(train))))';
test=(cell2mat(table2cell(struct2table(test))))';

%% Data normalization
[train(1,:),ps1]=mapminmax(train(1,:),-1,1);
test(1,:) = mapminmax('apply',test(1,:),ps1);
[train(2:end,:),ps2]=mapminmax(train(2:end,:),-1,1);
test(2:end,:) = mapminmax('apply',test(2:end,:),ps2);

%% Prediction 
ynn=srf(train,test,m,F);

yn = mapminmax('reverse',ynn,ps1);

if F == 1
    yn=daft_h(yn,pstw,m);
end

%% Validation metrics
error=my_error(gt,yn);
clear ps1 ps2 pstw ynn







