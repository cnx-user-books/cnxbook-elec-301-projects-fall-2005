function x = whnoise(len,amp)

amp = amp/30;   % somewhat normalizes to noise function

x = zeros(1,len);

for a = 1:len/2  % frequency of the cos wave
    r = normrnd(0,amp);
    for b = 1:len  % time variable, index of the noise
        x(b) = r*cos(a*pi*b/202) + x(b);
    end
end

%x = x/norm(x);
%x = x*amp;