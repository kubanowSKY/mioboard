function [ filters ] = make_filters ()
    Fs = 4000;
    filters(1) = designfilt('bandstopiir', 'FilterOrder', 4, ...
        'HalfPowerFrequency1', 48, 'HalfPowerFrequency2', 52, ...
        'DesignMethod', 'butter', 'SampleRate', Fs);

    A_stop1 = 60;		% Attenuation in the first stopband = 60 dB
    F_stop1 = 5;		% Edge of the stopband = 5 Hz
    F_pass1 = 10;	% Edge of the passband = 10 Hz
    F_pass2 = 45;	% Closing edge of the passband = 45 Hz
    F_stop2 = 60;	% Edge of the second stopband = 60 Hz
    A_stop2 = 60;		% Attenuation in the second stopband = 60 dB
    A_pass = 1;		% Amount of ripple allowed in the passband = 1 dB

    BandPassSpecObj = fdesign.bandpass(F_stop1, F_pass1, F_pass2, F_stop2, A_stop1, A_pass,A_stop2, Fs);
    filters(2) = design(BandPassSpecObj, 'equiripple');
end