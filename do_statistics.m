function [average, var, std] = do_statistics(specter)
    for ii=1:2
        average(ii)=mean(abs(specter(:,ii)));
        var(ii)=var(specter(:,ii));
        std(ii)=sqrt(var(ii));
    end
end

