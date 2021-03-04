noise = 0 + 10.*randn(1000,1);
noise_uni = 0 + 10.*rand(1000,1);
subplot(4,1,1)
histogram(noise, 50);
title('randn - normal distribution');
subplot(4,1,2)
histogram(noise_uni, 50);
title('rand - uniform distribution');

subplot(4,1,3)
time = 0:0.001:0.999;
y = 2*sin(2*pi*time);
noisy = y+noise;
plot(time, noisy);
hold on;
plot (time, y);
title('noise + signal');
%likely not able to guess signal

noise_data = 0 + 10.*randn([1000,100]);
for i=1:100
    noise_data(:,i) = noise_data(:,i) + y.';
end

noise_means = mean(noise_data,2);

subplot(4,1,4)
for i=1:10
    plot(time, noise_data(:,i));
    hold on;
end
plot(time, noise_means, 'LineWidth', 1);
title('noisy + means');