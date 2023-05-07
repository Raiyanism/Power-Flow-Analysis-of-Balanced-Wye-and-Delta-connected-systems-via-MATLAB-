function [vPhase,vLine,iLine,iPhase,perPhasePower,totalPower,lineLossPower,perPhasePf,totalPf, reqd_value,reqd_type, pfType]...
    = delta_delta(voltageSource, phaseImpedance, transmissionlineImpedance, sourceFreq, desiredPf, desiredType)
vLine=voltageSource;
iLine= lineCurrent4(voltageSource, phaseImpedance, transmissionlineImpedance);
iPhase= phaseCurrent4(voltageSource, phaseImpedance, transmissionlineImpedance);
vPhase= phaseVoltage1(iPhase, phaseImpedance);
perPhasePower= perPhasePwr1(iPhase, phaseImpedance);
totalPower= sum(perPhasePower);
lineLossPower= lineLossPwr1(iLine, transmissionlineImpedance);
perPhasePf= perPhasePf1(perPhasePower);
totalPf= cos(atan(imag(totalPower)/real(totalPower)));
if atan(imag(totalPower)/real(totalPower))>0
    pfType='Lagging';
elseif atan(imag(totalPower)/real(totalPower))<0
    pfType='Leading';
elseif atan(imag(totalPower)/real(totalPower))==0
    pfType='None';
end
Vrms= abs(vPhase(1));
[ reqd_value, reqd_type ]= pfCorrection1(Vrms, perPhasePower, desiredPf, desiredType, sourceFreq);
end
