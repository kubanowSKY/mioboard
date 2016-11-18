filters = make_filters(); % creating filters
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/HC-%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_hc = fft(filtered_probes, N);
    [average_hc(i,:), var_hc(i,:), std_hc(i,:)] = do_statistics(specter_hc);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/I-I%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_i = fft(filtered_probes, N);
    [average_i(i,:), var_i(i,:), std_i(i,:)] = do_statistics(specter_i);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/L-L%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_l = fft(filtered_probes, N);
    [average_l(i,:), var_l(i,:), std_l(i,:)] = do_statistics(specter_l);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/M-M%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_m = fft(filtered_probes, N);
    [average_m(i,:), var_m(i,:), std_m(i,:)] = do_statistics(specter_m);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/R-R%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_r = fft(filtered_probes, N);
    [average_r(i,:), var_r(i,:), std_r(i,:)] = do_statistics(specter_r);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-I%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_ti = fft(filtered_probes, N);
    [average_ti(i,:), var_ti(i,:), std_ti(i,:)] = do_statistics(specter_ti);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-L%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_tl = fft(filtered_probes, N);
    [average_tl(i,:), var_tl(i,:), std_tl(i,:)] = do_statistics(specter_tl);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-M%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_tm = fft(filtered_probes, N);
    [average_tm(i,:), var_tm(i,:), std_tm(i,:)] = do_statistics(specter_tm);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-R%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_tr = fft(filtered_probes, N);
    [average_tr(i,:), var_tr(i,:), std_tr(i,:)] = do_statistics(specter_tr);
end
for i = 1:8
    for ii = 1:6
        sample_path = sprintf('samples/s%d/T-T%d.csv', i, ii);
        probes(:,2*ii-1:2*ii) = load(sample_path);
    end
    average_probes = mean_probes(probes);
    filtered_probes = filter_probes(average_probes, filters);
    N = length(filtered_probes);
    specter_t = fft(filtered_probes, N);
    [average_t(i,:), var_t(i,:), std_t(i,:)] = do_statistics(specter_t);
end
