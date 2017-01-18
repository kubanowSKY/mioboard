load('Sygnaly_testowe_RSG.mat');
load('filtersn');
% test on SIG_A 
% 10s hand open 10s index alternately
% 1 - hand open gesture, 2 index gesture
% we are dividing signal into 0.1sec periods

mask = [ones(1,100),2*ones(1,100),  ones(1,100),2*ones(1,100),...
    ones(1,100),2*ones(1,100) ,ones(1,100),2*ones(1,100),...
    ones(1,100),2*ones(1,100)];

reco_gesture = [];
score =0;

for i = 1:round(length(SIG_A)/200)
    
    probes = SIG_A(i*200-199:i*200, :);
   
    [sum_can1,sum_can2,av_ex,varn_ex] = average_diff(probes);
      if i == 1
        state = 3;
        statistics=[sum_can1,sum_can2,av_ex,varn_ex];
        statistics = [zeros(4);statistics];
      end 
      
    [reco_gesture(i),state,statistics] = recognize2(probes, state, filtersn, statistics);
  
   
     if reco_gesture(i) == mask(i)
        score = score +1;
     end
    
end

unknown = sum(reco_gesture == 3);
score_percent_SIG_A = score/(i-unknown)*100

% test on SIG_A2 
% 10s index 10s hand open alternately
% 1 - hand open gesture, 2 index gesture
% we are dividing signal into 0.1sec periods

mask = [2*ones(1,100),  ones(1,100),2*ones(1,100),...
    ones(1,100),2*ones(1,100) ,ones(1,100),2*ones(1,100),...
    ones(1,100),2*ones(1,100),ones(1,100),];

reco_gesture = [];
score =0;

for i = 1:round(length(SIG_A2)/200)
    
    probes = SIG_A2(i*200-199:i*200, :);
   
    [sum_can1,sum_can2,av_ex,varn_ex] = average_diff(probes);
      if i == 1
        state = 3;
        statistics=[sum_can1,sum_can2,av_ex,varn_ex];
        statistics = [zeros(4);statistics];
      end 
      
    [reco_gesture(i),state,statistics] = recognize2(probes, state, filtersn, statistics);
  
   
     if reco_gesture(i) == mask(i)
        score = score +1;
     end
    
end

unknown = sum(reco_gesture == 3);
score_percent_SIG_A2 = score/(i-unknown)*100

% test on SIG_C
% 10s hand open -> 10s hand close -> 10s  hand open -> 10s index alternately
% 1 - hand open gesture, 2 - index gesture, 0 - hand close, 3 - doesnt know
% we are dividing signal into 0.1sec periods


mask = [ones(1,100),zeros(1,100), ones(1,100),2*ones(1,100),...
    ones(1,100),zeros(1,100), ones(1,100),2*ones(1,100),...
    ones(1,100),zeros(1,100)];

reco_gesture = [];
score =0;

for i = 1:round(length(SIG_C)/200)
    
    probes = SIG_C(i*200-199:i*200, :);
   
    
      if i == 1
        state = 3;
        [sum_can1,sum_can2,av_ex,varn_ex] = average_diff(probes);
        statistics=[sum_can1,sum_can2,av_ex,varn_ex];
        statistics = [zeros(4);statistics];
      end 
   
    [reco_gesture(i),state,statistics] = recognize2(probes, state, filtersn, statistics);
   

     if reco_gesture(i) == mask(i)
        score = score +1;
     end
    
end
unknown = sum(reco_gesture == 3);
score_percent_SIG_C = score/(i-unknown)*100

% test on SIG_C2
% 10s hand close -> 10s  hand open -> 10s index alternately 10s -> hand open 
% 1 - hand open gesture, 2 - index gesture, 0 - hand close, 3 - doesnt know
% we are dividing signal into 0.1sec periods


mask = [zeros(1,100), ones(1,100),2*ones(1,100), ones(1,100)...
    zeros(1,100), ones(1,100),2*ones(1,100), ones(1,100)...
    zeros(1,100), ones(1,100)];

reco_gesture = [];
score =0;

for i = 1:round(length(SIG_C2)/200)
    
    probes = SIG_C2(i*200-199:i*200, :);
   
    
      if i == 1
        state = 3;
        [sum_can1,sum_can2,av_ex,varn_ex] = average_diff(probes);
        statistics=[sum_can1,sum_can2,av_ex,varn_ex];
        statistics = [zeros(4);statistics];
      end 
   
    [reco_gesture(i),state,statistics] = recognize2(probes, state, filtersn, statistics);
   

     if reco_gesture(i) == mask(i)
        score = score +1;
     end
    
end
unknown = sum(reco_gesture == 3);
score_percent_SIG_C2 = score/(i-unknown)*100

% test on SIG_B
% 10s hand open -> 10s hand close  alternately
% 1 - hand open gesture, 2 - index gesture, 0 - hand close, 3 - doesnt know
% we are dividing signal into 0.1sec periods


mask = [ones(1,100),zeros(1,100), ones(1,100),zeros(1,100),...
    ones(1,100),zeros(1,100), ones(1,100),zeros(1,100),...
    ones(1,100),zeros(1,100)];
    

reco_gesture = [];
score =0;

for i = 1:round(length(SIG_C)/200)
    
    probes = SIG_B(i*200-199:i*200, :);
   
      if i == 1
        state = 3;
       [sum_can1,sum_can2,av_ex,varn_ex] = average_diff(probes);
        statistics=[sum_can1,sum_can2,av_ex,varn_ex];
        statistics = [zeros(4);statistics];
      end 
   
    [reco_gesture(i),state,statistics] = recognize2(probes, state, filtersn, statistics);
   
     if reco_gesture(i) == mask(i)
        score = score +1;
     end
    
end

score_percent_SIG_B = score/i*100

% test on SIG_B2
% 10s hand hand close -> 10s open  alternately
% 1 - hand open gesture, 2 - index gesture, 0 - hand close, 3 - doesnt know
% we are dividing signal into 0.1sec periods


mask = [zeros(1,100), ones(1,100),zeros(1,100),...
    ones(1,100),zeros(1,100), ones(1,100),zeros(1,100),...
    ones(1,100),zeros(1,100), ones(1,100),];
    

reco_gesture = [];
score =0;

for i = 1:round(length(SIG_B2)/200)
    
    probes = SIG_B2(i*200-199:i*200, :);
   
      if i == 1
        state = 3;
       [sum_can1,sum_can2,av_ex,varn_ex] = average_diff(probes);
        statistics=[sum_can1,sum_can2,av_ex,varn_ex];
        statistics = [zeros(4);statistics];
      end 
   
    [reco_gesture(i),state,statistics] = recognize2(probes, state, filtersn, statistics);
   
     if reco_gesture(i) == mask(i)
        score = score +1;
     end
    
end

score_percent_SIG_B2 = score/i*100