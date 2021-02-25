function [range,heightmax, duration] = projectile(velocity,height0, launch_angle)
%Models projectile motion as it occurs on Earth
%   Detailed explanation goes here
range = ((velocity^2)*sind(2*launch_angle))/9.81;
duration = ((2*velocity)*sind(launch_angle))/9.81;
heightmax = height0 + ((velocity^2)*(sind(launch_angle))^2)/(9.81*2);

time = linspace(0,duration,100);
xcoord = @(velocity, time, launch_angle)velocity*cosd(launch_angle)*time;
ycoord = @(velocity, height0,launch_angle, time)(-0.5*9.8*(time.^2) + velocity*sind(launch_angle)*time + height0);

plot(xcoord(velocity,time, launch_angle), ycoord(velocity,height0,launch_angle,time), 'b-');

end

