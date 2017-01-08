function [ statistics ] = prepare_statistics( filtered_probes, statistics )
    if length(statistics) == 5
        for i=1:4
            statistics(i,:)=statistics(i+1,:);
        end
    end
    [statistics(5,1), statistics(5,2), statistics(5,3)]...
        = average_diff(filtered_probes);
end

