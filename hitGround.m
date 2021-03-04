function [time, velocity, h_half] = hitGround(height, g)
% function [time] = hitGround(height)
% function that takes the height from which
% an object is dropped (in vacuum) and the
% acceleration of the gravity (in m/s^2)
% and returns: 
% 'time' - the time it takes for it to hit the ground 
% 'velocity' - the velocity at time of collision
% 'h_half' - the distance it has covered when half of the
% time to collision has elapsed

time = sqrt(height./g);
velocity = time.*g;
h_half = 0.5*g*(time.*time/4);
