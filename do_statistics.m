function [average, vary, std_dev] = do_statistics(specter)
    for ii=1:2
        average(ii)=mean(abs(specter(40:250,ii)));
        vary(ii)=var(specter(40:250,ii));
        std_dev(ii)=sqrt(vary(ii));
    end
end

