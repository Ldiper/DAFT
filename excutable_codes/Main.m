clear
close all
clc
addpath(genpath('./.'));
 
load data_tr1.mat          %Traindata(Tr1)
traindata=sailing_data;
load data_te1.mat          %Testdata(Te1)
testdata=sailing_data;
clear sailing_data

m=1;   % Prediction step size.
F=1;   % Function: 1:SRF; 2:SRF+DAFT.

switch F
    case 1
        [ture,pre,error] = SRF(traindata,testdata,m)
    case 2
        [ture,pre,error] = DAFT(traindata,testdata,m)
end


