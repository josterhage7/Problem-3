function [range,heightmax, duration] = projectile(velocity,height0, launch_angle)
%Models projectile motion as it occurs on Earth
%   Detailed explanation goes here

ME1 = MException('Angle:error',"Value must be between 0 and 90");
ME2 = MException('Velocity:error', "Value must be greater than 0");
ME3 = MException('Height:error', "Height must be greater than/equal to 0");

if(velocity<=0)
   throw(ME2);
end
if(height0 <0)
    throw(ME3);
end
if(launch_angle <0)||(launch_angle>90)
    throw(ME1);
end
range = ((velocity^2)*sind(2*launch_angle))/9.81;
duration = ((2*velocity)*sind(launch_angle))/9.81;
heightmax = height0 + ((velocity^2)*(sind(launch_angle))^2)/(9.81*2);

time = linspace(0,duration,100);
xcoord = @(velocity, time, launch_angle)velocity*cosd(launch_angle)*time;
ycoord = @(velocity, height0,launch_angle, time)(-0.5*9.8*(time.^2) + velocity*sind(launch_angle)*time + height0);

plot(xcoord(velocity,time, launch_angle), ycoord(velocity,height0,launch_angle,time), 'b-');

end
