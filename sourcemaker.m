function [voltageSource] = sourcemaker(voltages,value)
if value==1 
voltageSource(1)= voltages;
voltageSource(2)= voltages*cosd(-120) + i*voltages*sind(-120);
voltageSource(3)= voltages*cosd(120)+ i*voltages*sind(120);
end
if value==2
voltageSource(1)= voltages;
voltageSource(2)= voltages*cosd(120)+ i*voltages*sind(120);
voltageSource(3)= voltages*cosd(-120) + i*voltages*sind(-120);
end
end

