function [ gesture, state, statistics ] = recognize(probes, key, state, filters, statistics)
	filtered_probes = filter_probes(probes, filters);
    statistics = prepare_statistics(filtered_probes, statistics);
    %statistics(:,1) - summary signal on channel 1
    %statistics(:,2) - summary signal on channel 2
    %statistics(:,3) - average diff on channels
    mean_can1 = mean(statistics(:,1));
    mean_can2 = mean(statistics(:,2));
    mean_av_ex = mean(statistics(:,3));

    if (abs(mean_can1 - mean_can2) <= 10^-5) || (abs(mean_av_ex) < 0.1)
        gesture = 1; % recognize as open hand gesture
        if state ~= 1
            release_all(key);
            press_up(key);
            state = 1;
        end

    elseif (mean_can1 < mean_can2) || (mean_av_ex <= -0.5)
        gesture = 2; % recognize as index gesture
        if state ~= 2
            release_all(key);
            press_right(key);
            state = 2;
        end

    elseif (mean_can1 > mean_can2) || (mean_av_ex >= 0.5)
        gesture = 0; % recognize as hand close gesture
        if state ~= 0
            release_all(key);
            press_left(key);
            state = 0;
        end

    else
        gesture = 1; % recognize as hand open gesture
        if state ~= 1
            release_all(key);
            press_up(key);
            state = 1;
        end
    end
    sprintf('%f \t %f \t %f \t %d', mean_can1, mean_can2, mean_av_ex, gesture)
end

