function [mean_probes] = mean_probes(probes)
    for ii=1:2
        sum(:,ii)=probes(:,ii)+probes(:,ii+2)+probes(:,ii+4)+probes(:,ii+6)+probes(:,ii+8)+probes(:,ii+10);
        mean_probes(:,ii)=sum(:,ii)/6;
    end
end

