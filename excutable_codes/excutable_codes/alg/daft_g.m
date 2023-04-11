function [dataset_daft,pstw] = daft_g(dataset)
    dataset_daft.r=dataset.stw-dataset.pstw;
    wind=cos(pi*dataset.wind_rd./180).*dataset.wind_sp;  
    pwind=[wind(1);wind(1:end-1)]; 
    dataset_daft.wind=pwind-wind;
    wave=cos(pi*dataset.wave_rd./180).*dataset.wave_h; 
    pwave=[wave(1);wave(1:end-1)]; 
    dataset_daft.wave=pwave-wave;
    swell=cos(pi*dataset.swell_rd./180).*dataset.swell_h; 
    pswell=[swell(1);swell(1:end-1)]; 
    dataset_daft.swell=pswell-swell;
    dataset_daft.draught=dataset.draught;
    dataset_daft.r1=dataset.pstw-dataset.pstw2; 
    dataset_daft.r2=dataset.pstw2-dataset.pstw3;
    dataset_daft.r3=dataset.pstw3-dataset.pstw4;
    pstw=dataset.pstw;
end

