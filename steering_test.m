import java.awt.Robot
import java.awt.event.*

key = Robot;
key.setAutoDelay(100);

load('sample_gestures.mat')
load('filters.mat')
state = 3;  % 0 - strzela
            % 1 - w lewo
            % 2 - w prawo
            % 3 - stan początkowy
for i=1:100
    [gesture, state]=recognize(sample_gestures(((199*i-198):(199*i)),:), filters, key, state);
    pause(0.1)
end