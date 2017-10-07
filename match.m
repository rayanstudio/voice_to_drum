function [fOut, sOut] = match(input, bpm)
% audio2drum is main function
    %fOut is output frequencies (16 values)
    %sOut is array to test sounds
    % to test sound use sound(sOut(:,i),fs)
    % where i = 1:16
    input = input(:,1);
    ts = 1/44100;
    duration = (30/bpm)*8*2;
    durLen = round(duration/ts);
    if bpm == 80
        durLen = durLen - 8;
    end
    if bpm == 110
        durLen = durLen - 4;
    end
    if length(input) > durLen
      input = input(1:durLen);
    elseif length(input) < durLen
        input = [input; zeros(durLen-length(input),1)];
    end  
    % this reshapes M x 1 into (M/16) x 16
    % each column is an 1/8 note
    % number of rows depends on BPM
    section = reshape(input,round(length(input)/16), 16);
   
    for i = 1:16
        inputDict(i) = findFreq(section(:,i),44100);
    end
    
    fOut = inputDict; sOut = section;
end