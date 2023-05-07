function [misery] = lesmiserables(a,b,c,d)
 
if a==c misery=[b,d]; end
if a==d misery = [b,c]; end
if b==c misery=[a,d]; end
if b==d misery = [a,c]; end

end

