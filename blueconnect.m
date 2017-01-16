clear all
close all
i=1;
blueinfo = instrhwinfo('Bluetooth','test2');
if (isempty(blueinfo.RemoteName))
    fprintf('B³ad po³¹czenia \n');
    return
end
b = Bluetooth('test2',1);
b.Terminator = [];
fopen(b);
load('filters');
rec = [];
while i>=1
raw_data = fgets(b);
data = decode(raw_data);
probes = dat2probes(data);
rec(i) = recognize(probes,filters);
i = i+1;
end