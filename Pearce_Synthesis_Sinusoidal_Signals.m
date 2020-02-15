%Problem 1: Create C-D Converter
t=(0:1/8000:3);
x1=100*sin(2*pi*1100*t);
%sound(x1,11025); %Separate Signal

%Different Waveform
t=(0:1/8000:3);
x2=100*sin(2*pi*1650*t+(pi/3));
%sound(x2,11025); %Separate Signal

%Combined
xx = [x1 zeros(1,2000) x2];
%sound(xx,11025);

%Music Generation
f = 440*(2^(7/12)); %frequency based on 440 * 2^(n/12) where n is notes above middle c
t=(0:1/11025:2); %(0, period, duration)
E5 = sin(2*pi*f*t); %sinusoidal wave
%sound(E5,11025); %play using windows audio frequency

%Synthesis of Musical Notes Lab
%Note Assignment with standard keyboard (2 octaves)
Gs3 = 37;
A3 = 38;
B3 = 39;
C4 = 40;
Cs4 = 41;
D4 = 42;
Ds4 = 43;
E4 = 44;
F4 = 45;
Fs4 = 46;
G4 = 47;
Gs4 = 48;
A4 = 49;
As4 = 50;
B4 = 51;
C5 = 52;
Cs5 = 53;
D5 = 54;
Ds5 = 55;
E5 = 56;
F5 = 57;
Fs5 = 58;
G5 = 59;
Gs5 = 60;
A5 = 61;


%Vocalise Melody by S. Rachmaninoff

notes = [E5, Ds5, E5, Cs5, Ds5, E5, Ds5, Cs5, Ds5, B4, Cs5, Ds5, Cs5, B4, Cs5, A4, B4, Cs5, B4, A4, Gs4, Fs4, Gs4, A4, Gs4];
durrh = [.25, .25, 1.5, .25, .25, .5, .25, .25, .5, .25, .25, 2.5, .25, .25, .5, .25, .25, 2.5, .25, .25, .75, .25, .75, .25, 1.25];
noteslh = [Cs4, Cs4, Cs4, Cs4, Cs4, Cs4, Cs4, Cs4, Cs4, Cs4, Cs4, B3, B3, B3, B3, B3, B3, B3, A3, A3, Gs3, Gs3, Gs3, Gs3, Gs3, Gs3, Gs3, Gs3, Gs3, Gs3, Gs3];
%durlh = repmat( .5, [1,(length(noteslh))] );
durlh = .5 + zeros(1, length(noteslh)); %just eigth notes and I'm too lazy to create the matrix
fs = 11025;
xx = zeros(1, round(sum(durrh)*fs+1));
yy = zeros(1, round(sum(durlh)*fs+1));
n1=1;

for kk = 1:length(notes)
        keynum = notes(kk);
        dur = durrh(kk);
        tone = ToneFunction(keynum,dur);
        n2 = n1 + length(tone)-1;
        xx(n1:n2) = xx(n1:n2) + tone;
        n1=n2;
end
n1=1;
for kk = 1:length(noteslh)
        keynum = noteslh(kk);
        dur = durlh(kk);
        tone = ToneFunction(keynum,dur);
        n2 = n1 + length(tone)-1;
        yy(n1:n2) = yy(n1:n2) + tone;
        n1=n2;
end
newy = zeros(size(xx)); %this creates a new matrix for RH and LH to make them equal length (fills in extra zeros)
newy(1:size(yy,1),1:size(yy,2)) = yy;
newx = zeros(size(newy));
newx(1:size(xx,1),1:size(xx,2)) = xx;
sound (newx+newy, fs);
