function y= lineLossPwr1(iLine,transmissionlineImpedance)
for i=1:3
   iL(i)= (((abs(iLine(i))^2))*transmissionlineImpedance);
end
y=sum(iL);
end