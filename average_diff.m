function [sum_can1,sum_can2,av_ex,varn_ex] = average_diff(probes)
    N = length(probes);
        sum_can1 = 0;
        sum_can2 = 0;
    for i=1:N % first integrate undercurve area of both canals
        sum_can1 = sum_can1 + abs(probes(i,1));
        sum_can2 = sum_can2 + abs(probes(i,2));
    end
    % next calculate global difference divided by global sum
    av_ex = (sum_can1 - sum_can2)/(sum_can1 + sum_can2);
    var_can1 = var(probes(:,1));
    var_can2 = var(probes(:,2));
    var_can1n = var_can1/sum_can1;
    var_can2n = var_can2/sum_can2;
    varn_ex = (var_can1n-var_can2n)/(var_can1n+var_can2n);
end