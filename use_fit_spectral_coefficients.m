function [coeff_img, residual] = use_fit_spectral_coefficients %G�r detta till en funktion.

spect_img = Image_gen2(3); %Anv�nd funktionen spect_img f�r att generera en bild f�r testningssyften. M�ste anpassas f�r verklig testdata i ett senare skede.

pars = struct('use_affine', false, 'enforce_positive', false); %Jag �r inte helt hundra p� vilka v�rden som �r att f�redra, har valt att inte anv�nda n�got av dem. Vidare forskning kr�vs.

refspectra = load_reference_spectra('C:\Users\Oscar\Desktop\tools-dist\reference_spectra', {'adipose', 'hFTAA'}); %Ladda referensspektra. B�r kunna effektivisseras s� att detta inte g�rs separat i flera funktioner.
%Notera att s�kv�gen �r h�rdkodad. �ndras vid senare tillf�lle.

[mask, ~, ~] = Use_threshold_signal_image2; %Anv�nd funktionen Use_threshold_signal_images(2) utv�rde 'mask' f�r att maska spect_img. 

[coeff_img, residual] = fit_spectral_coefficients(spect_img, refspectra, mask, pars); %Funktionen fit_spectral_coefficients g�r sin magi.