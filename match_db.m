%%match_db compares a list of ungraded images' histograms with the values found in the training data
%%structure and returns a grade.

function match_db(images, refspectra, training_data)

for k=1:numel(images)
    training_data.pars.matching_pars.k = k;
    histogram = descriptor_calc(images{k}, refspectra);
    result = match_sample(histogram, training_data);
    addvalues_result(images{k}, result);
end