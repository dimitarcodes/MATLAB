function [newSound, newFs] = downsampleSound(soundMatrix, sampleRate, downsampleFactor)
% function [new_sound, newFs] = downsampleSound(soundMatrix, sampleRate, downsampleFactor)
% downsamples a sound according to a given factor
% takes a:
% soundMatrix - matrix of samples comprising the sound
% sampleRate - the sample rate of that matrix (integer, samples per second)
% resampleFactor - factor by which the sampling will be divided/degraded
% and returns:
% newSound - the resampled versions of the sound matrix
% newFS - the new sampling rate (integer, samples per second)
% downSampe(A,B,2) returns newSound, a sound matrix that has half the samples
% of A and newFs, the new sampling rate, equal to B/2.

newSound = soundMatrix(1:downsampleFactor:length(soundMatrix));
newFs = round(sampleRate/downsampleFactor);