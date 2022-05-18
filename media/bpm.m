function b = bpm(s,fs)

max_val = max(s);

t = s>.8*max_val;   % finds values above threshold

loc = [];

if(max_val > 1500)  % check for flat line

    for a = 2:length(s)
        if(t(a) & ~t(a-1))  % identifies groups of values above threshold
            if(length(loc) == 0 | a - loc(end) > 40)
                loc = [loc a];
            end
        end
    end


    % uses average distance between groups of spikes above threshold and
    % sampling frequency to calculate beats per minute
    avg_dif = (loc(end) - loc(1))/(length(loc)-1);
    b = 60*fs/avg_dif;

else
    b = 0;      % heart rate is 0 if the signal is a flat line
end