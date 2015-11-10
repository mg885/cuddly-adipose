%%parametrar: refspectra (olika f�r diverse moduler?), pars (kolla f�r
%%varje modul, dessa ska placeras under parametersektionen nedan)
%%value = (grad eller �lder (?))
%%skapa modul f�r att v�lja till bilder eftersom(?)
%refpath f�s genom path_refpath, [path filename] kommer ifr�n path_filename
%refspectra och img (?) ----- spect_img(?), mask �r output fr�n threshold_.
%training_data f�s genom init_database och 'descriptor' fr�n utr�kningen
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%++++++++++++++++++++++ Fasta parametrar nedan: +++++++++++++++++++++++++++
%
%
types = {'adipose', 'hfTAA'};
%value = '?'
%mode = eg. 'classify' or 'estimate'
%pars (till varje enskild modul som har detta som input)
%
%+++++++++++++++++++++ Nedan g�ller pipeline (Databas): +++++++++++++++++++
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
path_filename(); 
path_refspectra(); 
init_database(refspectra, mode, pars);
readASIraw([path filename]);
load_ref_spectra(types,refpath);
%Modul f�r deskriptorber�kning h�r som innefattar:
%threshold_signal_image(img, pars);
%fit_spec_coeff(spect_img,refspectra,mask, pars);
%calc_foreground_histogram(img, mask);
%~~~~~~~~~~~>resultatet f�r denna modul blir 'descriptor'
insert_sample(training_data, descriptor, value);

%+++++++++++++++++ Nedan g�ller pipeline (Matchning): +++++++++++++++++++++
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
readASIraw([path filename]);
load_reference_spectra(types, refpath);
%Modul f�r deskriptorber�kning h�r som innefattar:
%threshold_signal_image(img, pars);
%fit_spec_coeff(spect_img,refspectra,mask, pars);
%calc_foreground_histogram(img, mask);
%resultatet f�r denna modul blir 'descriptor'
match_sample(training_data, descriptor);
%%~~~~~~~~~~~~~~~~~>Resultat:~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

