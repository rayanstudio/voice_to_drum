function out = produced(freq, bpm)
% audio2drum is main function
% load samples
[ride, fs]=audioread('280Hz_Ride.wav');
[hat, ~]=audioread('12000Hz_Hat.wav');
[kick, ~]=audioread('kick808.wav');
[snr, ~]=audioread('snr.wav');
% calculate period
ts = 1/44100;
% calculate duration of song based on BPM
duration = (30/bpm)*8*2; 
durLen = round(duration/ts);
% Fix special cases
if bpm == 80
    durLen = durLen - 8;
end
if bpm == 110
    durLen = durLen - 4;
end
% create array for song
musBox = zeros(1, durLen);
musBox = transpose(musBox);
noteLen = round(length(musBox)/16);
ind = 1;
% match fft values and place samples in array
for j = 1:noteLen:length(musBox)-noteLen
    if freq(ind) == 0
        musBox(j:noteLen+j-1) = zeros(noteLen,1);
    elseif freq(ind) < 500
        musBox(j:length(kick)+j-1) = kick(:,1);
    elseif freq(ind) < 3000
        musBox(j:length(snr)+j-1) = snr(:,1);
    else
        musBox(j:length(hat)+j-1) = hat(:,1);
    end
    ind = ind+1;
end
out = musBox;

end