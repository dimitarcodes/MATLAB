[logoff_sound,sampleRate] = audioread('logoff.wav');
high = max(abs(logoff_sound), [], 'all');
%sound(logoff_sound, sampleRate);
duration = (length(logoff_sound) - 1)*1/sampleRate;
t = 0:1/sampleRate: duration;

subplot(3,1,1);
plot(t, logoff_sound);
xlim([0 duration]);
ylim([-1*high high]);
title('Windows "Log Off" Sound');
legend('channel 1', 'channel 2');
xlabel('time (s)');
ylabel('amplitude');
% saveas(gcf, 'logoff.png');

lowampres = round(logoff_sound * 10)/10;
subplot(3,1,2);
plot(t, lowampres);
title([{'Windows "Log Off" Sound'},{'with lower amplitude resolution'}]);
xlim([0 duration]);
ylim([-1*high high]);
legend('channel 1', 'channel 2');
xlabel('time (s)');
ylabel('amplitude');
% the amplitude seems to be using only 7 values (6 steps)
%sound(lowampres, sampleRate);
lowerampres = round(lowampres * 10)/10;
%sound(lowerampres, sampleRate);
% during the first downscaling of the resolution the amplitudes were
% assigned to their closest value (and it had only 7 values) which means a
% lot of sounds were assigned to a value higher than their original one
% during the rounding. Now those already higher values are amplified again
% which produces an even louder soundwave (larger amplitudes).

A_max = max(abs(logoff_sound), [], 'all');
clipped_sound = logoff_sound;
clip_factor = 0.8;
clipped_sound(clipped_sound> clip_factor*A_max) = clip_factor*A_max; 
clipped_sound(clipped_sound< -1*clip_factor*A_max) = -1*clip_factor*A_max; 
subplot(3,1,3);
plot(t, clipped_sound);
title([{'Windows "Log Off" Sound'},{'with 80% of max amplitude clipping'}]);
xlim([0 duration]);
ylim([-1*high high]);
legend('channel 1', 'channel 2');
xlabel('time (s)');
ylabel('amplitude');
%saveas(gcf,'windows_logoff.png');
%sound(clipped_sound, sampleRate);

% at 80% I personally can't hear the difference but plotting the sound 
% makes it obvious that the sound never goes beyond a particular amplitude

% as we lower the amplitude the sound gets quiter, which makes sense since
% we've decreased the amplitude which is effectively the loudness 