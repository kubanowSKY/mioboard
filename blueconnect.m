clear all
close all
i=1;
blueinfo = instrhwinfo('Bluetooth','HC-06');
if (isempty(blueinfo.RemoteName))
    fprintf('B³ad po³¹czenia \n');
    return
end
b = Bluetooth('HC-06',1);
b.Terminator = [];
fopen(b);
load('filters');
rec = [];

fprintf('Polaczono');
pause();

b.InputBufferSize = 800;

state = 0;
statistics = [];
i= 1;
all_probes = [];
while i<=1000
raw_data = fgets(b);
data = decode(raw_data);
probes = dat2probes(data);
[gesture(i), state, statistics] = recognize2(probes,state,filters,statistics);
gesture(i)
all_probes = [all_probes;probes];
i = i+1;
end