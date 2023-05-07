function y= lineCurrent4(voltageSource, phaseImpedance, transmissionlineImpedance)
a= [ (2*transmissionlineImpedance+phaseImpedance(1)) -transmissionlineImpedance -phaseImpedance(1) voltageSource(1);...
     -transmissionlineImpedance (2*transmissionlineImpedance+phaseImpedance(2)) -phaseImpedance(2) voltageSource(2);...
    -phaseImpedance(1) -phaseImpedance(2) (phaseImpedance(1)+phaseImpedance(2)+phaseImpedance(3)) 0];
iL=complete_gauss_elm(a);
y=[ iL(1) iL(2)-iL(1) -iL(2)];
end