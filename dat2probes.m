function [ probes ] = dat2probes( data )
len = length(data);
probes = zeros(len/2, 2);
for i =1:1:len
    if mod(i,2) ~= 0
        probes((i+1)/2,1) = data(i);
    else
        probes((i)/2,2) = data(i);
    end
end

