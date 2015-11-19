


    %%test function
    %%however, Threshold_signal_image does not accept threshold values representet with more than one character. eg, 10 or 0,1

function [mask, threshold_value, ReturnImage] = Use_threshold_signal_image(Image)

%%set up parmameter struct
pars = struct;
pars.flatten_mode = 'max'; %% 'sum' or 'max'
pars.normalisefl = false; %%true/false
pars.method = 'manual'; %% manual/automatic
pars.gammaval = 1; %%gamma value to apply
pars.threshold_value = 0.011; %% threshold value
pars.n_erosion_steps = 0;%% number of steps to erode
pars.n_dilation_steps = 0;%% number of steps to dialate
pars.min_region_size = ceil(size(Image, 1)*size(Image, 2)*0.001);


[mask, threshold_value, ReturnImage] = threshold_signal_image(Image, pars); %% Kör threshold-funktionen och spara bara flattended_image
