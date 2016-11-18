function [filtered_probes] = filter_probes (probes, filters)
    filtered_probes = filter(filters(1), probes);                           % bandstop 48-52Hz
    filtered_probes = filter(filters(2), filtered_probes);                  % bandpass 10-45Hz
end