[bw, fs] = audioread("bluewhale.au");

dt=1/fs;
t = 0:dt:(length(bw) -1) * dt;

plot(t, bw);
xlabel('time (s)');
ylabel('amplitude');
title('Blue Whale audio');
%sound(bw, fs);

soundA = bw(1:4*fs);
soundB = bw(5*fs:9*fs - 1);

ogFs = 0.1*fs;
ogdt = 1/ogFs;
t = 0:ogdt:(length(soundA) -1) * ogdt;

subplot(2,1,1);
plot(tA, soundA);
xlabel('time (s)');
ylabel('amplitude');
title('Blue Whale garbled noise');
subplot(2,1,2);
plot(tB, soundB);
xlabel('time (s)');
ylabel('amplitude');
title('Blue Whale foghorn sound');

[rangeA, ampA, nyqA] = fourier_transform(t, soundA);
[rangeB, ampB, nyqB] = fourier_transform(t, soundB);

disp(['nyquist frequency of soundA: ', num2str(nyqA)]);
% the nyquist of soundA is 200hz, because I'm using the original
% frequency, with frequency of 4000hz, the nyquist is 2000hz

disp(['nyquist frequency of soundB: ', num2str(nyqB)]);
% the nyquist of soundB is 200hz, because I'm using the original
% frequency, with frequency of 4000hz, the nyquist is 2000hz

subplot(2,1,1);
stem(rangeA, ampA);
xlabel('frequency (Hz)');
ylabel('amplitude');
title('Blue Whale garbled noise (fourier''d)');
subplot(2,1,2);
stem(rangeB, ampB);
xlabel('frequency (Hz)');
ylabel('amplitude');
title('Blue Whale foghorn sound (fourier''d)');

% sound B has clearer, louder and more peaks than soundA