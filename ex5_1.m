%% 5.1
load('twitch.mat');

%% 5.1 - a)
stim1 = zeros(1,100);
stim1(10) = 1;

%% 5.1 - b) code
c = conv(stim1, twitch);
time = 1:length(c);
%% 5.1 - b) answer
% I think it is (stimulus + twitch - 1) because the moment of excitation coincides
%% 5.1 - c)
plot(time, c);
xlabel('time (ms)');
ylabel('amplitude');
title('stimulus 1');
%% 5.1 - d)
stim2 = stim1;
stim2(50) = 1;

%% 5.1 - e)
c2 = conv(stim2, twitch);
plot(time, c2);
xlabel('time (ms)');
ylabel('amplitude');
title('stimulus 2');

%% 5.1 - f)
stim3 = stim1;
stim3(20) = 1;
c3 = conv(stim3, twitch);
plot(time, c3);
xlabel('time (ms)');
ylabel('amplitude');
title('stimulus 3');

%% 5.1 - g)
% they add up together to form an even bigger excitation
% it will spasm/contract harder
%% 5.1 - h)
stim4 = zeros(1,100);
targets = 10:2:40;
stim4(targets) = 1;
c4 = conv(stim4, twitch);
plot(time, c4);
xlabel('time (ms)');
ylabel('amplitude');
title('stimulus 4');
%% 5.1 - h) answer
% it looks like a single huge spike with long build-up, which meets my expectations