function [matched] = tinder(a,b,c,d)

matched= -1;
if a==c matched=c; end
if a==d matched=d; end
if b==c matched=c; end
if b==d matched=d; end

end

