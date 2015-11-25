%Skapa funktionen. Filename och refspectra tillhandah�lls av annan funktion.
function descriptor = descriptor_calc(filename, refspectra, pars)

%Omvandla filename, en fil av typen .raw, till en bildmatris, imgdata.
[imgdata, ~] = readASIraw(filename);

%Kod f�r att funktionen ska kunna anv�nda syntetiska bilder?
%imgdata = load(filename);
%imgdata = imgdata.imgdata;

%Konvertera imgdata fr�n uint16 till double och spara det i imgdata_double
imgdata_double = double(imgdata);

%Anv�nd utv�rdet 'mask' fr�n funktionen threshold_signal_image.
[mask, ~, ~] = Use_threshold_signal_image(imgdata);

%Funktionen fit_spectral_coefficients returnerar spektralkoefficientbilden coeff_img.
[coeff_img, ~] = fit_spectral_coefficients(imgdata_double, refspectra, mask, pars);

%Ber�kna ett histogram av bildens f�rgrund som �r bildens 'descriptor'.
descriptor = calc_foreground_histogram(coeff_img, mask);