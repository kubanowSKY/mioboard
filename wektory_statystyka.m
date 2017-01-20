load('Sygnaly_testowe_RSG.mat');
load('filtersn');
% test on SIG_A 
% 10s hand open 10s index alternately
% 1 - hand open gesture, 2 index gesture
% we are dividing signal into 0.1sec periods

PD = 0;
PU = 0;
FD = 0;
FU = 0;

mask = [ones(1,100),2*ones(1,100),  ones(1,100),2*ones(1,100),...
    ones(1,100),2*ones(1,100) ,ones(1,100),2*ones(1,100),...
    ones(1,100),2*ones(1,100)];

reco_gesture = [];
score =0;
ii=0;
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
     
     if mask(i) == 2
         if (reco_gesture(i) == mask(i)) 
             PD = PD +1;
         else
             FU = FU +1;
         end
     else
         if (reco_gesture(i) == mask(i))
             PU = PU +1;
         else
             FD = FD +1;
         end  
     end
  unknown = sum(reco_gesture == 3);
  if (mod(i,40) == 0)
      ii=ii+1;
        score_percent_SIG_A(ii) = score/(i-unknown)*100;
        sensivity_SIG_A(ii) = PD / (PD + FU) *100;
        specifity_SIG_A(ii) = PU / (PU + FD) *100;
  end
end
ROC(:,1)=specifity_SIG_A;
ROC(:,2)=sensivity_SIG_A;