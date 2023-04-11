function [error] = my_error(k,yn)
sow=k;
nsow=yn;
n=size(sow,1);

obs=k;
pre=yn;

obs_mean = mean(obs);          % 均值
pre_mean = mean(pre);      
obs_var = var(obs);            % 方差
pre_var = var(pre);
obs_std = std(obs);            % 标准差
pre_std = std(pre); 

tmp = (obs - obs_mean).*(pre - pre_mean);
n = length(obs);  
STA.R = sum(tmp)/(n*obs_std*pre_std);
STA.Ep2 = obs_var + pre_var - 2*obs_std*pre_std*STA.R;

STA.Em2 = (obs_mean - pre_mean).^2;
STA.RMSE = ( sum( (obs - pre).^2 ) /n )^(1/2);
RMSE= sqrt( (1/n) * sum( (sow-nsow).^2 ) );
MAE= (1/n) * sum( abs(sow-nsow) );
% R2= 1 - sum( (sow-nsow).^2 ) / sum( (sow-mean(sow) ).^2 );
cct=corrcoef(sow,nsow);
cct=cct(2,1);
R2=cct^2;
% R2=corr(sow,nsow);
MAPE= strcat( num2str( 100*(1/n) * sum( abs( (nsow-sow)./sow) ) ) ,'%');

field1='RMSE';value1=RMSE;
field2='MAE';value2=MAE;
field3='R2';value3=R2;
field4='MAPE';value4=MAPE;
field5='EM2';value5=STA.Em2;
field6='EP2';value6=STA.Ep2;
error=struct(field1,value1,field2,value2,field3,value3,field4,value4,field5,value5,field6,value6);
end

