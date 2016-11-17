function [average, vary, std] = do_statistics(specter)
    for ii=1:2
        average(ii)=mean(abs(specter(:,ii)));
        vary(ii)=var(specter(:,ii));
        std(ii)=sqrt(vary(ii));
    end
end

