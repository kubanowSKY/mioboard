function [ gesture, state, statistics ] = recognize(probes, key,  state, filters, statistics)
	filtered_probes = filter_probes(probes, filters);
    statistics = prepare_statistics(filtered_probes, statistics);
    %statistics(:,1) - summary signal on channel 1
    %statistics(:,2) - summary signal on channel 2
    %statistics(:,3) - average diff constrast on channels
    %statistics(:,4) - average normalized var contrast on channels
    
    mean_can1 = mean(statistics(:,1));
    mean_can2 = mean(statistics(:,2));
    mean_av_ex = mean(statistics(:,3));
    mean_varn_ex = mean(statistics(:,4));
    var4 = var(statistics(:,4));

   if ( abs(mean_av_ex) < 0.08 || abs(mean_varn_ex) < 0.08)
        if var4 < 0.006
            gesture = 1; % recognize as open hand gesture
            if state ~= 1
                release_all(key);
                press_up(key);
                state = 1;
            end
            return
        
        else
            gesture = 0; % recognize as hand closed gesture
            if state ~= 0
                release_all(key);
                press_left(key);
                state = 0;
            end
            return
        end
        
     elseif  (mean_av_ex < 0.2) || (mean_varn_ex < 0.2)
        gesture = 0; % recognize as hand close gesture
        if state ~= 0
            release_all(key);
            press_left(key);
            state = 0;
        end
        return
        
    elseif  (mean_av_ex > 0.3) || (mean_varn_ex > 0.4)
        gesture = 2; % recognize as index gesture
        if state ~= 2
            release_all(key);
            press_right(key);
            state = 2;
        end
         return
   else gesture = 3;
   end