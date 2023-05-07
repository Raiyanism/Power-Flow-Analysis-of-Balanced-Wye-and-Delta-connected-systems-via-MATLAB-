function [y,c]= pfCorrection1( Vrms, perPhasePower, desiredPf, pf_type, sourceFreq)
if pf_type==1
  mult=-1;  
end
if pf_type==2
mult=1;
end
for i=1:3
    Qdiff(i)=200;
    reqQ(i)= real(perPhasePower(i))*tan(mult*acos(desiredPf));
    presQ(i) = imag(perPhasePower(i));
    if presQ(i)> 0 multaa(i)=1 
    else multaa(i)=-1 
    end
    
    if presQ(i)>reqQ(i)
    c(i) = 2;
    end
    if presQ(i)<reqQ(i)
     c(i) =1;   
    end
    if abs(presQ(i)-reqQ(i))<0.00001
    c(i) =3; Qdiff(i) =0;
    end
    
    if mult==multaa(i) && Qdiff(i)~=0 
        Qdiff(i)= abs(abs(presQ(i))- abs(reqQ(i))); end
      if mult==(-1)*multaa(i) && Qdiff(i)~=0 
        Qdiff(i)= abs(abs(presQ(i))+ abs(reqQ(i))); end   
    
end

for i=1:3
   
    if c(i)==2
       y(i) =(Vrms^2)/(2*pi*sourceFreq*Qdiff(i));
    end
    
    if c(i) ==1
      y(i) = Qdiff(i)/((Vrms^2) *2*pi*sourceFreq);  
    end
    if c(i)==0
    y(i)=0;
    end
end

end
