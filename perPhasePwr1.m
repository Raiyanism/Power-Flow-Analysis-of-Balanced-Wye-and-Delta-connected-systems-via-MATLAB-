function y= perPhasePwr1(iPhase,phaseImpedance)
for i=1:3
   y(i)= (((abs(iPhase(i))^2))*phaseImpedance(i));
end
end