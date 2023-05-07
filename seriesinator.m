function [cosmos] = seriesinator(A)
 
A= parallelinator(A);
contable= conmeter(A);
[r,c] =size(A);
dum1 = -3; dum2=-4;

while r~=1
    
 for i=1:r   
    for k=1:r
     
    if i==k continue; end
    comm= tinder(A(i,1), A(i,2), A(k,1), A(k,2));
   
    if comm~=-1 && checkerman(contable, comm)==2
    
    A(i,1:2)= lesmiserables(A(i,1), A(i,2), A(k,1), A(k,2));
    A(i,3)=A(i,3)+A(k,3); A(k,:)=[dum1 dum2 0]; 
    dum1=dum1-3; dum2=dum2-3; contable= conmeter(A);
    end
 end
 end
A= eraser(A); A=parallelinator(A); contable= conmeter(A);
[r,c] =size(A);

end
cosmos=A(1,3);
end