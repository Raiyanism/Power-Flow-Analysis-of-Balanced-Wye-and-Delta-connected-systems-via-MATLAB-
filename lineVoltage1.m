function y= lineVoltage1(voltageSource)
y(1)= voltageSource(1)-voltageSource(2);
y(2)= voltageSource(2)-voltageSource(3);
y(3)= voltageSource(3)-voltageSource(1);
end
