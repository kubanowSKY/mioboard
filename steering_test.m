import java.awt.Robot
import java.awt.event.*

key = Robot;
key.setAutoDelay(200);

load('sample_gestures.mat')
load('filters.mat')
state = 3;  % 0 - strzela
            % 1 - w prawo
            % 2 - w lewo
            % 3 - stan początkowy
for i=1:100
    [gesture(i), state] = recognize(sample_gestures(((199*i-198):(199*i)),:), key, state, filters);
end
release_all(key)