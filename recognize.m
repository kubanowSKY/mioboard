function [ gesture, state ] = recognize(probes, key, state, filters)
	filtered_probes = filter_probes(probes, filters);
	[sum_can1, sum_can2, av_ex] = average_diff(filtered_probes);

	if abs(sum_can1 + sum_can2) < abs(5*10^(-04))
        gesture = 0; % recognize as open hand gesture
        if state ~= 0
            release_all(key);
            press_up(key);
            state = 0;
        end   

    elseif sum_can1 < sum_can2
        gesture = 2; % recognize as hand close gesture
        if state ~= 2
            release_all(key);
            press_left(key);
            state = 2;
        end
    
    elseif av_ex > 0.5
        gesture = 1; % recognize as index gesture
        if state ~= 1
            release_all(key);
            press_right(key);
            state = 1;
        end
        
    else
        gesture = 2; % recognize as hand close gesture
        if state ~= 2
            release_all(key);
            press_left(key);
            state = 2;
        end
    end
end


