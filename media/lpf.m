function new = lpf(sig,n)

%filt = ones(1,n)/n;    % boxcar filter, length n
filt = sinc([-n/10:.1:n/10]);   % sinc interpolator/filter, lenth 2n+1
new = conv(sig,filt);