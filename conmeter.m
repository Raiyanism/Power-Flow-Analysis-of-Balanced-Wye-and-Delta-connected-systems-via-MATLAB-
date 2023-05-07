function [outputt] = conmeter(A);

[r, c] = size(A);
outputt= [];
maxnode=0;
for j=1:r
 temp= max(A(j,1:2));
 if temp>maxnode  maxnode=temp; end
end
for j=0:maxnode
   connumber=0;
    for k= 1:r
      if A(k,1)== j || A(k,2)==j
     connumber= connumber+1; end     
    end
    matpat= [j, connumber];
    outputt= [outputt; matpat];
end

outputt(1,2)=outputt(1,2)+1;
outputt(2,2)= outputt(2,2)+1;
end

