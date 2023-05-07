function [outputt] = eraser(A)
[r,c] =size(A);
outputt=[];
for i=1:r
   if A(i,1)>-1
    outputt=[outputt; A(i,:)];
   end
end

end

