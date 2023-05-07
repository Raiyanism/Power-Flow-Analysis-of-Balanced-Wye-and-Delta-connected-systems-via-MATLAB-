function [outputt] = parallelinator(A)

[r,c] = size(A); 
outputt=[]; 
for k=1:r
if A(k,1:2)==[0 0] continue; end; 

for j=1:r
 if k==j  continue; 
 end  
  if A(k,1:2) == A(j,1:2) | A(k,1:2)== flip(A(j,1:2)) 
  A(k,3) = (A(k,3)*A(j,3))/(A(k,3)+A(j,3)); A(j,:)=[0 0 0];
  
end
end
outputt=[outputt
    A(k,:)];
end
end