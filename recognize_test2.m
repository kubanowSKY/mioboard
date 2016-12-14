load('filters.mat');

for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/HC-%d.csv', i, ii);
        probes_hc = load(sample_path);
        for iii = 1:5
        %dividing 5sec signal into 1sec signals
        probes_hc_1sec = probes_hc((iii*4000-3999):(iii*4000),:);
        %rows - patients, columns - different measurements for the same
        %patient
       [gesture_hc(i,5*ii-5+iii),sum1_hc(i,5*ii-5+iii),sum2_hc(i,5*ii-5+iii),av_ex_hc(i,5*ii-5+iii)]= recognize(probes_hc_1sec,filters);
       end
    end
end

for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/I-I%d.csv', i, ii);
        probes_ind = load(sample_path);
        for iii = 1:5
        probes_ind_1sec = probes_ind((iii*4000-3999):(iii*4000),:);
       [gesture_ind(i,5*ii-5+iii),sum1_ind(i,5*ii-5+iii),sum2_ind(i,5*ii-5+iii),av_ex_ind(i,5*ii-5+iii)]= recognize(probes_ind_1sec,filters);
       end
    end
end