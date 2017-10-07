% audio2drum is main function
% This code is for testing only
% Produces song from raw data only

% Load data
[ride, fs]=audioread('280Hz_Ride.wav');
[hat, ~]=audioread('12000Hz_Hat.wav');
[kick, ~]=audioread('kick808.wav');
[snr, ~]=audioread('snr.wav');
dict = {kick, hat, snr, ride};
%find frequency of each sound
fride = findFreq(ride, fs);
fhat = findFreq(hat, fs);
fkick = findFreq(kick, fs);
fsnr = findFreq(snr, fs);
%set bpm to 80, calculate duration of 16 1/8 notes 
bpm = 80;
ts = 1/44100;

duration = (30/bpm)*8*2; %80 is BPM for testing
durLen = round(duration/ts);
% fix array size for 2 special cases
if bpm == 80
    durLen = durLen - 8;
end
if bpm == 110
    durLen = durLen - 4;
end
  % places sounds in array  
musBox = zeros(1, durLen);
musBox = transpose(musBox);
notes = reshape(musBox,round(length(musBox)/16), 16);
noteLen = round(length(musBox)/16);

for j = 1:noteLen*4:length(musBox)-noteLen
    musBox(j:length(kick)+j-1) = kick(:,1);
    musBox(j+noteLen:length(hat)+j+noteLen-1) = hat(:,1);
    musBox(j+2*noteLen:length(snr)+j+2*noteLen-1)= snr(:,1);
    musBox(j+3*noteLen:length(hat)+j+3*noteLen-1) = hat(:,1);
end
