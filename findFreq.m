function out = findFreq(X, Fs)
% audio2drum is main function
% use audio as input
Xfft = fft(X);
len1 = length(X);
func = abs(fftshift(Xfft));
% f1 = (-Fs/2 : Fs/len1 : (Fs/2 - Fs/len1));
% figure;
% plot(f1,func);
% title('Frequency response of Snare');
% xlabel('Frequency (Hz)'); ylabel('Amplitude');

[mx, loc] = max(func(round(length(func)/2):length(func)));
sep = 44100/length(func);
out = loc*sep; %actual frequency value in Hz
%below is threshold limit for no sound

if mx < 30
    out = 0;
end
end