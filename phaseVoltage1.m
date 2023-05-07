function y= phaseVoltage1(iPhase, phaseImpedance)
for i=1:3
    y(i)=iPhase(i)*phaseImpedance(i);
end
end