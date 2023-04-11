function [dataset_processing] = data_processing(dataset)
    dataset_processing.v=dataset.stw;
    dataset_processing.wind_d=dataset.wind_rd; dataset_processing.wind_s=dataset.wind_sp;
    dataset_processing.wave_d=dataset.wave_rd; dataset_processing.wave_h=dataset.wave_h;
    dataset_processing.swell_d=dataset.swell_rd; dataset_processing.swell_h=dataset.swell_h;
    dataset_processing.draught=dataset.draught;
    dataset_processing.v1=dataset.pstw; dataset_processing.v2=dataset.pstw2; 
    dataset_processing.v3=dataset.pstw3; dataset_processing.v4=dataset.pstw4; 
end

