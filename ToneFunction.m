function [tone] = ToneFunction(keynum,dur)
%NOTE Produce a sinusoidal waveform corresponding to a given piano key
%number
%   usage: tone = note (keynum, dur)
%   tone = the output sinusoidal waveform
%   keynum = the piano keyboard number of the desired note
%   dur = the duration (in seconds) of the output note
fs = 11025;
tt = 0:(1/fs):dur;
freq = 440 * 2^((keynum-49)/12);
tone = 1*sin(2*pi*freq*tt);
end

