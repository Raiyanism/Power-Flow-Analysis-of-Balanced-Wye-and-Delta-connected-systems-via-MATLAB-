function [valued] = checkerman(contable, ref)
valued=-100; 
[r,c]= size(contable);

for i=1:r
    
   if ref==contable(i,1) 
    
valued= contable(i,2); break;
end
end

end
