function y= lineCurrent3(voltageSource, phaseImpedance, transmissionlineImpedance)
a=[ (2*transmissionlineImpedance+phaseImpedance(1)+ phaseImpedance(2)) -(phaseImpedance(2)+transmissionlineImpedance) voltageSource(1);...
    -(phaseImpedance(2)+transmissionlineImpedance) (2*transmissionlineImpedance+phaseImpedance(3)+ phaseImpedance(2)) voltageSource(2)];
iL=complete_gauss_elm(a);
y=[ iL(1) iL(2)-iL(1) -iL(2) ];
end

