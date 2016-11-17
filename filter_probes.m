function [filtered_probes] = filter_probes (probes)
    Fs = 4000;
    iir_filter = designfilt('bandstopiir', 'FilterOrder', 4, ...
        'HalfPowerFrequency1', 48, 'HalfPowerFrequency2', 52, ...
        'DesignMethod', 'butter', 'SampleRate', Fs);
    filtered_probes = filter(iir_filter, probes);
end