% Create or load filters from file
% filters(1) is iir filter bandstop on 48-52 Hz
% filters(2) is bandpass filter 10-45 Hz
% filters = make_filters();
load('filters.mat');

% Statistics and fft from prepared samples
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/HC-%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_hc(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_hc(i,:), var_hc(i,:), std_hc(i,:)] = do_statistics(specter_hc(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/I-I%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_i(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_i(i,:), var_i(i,:), std_i(i,:)] = do_statistics(specter_i(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/L-L%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_l(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_l(i,:), var_l(i,:), std_l(i,:)] = do_statistics(specter_l(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/M-M%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_m(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_m(i,:), var_m(i,:), std_m(i,:)] = do_statistics(specter_m(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/R-R%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_r(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_r(i,:), var_r(i,:), std_r(i,:)] = do_statistics(specter_r(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-I%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_ti(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_ti(i,:), var_ti(i,:), std_ti(i,:)] = do_statistics(specter_ti(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-L%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes, filters);
    N = length(filtered_probes(:,:,i));
    specter_tl(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_tl(i,:), var_tl(i,:), std_tl(i,:)] = do_statistics(specter_tl(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-M%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_tm(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_tm(i,:), var_tm(i,:), std_tm(i,:)] = do_statistics(specter_tm(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-R%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_tr(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_tr(i,:), var_tr(i,:), std_tr(i,:)] = do_statistics(specter_tr(:,:,i));
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-T%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes(:,:,i) = mean_probes(probes);
    filtered_probes(:,:,i) = filter_probes(average_probes(:,:,i), filters);
    N = length(filtered_probes(:,:,i));
    specter_t(:,:,i) = fft(filtered_probes(:,:,i), N);
    [average_t(i,:), var_t(i,:), std_t(i,:)] = do_statistics(specter_t(:,:,i));
end
