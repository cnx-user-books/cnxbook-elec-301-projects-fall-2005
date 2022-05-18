function m = detect(sig,match)

sig = sig/sqrt(sum(sig.^2));    % normalizes signal values
match = match/sqrt(sum(match.^2));

m = max(conv(sig,fliplr(match))); % calculates max of matched filter  
