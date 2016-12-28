function [ gesture, state ] = recognize( probes,filters,key,state)
  filtered_probes = filter_probes(probes, filters);
  [sum_can1, sum_can2, av_ex] = average_diff(filtered_probes);

  if abs(sum_can1 + sum_can2) < abs(5*10^(-04))
    gesture = 0; % recognize as open hand gesture
    if state ~= 0
        if state == 1
            key.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
        else
            key.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
        end
        state = 0;
        key.keyPress(java.awt.event.KeyEvent.VK_UP);
    end
    return;
  end
  
  if sum_can1 < sum_can2
      gesture = 2;
      
        if state ~= 2
            if state == 1
                key.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
            else
                key.keyRelease(java.awt.event.KeyEvent.VK_UP);
            end
            state = 0;
            key.keyPress(java.awt.event.KeyEvent.VK_RIGHT);
        end
        return;
  end

  if av_ex > 0.5
      gesture = 1; % recognize as index gesture
        if state ~= 1
            if state == 0
                key.keyRelease(java.awt.event.KeyEvent.VK_UP);
            else
                key.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
            end
            state = 1;
            key.keyPress(java.awt.event.KeyEvent.VK_LEFT);
        end
  else
      gesture = 2; % recognize as hand close gesture
      if state ~= 2
          if state == 1
             key.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
          else
            key.keyRelease(java.awt.event.KeyEvent.VK_UP);
          end
          state = 2;
          key.keyPress(java.awt.event.KeyEvent.VK_RIGHT);
      end
  end
end


