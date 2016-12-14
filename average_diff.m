function [sum_can1,sum_can2,av_ex] = average_diff(probes)
    N = length(probes);
        sum_can1 = 0;
        sum_can2 = 0;
    for i=1:N % first integrate undercurve area of both canals
        sum_can1 = sum_can1 + abs(probes(i,1));
        sum_can2 = sum_can2 + abs(probes(i,2));
    end
    % next calculate global difference divided by global sum
    av_ex = (sum_can1 - sum_can2)/(sum_can1 + sum_can2);
end

