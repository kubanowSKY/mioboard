function [ gesture,sum_can1,sum_can2, av_ex] = recognize( probes,filters )
  filtered_probes = filter_probes(probes, filters);
  [sum_can1,sum_can2,av_ex] = average_diff(filtered_probes);
%musimy nadac threshold dla, ktorego zidentyfikujemy dlon jako otwrata
%  if sum_can1 + sum_can2 < x
%    gesture = 0; % recognize as open hand gesture
%    return;
%  end
  if sum_can1 < sum_can2
      gesture = 2;
      return;
  end

  if av_ex > 0.5
      gesture = 1; % recognize as index gesture
      
  else
      gesture = 2; % recognize as hand close gesture
  end
end

