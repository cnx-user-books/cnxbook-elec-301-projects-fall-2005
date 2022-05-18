function [r,beats,snr] = mf(orig,nl,fl)

% adds noise to the signal
%n = noise(orig,nl);        % adds noise from a normal(gaussian) dist.
n = orig + whnoise(2000,nl);    % adds white noise to the signal
s = lpf(n,fl);       % noise reduction filter


beats = round(bpm(s,202)); 

if(beats ~= 0)      % if the signal is not a flat line
    
load sigs2      % this file contains the matched filter signals

%x = matched(sinus,beats,60);
%x = sinus;
x = lpf(sinus,fl);
val1 = detect(s,x);

%y = matched(t_inv,beats,100);
%y = t_inv;
y = lpf(t_inv,fl);
val2 = detect(s,y);

z = matched(vtach,beats,108);
z = lpf(z,fl);
val3 = detect(s,z);


m = max([val1,val2,val3]);

if(val1 == m)       % determines which type of signal has the max output
    r = 'Sinus';
elseif(val2 == m)
    r = 'T_Inverted';
else
    r = 'V_Tach';
end

snr = norm(orig)/norm(n - orig);        

else
    r = 'Flat Line';
    snr = 0;
end

%fprintf('\nRhythm: %s\nHeart Rate: %d\nSNR: %f\n\n',r,beats,snr);

        
        