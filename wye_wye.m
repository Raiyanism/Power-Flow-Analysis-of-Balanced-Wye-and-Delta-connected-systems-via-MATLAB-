function [vPhase,vLine,iLine,iPhase,perPhasePower,totalPower,lineLossPower,perPhasePf,totalPf, reqd_value,reqd_type, pfType]...
    = wye_wye(voltageSource, phaseImpedance, transmissionlineImpedance, sourceFreq, desiredPf, desiredType)
vLine=lineVoltage1(voltageSource);
iLine= lineCurrent1(voltageSource, phaseImpedance, transmissionlineImpedance);
iPhase= iLine;
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

