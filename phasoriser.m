function [outputt] = phasoriser(A, freq)
 
omeg = 2*pi*freq;

[r,c]= size(A);


for k=1:r
if A(k,3)==2
   A(k,3) =(-i)* (1/(omeg*A(k,4))); 
end

if A(k,3) == 3
    A(k,3) = i*omeg*A(k,4);
end
    if A(k,3)==1
        A(k,3)= A(k,4);
    end
    
end
    


A(:,4) = [];
outputt= A;
end
