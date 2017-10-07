function out = audio2drum(input, bpm)
% This function does everything. All you need is to enter
% input 'example.wav' and bpm i.e. 110
    [voice, fs] = audioread(input);
    [fOut, ~] = match(voice, bpm);
    out = produced(fOut, bpm);
    sound(out,fs);
end