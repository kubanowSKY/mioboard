function [ gesture, state ] = recognize(probes, key, state, filters)
	filtered_probes = filter_probes(probes, filters);
	[sum_can1, sum_can2, av_ex] = average_diff(filtered_probes);
%     gesture = 3
	if (abs(sum_can1 - sum_can2) <= 10^-5)
        gesture = 0; % recognize as open hand gesture
        if state ~= 0
            release_all(key);
            press_up(key);
            state = 0;
        end
    

    elseif (sum_can1 < sum_can2) || (av_ex <= -0.5)
        gesture = 1; % recognize as index gesture
        if state ~= 1
            release_all(key);
            press_right(key);
            state = 1;
        end
    
    elseif (sum_can1 > sum_can2) || (av_ex >= 0.5)
        gesture = 2; % recognize as hand close gesture
        if state ~= 2
            release_all(key);
            press_left(key);
            state = 2;
        end
        
    else
        gesture = 0; % recognize as hand open gesture
        if state ~= 0
            release_all(key);
            press_up(key);
            state = 0;
        end
    end
end


