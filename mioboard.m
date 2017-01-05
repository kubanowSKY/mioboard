import java.awt.Robot
import java.awt.event.*

key = Robot;
key.setAutoDelay(110);

load('sample_gestures.mat')
load('filters.mat')

state = 3;  % 0 - k_left
            % 1 - k_up
            % 2 - k_right
            % 3 - no key
            
app='java -jar GhostInvadersNet.jar';
setenv('APP', app)

%check whether game is on
[ret, cmd] = system('pgrep java | wc -l');
if(str2num(cmd) == 0)
    % run game before simulate starts
    cd('game')
    !$APP &
    cd('..')
    pause(1)
end

for i=1:100
    [gesture(i), state] = recognize(sample_gestures(((199*i-198):(199*i)),:), key, state, filters);
end

release_all(key)